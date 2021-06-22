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
      appBar: AppBar(),
      body: Container(
        width: width,
        child: ListView.builder(
            itemCount: 10,
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
    );
  }
}
