import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vdl/data/models/news_broadcast_details_model.dart';
import 'package:vdl/data/responses/news_cast_response.dart';
import 'package:vdl/ui/news_broadcasts/widget/broadcast_card.dart';
import 'package:vdl/ui/programs/widget/news_broadcast_player.dart';
import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

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

class _NewsBroadcastDetailsPageState extends State<NewsBroadcastDetailsPage> {
  double width;
  int selectedIndex = 0;
  final _controller = ScrollController();
  final _height = 100.0;
  NewsCastDetailsModel displayedNewsCast = new NewsCastDetailsModel() ;

  @override
  void initState() {
   selectedIndex = widget.timeSlutIndex;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    _getContent();

    WidgetsBinding.instance
        .addPostFrameCallback((_) { _animateToIndex(selectedIndex);});


    return Scaffold(
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
                                        icon:Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        onClick: (){},
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
                                  Icon(
                                      Icons.share
                                  )
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
                                        icon:Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        onClick: (){},
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
                                  Icon(
                                      Icons.share
                                  )
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )

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
        break;}
      case 2:{
        displayedNewsCast.description = widget.newsCast.shortAudioDescriptionBlock815;
        break;}
      case 3:{
        displayedNewsCast.description =  widget.newsCast.shortAudioDescriptionBlock1415 ;
        break;}
      case 4:{
        displayedNewsCast.description =  widget.newsCast.shortAudioDescriptionBlock1715 ;
        break;}
      case 5:{
        displayedNewsCast.description = widget.newsCast.shortAudioDescriptionBlock1915 ;
        break;}
    }

    displayedNewsCast.description = Bidi.stripHtmlIfNeeded(displayedNewsCast.description);

  }
}
