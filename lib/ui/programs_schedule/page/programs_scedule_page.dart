import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/day_model.dart';
import 'package:vdl/data/models/programs_schedule.dart';
import 'package:vdl/ui/programs/page/program_details/program_details_page.dart';
import 'package:vdl/ui/programs_schedule/bloc/programs_schedule_event.dart';
import 'package:vdl/ui/programs_schedule/bloc/programs_schedule_state.dart';
import 'package:vdl/ui/programs_schedule/bloc/programsschedule_bloc.dart';
import 'package:vdl/ui/programs_schedule/widget/program_schedule_card.dart';
import 'package:vdl/ui/shared_widget/error_screen.dart';
import 'package:vdl/utils/date_helper/date_hepler.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

import '../../../injection.dart';

class ProgramsSchedulePage extends StatefulWidget {
  @override
  _ProgramsSchedulePageState createState() => _ProgramsSchedulePageState();
}

class _ProgramsSchedulePageState extends State<ProgramsSchedulePage> {
  double width;
  List<DayModel> currentMonthDays =[];
  int selectedDay = DateTime.now().day;
  //TODO : save the already displayed days in cache in order to reduce APIs calls
  List<ProgramSchedule> programSchedule =[];

  final _bloc = locator<ProgramsScheduleBloc>();

  @override
  void initState() {
    super.initState();
    currentMonthDays = DateHelper.getDays();
    _bloc.add(FetchProgramsSchedule(
        dayNum:selectedDay,
        day: currentMonthDays[selectedDay].name));

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


        BlocBuilder(
            bloc: _bloc,
            builder: (context, ProgramsScheduleState state) {
              if (state is ProgramsScheduleEmpty) {
                _bloc.add(FetchProgramsSchedule());
              }
              if (state is ProgramsScheduleError) {
                return ErrorScreen(
                  onRetry: () => _bloc.add(FetchProgramsSchedule()),
                );
              }
              if (state is ProgramsScheduleLoaded) {
                programSchedule = state.programsSchedule;
                return screenUi();
              }

              if (state is ProgramsScheduleLoading) {
                return  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                        child: Platform.isIOS
                            ? CupertinoActivityIndicator()
                            : CircularProgressIndicator(
                          color: ProjectColors.ThemeColor,
                        )));
              }

              return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: Platform.isIOS
                          ? CupertinoActivityIndicator()
                          : CircularProgressIndicator(
                        color: ProjectColors.ThemeColor,
                      )));
            }),


        ],
      ),


    );




  }

  Widget screenUi(){
    return Container(
        width: width,
        margin: EdgeInsets.only(top: 175,bottom: 50),
        child: ListView.builder(
            itemCount: programSchedule.length,
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
                    name: '${programSchedule[index].title}',
                    duration: '${programSchedule[index].time}',
                    id: programSchedule[index].id ,
                    link: programSchedule[index].link,
                    image: '${programSchedule[index].image}',
                  ),
                ),
              );
            }),
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
            _bloc.add(FetchProgramsSchedule(
                dayNum:selectedDay,
                day: currentMonthDays[selectedDay].name));
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
        //TODO : add animation to this
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
            _bloc.add(FetchProgramsSchedule(
                dayNum:selectedDay,
                day: currentMonthDays[selectedDay].name));
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
