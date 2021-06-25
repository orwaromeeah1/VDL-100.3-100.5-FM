import 'package:flutter/material.dart';
import 'package:vdl/data/models/day_model.dart';
import 'package:vdl/ui/programs/page/program_details/program_details_page.dart';
import 'package:vdl/ui/programs_schedule/widget/program_schedule_card.dart';
import 'package:vdl/utils/date_helper/date_hepler.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class ProgramsSchedulePage extends StatefulWidget {
  @override
  _ProgramsSchedulePageState createState() => _ProgramsSchedulePageState();
}

class _ProgramsSchedulePageState extends State<ProgramsSchedulePage> {
  double width;
  List<DayModel> currentMonthDays =[];
  int selectedDay = DateTime.now().day;

  @override
  void initState() {
    super.initState();
    currentMonthDays = DateHelper.getDays();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
            height: 175,
            width: width,
            color: ProjectColors.BLACK,
            padding: EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateHelper.getMonthNameInArabic(DateTime.now().month)+' ' + DateTime.now().year.toString(),
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                daysSlider(),
              ],
            ),
          ),),
          Container(
              width: width,
              margin: EdgeInsets.only(top: 175),
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>ProgramDetailsPage())
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: ProgramScheduleCard(
                          name: 'السجل الذهبي',
                          duration: '2:30',
                          image: 'https://www.vdl.me/wp-content/uploads/2021/05/Sawt-Jdid.jpg',
                        ),
                      ),
                    );
                  })
          ),
        ],
      ),


    );
  }

  Widget daysSlider(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              selectedDay--;
            });
          },
          child: Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(right: 7),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(50),
            ),
            child:Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: ProjectColors.ThemeColor,
              ),
            ) ,
          ),
        ),

        Container(
          width: 50,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Text(
                '${currentMonthDays[(selectedDay-2)%currentMonthDays.length].number}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                '${currentMonthDays[(selectedDay-2)%currentMonthDays.length].name}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 50,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Text(
                '${currentMonthDays[(selectedDay-1)%currentMonthDays.length].number}',
                style: TextStyle(
                  color: ProjectColors.ThemeColor,
                ),
              ),
              Text(
                 '${currentMonthDays[(selectedDay-1)%currentMonthDays.length].name}',
                style: TextStyle(
                  color: ProjectColors.ThemeColor,
                ),
              ),
              Container(
                height: 1,
                width: 50,
                color: ProjectColors.ThemeColor,
              )
            ],
          ),
        ),
        Container(
          width: 50,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Text(
                '${currentMonthDays[(selectedDay)%currentMonthDays.length].number}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                '${currentMonthDays[(selectedDay)%currentMonthDays.length].name}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              selectedDay++;
            });
          },
          child: Container(
            height: 35,
            width: 35,
            padding: EdgeInsets.only(right: 7),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(50),
            ),
            child:Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: ProjectColors.ThemeColor,
              ),
            ) ,
          ),
        ),


      ],
    );
  }
}
