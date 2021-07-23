<<<<<<< HEAD
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
=======
//import 'package:audioplayers/audioplayers.dart';
>>>>>>> 568ec768b65e80024bf6b2b042531e92a12543f4
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:vdl/core/Manager.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_bloc.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_event.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_state.dart';

import 'package:vdl/ui/news/widgets/news_card_widget.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class NewsPageDetails extends StatefulWidget {
  final int newsId;
  String tag;
  final bool isSpecial;
  NewsPageDetails(
      {Key key, @required this.newsId, this.tag, @required this.isSpecial})
      : super(key: key);

  @override
  _NewsPageDetailsState createState() => _NewsPageDetailsState();
}

class _NewsPageDetailsState extends State<NewsPageDetails>
    with TickerProviderStateMixin {
  final _bloc = locator<NewsDetailsBloc>();

  AnimationController _animationController;
  bool isPlaying = false;

//  AudioPlayer audioPlayer = AudioPlayer();
//  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  String url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3';

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;
  //

  @override
  void initState() {
    super.initState();

    _bloc.add(FetchNewsDetails(widget.newsId, widget.isSpecial));

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }
    /// Compulsory
    ///
    ///
//    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
//      setState(() {
//        audioPlayerState = state;
//      });
//    });

    /// Optional
//    audioPlayer.setUrl(
//        url); // Triggers the onDurationChanged listener and sets the max duration string
//    audioPlayer.onDurationChanged.listen((Duration duration) {
//      setState(() {
//        audioDuration = duration.inSeconds;
//      });
//    });
//    audioPlayer.onAudioPositionChanged.listen((Duration position) async {
//      setState(() {
//        timeProgress = position.inSeconds;
//      });
//    });
//  }

  /// Compulsory
//  @override
//  void dispose() {
////    audioPlayer.release();
////    audioPlayer.dispose();
//    super.dispose();
//  }

  /// Compulsory
//  playMusic() async {
//    // Add the parameter "isLocal: true" if you want to access a local file
//    await audioPlayer.play(url);
//  }

  /// Compulsory
//  pauseMusic() async {
//    await audioPlayer.pause();
//  }

//  String getTimeString(int seconds) {
//    String minuteString =
//        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
//    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
//    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        body: BlocConsumer(
            bloc: _bloc,
            builder: (context, state) {
              if (state is Loaded) {
                return LoadedScreen(context, state);
              } else if (state is Loading) {
                return LoadingScreen();
              }
              return Container();
            },
            listener: (context, state) {}));
  }

  ///////
  ///
  ///
  ///
  ///
  ///
  ///

  Widget LoadedScreen(BuildContext context, Loaded state) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate:
                MyDynamicHeader(expandedHeight: height / 2.5, state: state),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.14),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ]),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 19.0, right: 19, top: 38),
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.14),
                                  blurRadius: 10,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: blue.withOpacity(0.41),
                                    child: CircleAvatar(
                                      backgroundColor: blue,
                                      radius: 15,
                                      child: InkWell(
                                        onTap: () => _handleOnPressed(),
                                        child: AnimatedIcon(
                                          icon: AnimatedIcons.play_pause,
                                          progress: _animationController,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, left: 15),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            Manager.removeAllHtmlTags(
                                                state.newsModel.title),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.recordingtape,
                                              color: blue,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              getTimeString(
                                                  audioDuration - timeProgress),
                                              style: TextStyle(
                                                  color:
                                                      black.withOpacity(0.41),
                                                  fontSize: 12),
                                            ),
<<<<<<< HEAD
                                          ],
                                        )
                                      ],
=======
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.recordingtape,
                                                color: blue,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                               '' /*getTimeString(audioDuration -
                                                    timeProgress)*/,
                                                style: TextStyle(
                                                    color:
                                                        black.withOpacity(0.41),
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
>>>>>>> 568ec768b65e80024bf6b2b042531e92a12543f4
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 19.0, top: 17, left: 19),
                          child: Container(
                            child: Text(
                              state.newsModel.humanDate,
                              style: TextStyle(
                                  color: black.withOpacity(0.41),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 19.0, top: 4, left: 19),
                          child: Container(
                            child: Text(
                              Manager.removeAllHtmlTags(state.newsModel.title),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 19.0,
                            top: 9,
                            left: 19,
                          ),
                          child: Container(
                            child: Text(
                              Manager.removeAllHtmlTags(
                                  state.newsModel.content),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 19.0, left: 19, bottom: 34),
                          child: Container(
                            child: Text(
                              Manager.removeAllHtmlTags(
                                  state.newsModel.excerpt),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            state.newsModel.relatedArticles.isEmpty
                ? Container()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 19.0, top: 34, left: 19, bottom: 15),
                        child: Container(
                          child: Center(
                            child: Text(
                              'اقرأ ايضا',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 400,
                        child: Swiper(
                          itemHeight: 330,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 24),
                              child: NewsCardWidget(
                                newsModel: newsModelFromRelatedArticle(
                                  state.newsModel.relatedArticles[index],
                                ),
                                tag: widget.tag,
                              ),
                            );
                          },
                          itemCount: state.newsModel.relatedArticles.length,
                          pagination: SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.grey,
                                  activeColor: Colors.green,
                                  size: 10.0,
                                  activeSize: 10.0)),
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: 50,
            )
          ])),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

////
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  void _handleOnPressed() {
    setState(() {
//      isPlaying = !isPlaying;
//      isPlaying
//          ? _animationController.forward()
//          : _animationController.reverse();
//      isPlaying ? playMusic() : pauseMusic();
    });
  }
}

/////
///
///
///
///
///
///
///
///
///
///
///
///
class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  double expandedHeight;
  Loaded state;
  MyDynamicHeader({@required this.expandedHeight, this.state});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var width = MediaQuery.of(context).size.width;

    var height = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: Stack(
            children: [
              Stack(
                children: [
                  Positioned(
                    left: 19,
                    top: 40,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        radius: 16,
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: black.withOpacity(0.71),
                      ),
                    ),
                  ),
                ],
              ),
              // Positioned(
              //   child:
              //   top: 35,
              //   right: 20,
              // )
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    CachedNetworkImageProvider(state.newsModel.image.original),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: shrinkOffset < minExtent
              ? expandedHeight - (height / 18) - shrinkOffset
              : expandedHeight - (height / 18) - minExtent,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.14),
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(48 / 2)),
                  child: Icon(
                    Icons.reply,
                    color: green,
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                CircleAvatar(
                  radius: 32,
                  backgroundColor: green.withOpacity(0.41),
                  child: CircleAvatar(
                    backgroundColor: green,
                    radius: 25,
                    child: Icon(
                      CupertinoIcons.speaker_2_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight / 2;
}
