import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vdl/data/models/news_broadcast_details_model.dart';
import 'package:vdl/data/responses/news_cast_response.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_broadcas_details/news_broadcast_details_bloc.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_broadcas_details/news_broadcast_details_event.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_broadcas_details/news_broadcast_details_state.dart';
import 'package:vdl/ui/news_broadcasts/widget/broadcast_card.dart';
import 'package:vdl/ui/shared_widget/app_progress_indicator.dart';
import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/utils/project_colors/project_color.dart';
import 'package:share/share.dart';

import '../../../../injection.dart';

class NewsBroadcastDetailsPage extends StatefulWidget {
  final NewsCastResponse newsCast;
  final int timeSlutIndex;
  final List<String> broadcasts;

  NewsBroadcastDetailsPage({
    @required this.newsCast,
    @required this.timeSlutIndex,
    @required this.broadcasts,
  }):assert(newsCast != null && timeSlutIndex != null && broadcasts != null);

  @override
  _NewsBroadcastDetailsPageState createState() => _NewsBroadcastDetailsPageState();
}

class _NewsBroadcastDetailsPageState extends State<NewsBroadcastDetailsPage>
    with TickerProviderStateMixin {
  double width;
  int selectedIndex = 0;
  final _controller = ScrollController();
  final _height = 100.0;
  NewsCastDetailsModel displayedNewsCast = new NewsCastDetailsModel() ;
  final _bloc = locator<NewsCastDetailsBloc>();

  AnimationController _animationController;
  AnimationController _fullAudioAnimationController;

  bool isPlaying = false;
  bool isFullAudioPlaying = false;
  Duration duration;
  AudioPlayer introductionAudioPlayer = AudioPlayer();
  AudioPlayer fullAudioPlayer = AudioPlayer();

  bool audiosLoaded = false;

  String introductionAudioUrl = '';
  String fullAudioUrl = '';

  int introductionTimeProgress = 0;
  int fullTimeProgress = 0;
  int introductionAudioDuration = 0;
  int fullAudioDuration = 0;

   String introductionId = '';
   String fullAudioId = '';

  @override
  void initState() {
   selectedIndex = widget.timeSlutIndex;
    super.initState();

   _getContent();
   _fetchAudios();

   _animationController =
       AnimationController(vsync: this, duration: Duration(milliseconds: 450));
   // Triggers the onDurationChanged listener and sets the max duration string
   introductionAudioPlayer.onDurationChanged.listen((Duration duration) {
     setState(() {
       introductionAudioDuration = duration.inSeconds;
     });
   });
   introductionAudioPlayer.onAudioPositionChanged.listen((Duration position) async {
     setState(() {
       introductionTimeProgress = position.inSeconds;
     });
   });

   _fullAudioAnimationController =
       AnimationController(vsync: this, duration: Duration(milliseconds: 450));
   // Triggers the onDurationChanged listener and sets the max duration string
   fullAudioPlayer.onDurationChanged.listen((Duration duration) {
     setState(() {
       fullAudioDuration = duration.inSeconds;
     });
   });
   introductionAudioPlayer.onAudioPositionChanged.listen((Duration position) async {
     setState(() {
       fullTimeProgress = position.inSeconds;
     });
   });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;


    WidgetsBinding.instance
        .addPostFrameCallback((_) { _animateToIndex(selectedIndex);});


    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        if (state is AudiosLoaded) {
          setState(() {
            log('audios fully loaded');
            isPlaying= false;
            isFullAudioPlaying = false;
            audiosLoaded = true;
            introductionAudioUrl = state.introAudio.file.url;
            fullAudioUrl = state.fullAudio.file.url;
          });
        }
      },
      child:screenUi() ,
    );



  }

  Widget screenUi(){
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: new Container(
              height: 250,
              width: width,
              color: ProjectColors.BLACK,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'نشرة الأخبار',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.newsCast.slug}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
          ),
          new Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 210),
              padding: new EdgeInsets.only(top: 0, right: 20.0, left: 20.0,bottom: 50),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    child: ListView.builder(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: widget.broadcasts.length,
                        itemBuilder: (BuildContext context,int index){
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                                _animateToIndex(index);
                                _getContent();
                                _fetchAudios();
                              });
                            },
                            child: BroadcastCard(
                              isSelected: selectedIndex == index,
                              isAvailable: true,
                              time: widget.broadcasts[index],
                            ),
                          );
                        }
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.495,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 0),
                      children: [
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        GlowingCircularButton(

                                          size: 25,
                                          color: ProjectColors.ThemeColor,
                                          icon:audiosLoaded
                                              ? AnimatedIcon(
                                            icon: AnimatedIcons.play_pause,
                                            progress: _animationController,
                                            size: 15,
                                            color: Colors.white,
                                          )
                                          :VdlProgressIndicator(size: 5,color: Colors.white,),

                                          onClick: (){
                                            !audiosLoaded
                                            ? log('')
                                            : _handleOnIntoPressed();
                                          },
                                          isGlowing: true,
                                        ),
                                        SizedBox(width: 20,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'مقدمة النشرة',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),


                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.keyboard_voice,
                                                  color: ProjectColors.ThemeColor,
                                                ),
                                                Text(
                                                  getTimeString(introductionAudioDuration -
                                                      introductionTimeProgress),
                                                  style: TextStyle(
                                                      color: Colors.grey
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Share.share(widget.newsCast.link);
                                      },
                                      child: Icon(
                                          Icons.share
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                      '${displayedNewsCast.description}'
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        GlowingCircularButton(

                                          size: 25,
                                          color: ProjectColors.ThemeColor,
                                          icon:audiosLoaded
                                              ? AnimatedIcon(
                                            icon: AnimatedIcons.play_pause,
                                            progress: _fullAudioAnimationController,
                                            size: 15,
                                            color: Colors.white,
                                          )
                                              :VdlProgressIndicator(size: 5,color: Colors.white,),

                                          onClick: (){
                                             _handleOnFullAudioPressed();
                                          },
                                          isGlowing: true,
                                        ),
                                        SizedBox(width: 20,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'النشرة كاملة',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),


                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.keyboard_voice,
                                                  color: ProjectColors.ThemeColor,
                                                ),
                                                Text(
                                                  '01:55',
                                                  style: TextStyle(
                                                      color: Colors.grey
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Share.share(widget.newsCast.link);
                                      },
                                      child: Icon(
                                          Icons.share
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),



                ],
              )
          )
        ],
      ),
    );
  }
  _animateToIndex(i) => _controller.animateTo(
      _height * i,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn);


  _getContent(){


    switch(selectedIndex){
      case 0:{
        displayedNewsCast.description =  widget.newsCast.shortAudioDescriptionBlock715 ;
        introductionId = widget.newsCast.shortAudioFieldBlock715;
        fullAudioId = widget.newsCast.audioFieldBlock715;
        break;}
      case 1:{
        displayedNewsCast.description = widget.newsCast.shortAudioDescriptionBlock815;
        introductionId = widget.newsCast.shortAudioFieldBlock815;
        fullAudioId = widget.newsCast.audioFieldBlock815;
        break;}
      case 2:{
        displayedNewsCast.description =  widget.newsCast.shortAudioDescriptionBlock1415 ;
        introductionId = widget.newsCast.shortAudioFieldBlock1415;
        fullAudioId = widget.newsCast.audioFieldBlock1415;
        break;}
      case 3:{
        displayedNewsCast.description =  widget.newsCast.shortAudioDescriptionBlock1715 ;
        introductionId = widget.newsCast.shortAudioFieldBlock1715;
        fullAudioId = widget.newsCast.audioFieldBlock1715;
        break;}
      case 4:{
        displayedNewsCast.description = widget.newsCast.shortAudioDescriptionBlock1915 ;
        introductionId = widget.newsCast.shortAudioFieldBlock1915;
        fullAudioId = widget.newsCast.audioFieldBlock1915;
        break;}
    }

    displayedNewsCast.description = Bidi.stripHtmlIfNeeded('${displayedNewsCast.description}');

  }



  /// Compulsory
  playIntroduction() async {
    await introductionAudioPlayer.setUrl(
        introductionAudioUrl); // prepare the player with this audio but do not start playing
    await introductionAudioPlayer.setReleaseMode(ReleaseMode.STOP);
    int result = await introductionAudioPlayer.play(introductionAudioUrl);
    if (result == 1) {
      // success
    }
    introductionAudioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      setState(() => {print(d)});
    });
  }

  playFullAudio() async {
    await fullAudioPlayer.setUrl(
        fullAudioUrl); // prepare the player with this audio but do not start playing
    await fullAudioPlayer.setReleaseMode(ReleaseMode.STOP);
    int result = await fullAudioPlayer.play(fullAudioUrl);
    if (result == 1) {
      // success
    }
    fullAudioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      setState(() => {print(d)});
    });
  }

  /// Compulsory
  pauseIntroduction() async {
    int result = await introductionAudioPlayer.pause();
  }

  stopIntroduction() async {
    int result = await introductionAudioPlayer.stop();
  }

  pauseFullAudio() async {
    int result = await fullAudioPlayer.pause();
  }

  stopFullAudio() async {
    int result = await fullAudioPlayer.stop();
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }

  /// Compulsory
  @override
  void dispose() {
    introductionAudioPlayer.release();
    introductionAudioPlayer.dispose();
    super.dispose();
  }

  void _handleOnIntoPressed() {
    setState(() {
      isPlaying = !isPlaying;
      if(isPlaying){
        _animationController.forward();
        _fullAudioAnimationController.reverse();
        pauseFullAudio();
        playIntroduction();

      }else{
        _animationController.reverse();
        pauseIntroduction();
      }

    });
  }
  void _handleOnFullAudioPressed() {
    setState(() {
      isFullAudioPlaying = !isFullAudioPlaying;

      if(isFullAudioPlaying){
        _fullAudioAnimationController.forward();
        _animationController.reverse();
        pauseIntroduction();
        playFullAudio();

      }else{
        _fullAudioAnimationController.reverse();
        pauseFullAudio();
      }

    });
  }

  _fetchAudios(){
    audiosLoaded = false;
    stopFullAudio();
    stopIntroduction();
    _animationController.reverse();
    _fullAudioAnimationController.reverse();
    _bloc.add(FetchAudios(introductionId: introductionId,fullAudioId: fullAudioId));
  }
}
