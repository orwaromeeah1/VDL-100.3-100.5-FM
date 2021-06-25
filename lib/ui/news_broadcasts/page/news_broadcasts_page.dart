import 'package:flutter/material.dart';
import 'package:vdl/data/models/days_news_broadcasts_model.dart';
import 'package:vdl/data/models/news_broadcast_model.dart';
import 'package:vdl/ui/news_broadcasts/widget/days_news_broadcasts_list_widget.dart';
import 'package:vdl/utils/project_colors/project_color.dart';


class NewsBroadcastsPage extends StatefulWidget {
  @override
  _NewsBroadcastsPageState createState() => _NewsBroadcastsPageState();
}

class _NewsBroadcastsPageState extends State<NewsBroadcastsPage> with TickerProviderStateMixin<NewsBroadcastsPage>{
  double width;
//fake data
  List<DaysNewsBroadcasts> daysNews = [
    new DaysNewsBroadcasts(
        date: '24-06-2021',
        broadcasts: [
          new NewsBroadcast(
              id: '1',
              time: '7:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '8:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '14:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '17:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '10:15'
          ),
        ]
    ),
    new DaysNewsBroadcasts(
        date: '24-06-2021',
        broadcasts: [
          new NewsBroadcast(
              id: '1',
              time: '7:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '8:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '14:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '17:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '10:15'
          ),
        ]
    ),
    new DaysNewsBroadcasts(
        date: '24-06-2021',
        broadcasts: [
          new NewsBroadcast(
              id: '1',
              time: '7:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '8:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '14:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '17:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '10:15'
          ),
        ]
    ),
    new DaysNewsBroadcasts(
        date: '24-06-2021',
        broadcasts: [
          new NewsBroadcast(
              id: '1',
              time: '7:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '8:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '14:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '17:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '10:15'
          ),
        ]
    ),
    new DaysNewsBroadcasts(
        date: '24-06-2021',
        broadcasts: [
          new NewsBroadcast(
              id: '1',
              time: '7:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '8:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '14:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '17:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '10:15'
          ),
        ]
    ),
    new DaysNewsBroadcasts(
        date: '24-06-2021',
        broadcasts: [
          new NewsBroadcast(
              id: '1',
              time: '7:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '8:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '14:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '17:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '10:15'
          ),
        ]
    ),
    new DaysNewsBroadcasts(
        date: '24-06-2021',
        broadcasts: [
          new NewsBroadcast(
              id: '1',
              time: '7:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '8:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '14:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '17:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '10:15'
          ),
        ]
    ),
    new DaysNewsBroadcasts(
        date: '24-06-2021',
        broadcasts: [
          new NewsBroadcast(
              id: '1',
              time: '7:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '8:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '14:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '17:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '10:15'
          ),
        ]
    ),
    new DaysNewsBroadcasts(
        date: '24-06-2021',
        broadcasts: [
          new NewsBroadcast(
              id: '1',
              time: '7:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '8:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '14:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '17:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '10:15'
          ),
        ]
    ),
    new DaysNewsBroadcasts(
        date: '24-06-2021',
        broadcasts: [
          new NewsBroadcast(
              id: '1',
              time: '7:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '8:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '14:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '17:15'
          ),
          new NewsBroadcast(
              id: '1',
              time: '10:15'
          ),
        ]
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;



    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  height: 230,
                  width: width,
                  color: ProjectColors.BLACK,
                  padding: EdgeInsets.only(right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          'نشرات الأخبار',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      Text(
                        'إضغط على النشرة التي تريد الإستماع إليها',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            new Container(
                alignment: Alignment.bottomCenter,
                padding: new EdgeInsets.only(top: 160, right: 20.0, left: 20.0,bottom: 50),
                child:ListView.builder(
                    itemCount: daysNews.length,
                    physics: NeverScrollableScrollPhysics(),
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
                                  daysNews[index].isOpened = !daysNews[index].isOpened;
                                });
                              },
                              child: Container(
                                width: width,
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                                color: daysNews[index].isOpened ? ProjectColors.ThemeColor : Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                       Text(
                                         '${daysNews[index].date}',
                                         style: TextStyle(
                                           color: daysNews[index].isOpened ? Colors.white : Colors.black,
                                         ),
                                       ),
                                    Icon(
                                      daysNews[index].isOpened
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color:daysNews[index].isOpened
                                          ? Colors.white
                                          : Colors.black ,
                                    )
                                  ],
                                ),
                              )
                            ),
                            new AnimatedSize(
                                vsync: this,
                                duration: const Duration(milliseconds: 500),
                                child: new ConstrainedBox(
                                    constraints: daysNews[index].isOpened
                                        ? new BoxConstraints()
                                        : new BoxConstraints(maxHeight: 0.0),
                                    child:DaysNewsBroadcastsWidget(
                                      broadcasts: daysNews[index].broadcasts,
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
      ),
    );
  }
}
