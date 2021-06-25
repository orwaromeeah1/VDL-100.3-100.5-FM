import 'package:flutter/material.dart';
import 'package:vdl/data/models/news_broadcast_model.dart';
import 'package:vdl/ui/news_broadcasts/widget/broadcast_card.dart';
import 'package:vdl/ui/programs/widget/news_broadcast_player.dart';
import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class NewsBroadcastDeteilsPage extends StatefulWidget {
  @override
  _NewsBroadcastDeteilsPageState createState() => _NewsBroadcastDeteilsPageState();
}

class _NewsBroadcastDeteilsPageState extends State<NewsBroadcastDeteilsPage> {
  double width;
  int selectedIndex = 0;
  //fake data
 List<NewsBroadcast> broadcasts = [
  new NewsBroadcast(
  id: '1',
  time: '7:15',
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
  ];

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
                        '16-02-2021',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                ),

              ],
            ),
            new Container(
                alignment: Alignment.bottomCenter,
                padding: new EdgeInsets.only(top: 210, right: 20.0, left: 20.0,bottom: 50),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: broadcasts.length,
                        itemBuilder: (BuildContext context,int index){
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: BroadcastCard(
                              isSelected: selectedIndex == index,
                              isAvailable: true,
                              time: broadcasts[index].time,
                            ),
                          );
                        }
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
                                'غداً يقول الامين العام لحزب الله السيد حسن نصرالله كلمته حكماً بين نبيه بري وجبران باسيل بعدما طيّب من فوق الطاولة خاطر رئيس التيار من خلال ايفاده رئيس وحدة الارتباط والتنسيق في الحزب وفيق صفا للقاء رئيس التيار، وبعدما طمأن نصرالله رئيس المجلس باتصاله به بأنه موفور الكرامتين الشخصية والنيابية، وبأن مبادرته لن تسقط الا بتخلي عرابها عنها أو باعتذار الرئيس المكلف'
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
              )
            )
          ],
        ),
      ),
    );
  }
}
