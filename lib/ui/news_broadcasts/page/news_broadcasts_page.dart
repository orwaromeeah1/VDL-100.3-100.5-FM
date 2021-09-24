import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/days_news_broadcasts_model.dart';
import 'package:vdl/data/models/news_broadcast_model.dart';
import 'package:vdl/data/responses/news_cast_response.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_cast_bloc.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_cast_event.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_cast_state.dart';
import 'package:vdl/ui/news_broadcasts/widget/days_news_broadcasts_list_widget.dart';
import 'package:vdl/ui/shared_widget/error_screen.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

import '../../../injection.dart';


class NewsBroadcastsPage extends StatefulWidget {
  AudioPlayer introductionAudioPlayer;
  NewsBroadcastsPage({this.introductionAudioPlayer});
  @override
  _NewsBroadcastsPageState createState() => _NewsBroadcastsPageState();
}

class _NewsBroadcastsPageState extends State<NewsBroadcastsPage> with TickerProviderStateMixin<NewsBroadcastsPage>{
  double width;


  List<NewsCastResponse> newsCasts = [];
  final _bloc = locator<NewsCastBloc>();

  @override
  void initState() {
    _bloc.add(FetchNewsCast());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, NewsCastState state) {
          if (state is NewsCastEmpty) {
            _bloc.add(FetchNewsCast());
          }
          if (state is NewsCastError) {
            return ErrorScreen(
              onRetry: () => _bloc.add(FetchNewsCast()),
            );
          }
          if (state is NewsCastLoaded) {
            newsCasts = state.newsCasts;
            return screenUi();
          }

          if (state is NewsCastLoading) {
            return LoadingScreen();
          }

          return Center(
            child: screenUi(),
          );
        });
  }

  Widget screenUi(){
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: new Container(
              height: 217,
              width: width,
              color: ProjectColors.BLACK,
              padding: EdgeInsets.only(right: 30,top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                    'نشرات الأخبار',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'إضغط على النشرة التي تريد الإستماع إليها',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          new Container(
              margin: EdgeInsets.only(top: 186),
              alignment: Alignment.bottomCenter,
              padding: new EdgeInsets.only(top: 0, right: 20.0, left: 20.0,bottom: 50),
              child:ListView.builder(
                  itemCount: newsCasts.length,
                  padding: EdgeInsets.only(top: 0),
                  shrinkWrap: true,
                  itemBuilder:  (BuildContext context, int index){
                    return
                      Container(
                        width: width*0.8,
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    newsCasts[index].isOpened = !newsCasts[index].isOpened;
                                  });
                                },
                                child: Container(
                                  width: width,
                                  height: 55,
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                  color: newsCasts[index].isOpened ? ProjectColors.ThemeColor : Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${newsCasts[index].slug}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: newsCasts[index].isOpened ? Colors.white : Colors.black,
                                        ),
                                      ),
                                      Icon(
                                        newsCasts[index].isOpened
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        color:newsCasts[index].isOpened
                                            ? Colors.white
                                            : ProjectColors.ThemeColor,
                                      )
                                    ],
                                  ),
                                )
                            ),
                            new AnimatedSize(
                                vsync: this,
                                duration: const Duration(milliseconds: 500),
                                child: new ConstrainedBox(
                                    constraints: newsCasts[index].isOpened
                                        ? new BoxConstraints()
                                        : new BoxConstraints(maxHeight: 0.0),
                                    child:DaysNewsBroadcastsWidget(
                                      broadcasts: newsCasts[index].timeSlots,
                                      date: newsCasts[index].slug,
                                      newsCast: newsCasts[index],
                                      introductionAudioPlayer: widget.introductionAudioPlayer,
                                    )
                                )
                            ),
                          ],
                        ),
                      );
                  }
              )
          )
        ],
      ),
    );
  }
}
