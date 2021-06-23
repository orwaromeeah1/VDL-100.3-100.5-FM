import 'package:flutter/material.dart';
import 'package:vdl/ui/programs_schedule/widget/program_schedule_card.dart';

class ProgramsSchedulePage extends StatefulWidget {
  @override
  _ProgramsSchedulePageState createState() => _ProgramsSchedulePageState();
}

class _ProgramsSchedulePageState extends State<ProgramsSchedulePage> {
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // image
          Positioned(
            top: 0,
            child: Container(
            height: 200,
            width: width,
            color: Colors.black87,
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'البرامج',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),),
          Container(
              width: width,
              margin: EdgeInsets.only(top: 200),
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ProgramScheduleCard(
                        name: 'السجل الذهبي',
                        duration: '2:30',
                        image: 'https://www.vdl.me/wp-content/uploads/2021/05/Sawt-Jdid.jpg',
                      ),
                    );
                  })
          ),
        ],
      ),


    );
  }
}
