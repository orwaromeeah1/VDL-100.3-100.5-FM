import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdl/ui/programs/widget/episode_card.dart';

class ProgramDetailsPage extends StatefulWidget {
  @override
  _ProgramDetailsPageState createState() => _ProgramDetailsPageState();
}

class _ProgramDetailsPageState extends State<ProgramDetailsPage> {
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: <Widget>[
              // image
              new Column(
                children: <Widget>[
                  new Container(
                    height: 250,
                    width: width,
                    padding: EdgeInsets.only(top: 40),
                    child: CachedNetworkImage(
                      imageUrl: 'https://www.vdl.me/wp-content/uploads/2021/05/Sawt-Jdid.jpg',
                      imageBuilder: (context, imageProvider) =>
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
              new Container(
                  alignment: Alignment.bottomCenter,
                  padding:
                      new EdgeInsets.only(top: 225, right: 10.0, left: 10.0),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.refresh,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20,left: 20),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(

                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.8),
                                      blurRadius: 20,
                                      offset: Offset(4, 4,), // Shadow position
                                    ),
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.8),
                                      blurRadius: 20,
                                      offset: Offset(-4, -4,), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.volume_down,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'برنامج شبابي-حواري بالتعاون مع مكتب اليونيكسو في بيروت',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Icon(Icons.watch_later,color: Colors.green,),
                          Text(
                            'من الاثنين إلى الخميس بعد نشرة الخامسة والربع مساء'
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(
                          'الحلقات',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context,int index){
                            return EpisodeCard(
                              image: 'https://www.vdl.me/wp-content/uploads/2021/05/Sawt-Jdid.jpg',
                              date: '23 شباط 2020',
                              title: 'عقد المكتب السياسي اجتماعه الاسبوعي برئاسة رئيس الحزب',
                              episodeNumber: 'الحلقة الأولى',
                            );
                          }

                      ),

                    ],
                  ),

              )
            ],
          ),


        ),
      ),
    );
  }
}
