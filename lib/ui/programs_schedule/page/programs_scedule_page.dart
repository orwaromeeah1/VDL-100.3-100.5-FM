import 'dart:developer';
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
  List<DayModel> currentMonthDays = [];
  int selectedDay = DateTime.now().day;
  int totalDays = 0;

  bool isSetToRadio = true;
  final _bloc = locator<ProgramsScheduleBloc>();

  @override
  void initState() {
    super.initState();
    currentMonthDays = DateHelper.getDays();
    totalDays = DateHelper.daysInMonth(DateTime.now());
    _bloc.add(FetchProgramsSchedule(
        dayNum: selectedDay,
        day: currentMonthDays[(selectedDay - 1) % totalDays].name));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              height: 220,
              width: width,
              color: ProjectColors.BLACK,
              padding: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScheduleTypePicker(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    DateHelper.getMonthNameInArabic(DateTime.now().month) +
                        ' ' +
                        DateTime.now().year.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  daysSlider(),
                ],
              ),
            ),
          ),
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
                  return screenUi();
                }

                if (state is ProgramsScheduleLoading) {
                  return Padding(
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

  Widget ScheduleTypePicker() {
    return Container(
      height: 40,
      width: 250,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isSetToRadio = true;
              });
            },
            child: Container(
              height: 40,
              width: isSetToRadio ? 150 : 100,
              child: Center(
                  child: Text(
                isSetToRadio ? 'جدول برامج الإذاعة' : 'الإذاعة',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                  color: isSetToRadio
                      ? ProjectColors.ThemeColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSetToRadio = false;
              });
            },
            child: Container(
              height: 40,
              width: isSetToRadio ? 100 : 150,
              child: Center(
                  child: Text(
                isSetToRadio ? 'WebTV' : 'جدول برامج ال WebTV',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                  color: isSetToRadio
                      ? Colors.transparent
                      : ProjectColors.ThemeColor,
                  borderRadius: BorderRadius.circular(50)),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50)),
    );
  }

  Widget screenUi() {
    List<ProgramSchedule> programsSchedule =
        isSetToRadio ? _bloc.programsSchedule : _bloc.WebProgramsSchedule;
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 220, bottom: 50),
      child: ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: programsSchedule.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ProgramScheduleCard(
                isDisplayingNow: programsSchedule[index].active,
                isRadio: isSetToRadio,
                name: '${programsSchedule[index].title}',
                duration: '${programsSchedule[index].time}',
                id: programsSchedule[index].id,
                link: programsSchedule[index].link,
                image: '${programsSchedule[index].image}',
              ),
            );
          }),
    );
  }

  Widget daysSlider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedDay--;
            });
            log('jmnjmn' + (selectedDay % totalDays).toString());
            _bloc.add(FetchProgramsSchedule(
                dayNum: selectedDay == 0
                    ? totalDays
                    : selectedDay == totalDays
                        ? selectedDay
                        : selectedDay % totalDays,
                day: currentMonthDays[(selectedDay - 1) % totalDays].name));
          },
          child: Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: ProjectColors.ThemeColor,
              ),
            ),
          ),
        ),
        Container(
          width: 80,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Text(
                '${currentMonthDays[(selectedDay - 2) % currentMonthDays.length].number}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                '${currentMonthDays[(selectedDay - 2) % currentMonthDays.length].name}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 80,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Text(
                '${currentMonthDays[(selectedDay - 1) % currentMonthDays.length].number}',
                style: TextStyle(
                    color: ProjectColors.ThemeColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${currentMonthDays[(selectedDay - 1) % currentMonthDays.length].name}',
                style: TextStyle(
                    color: ProjectColors.ThemeColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 2,
                width: 50,
                color: ProjectColors.ThemeColor,
              )
            ],
          ),
        ),
        Container(
          width: 80,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Text(
                '${currentMonthDays[(selectedDay) % currentMonthDays.length].number}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                '${currentMonthDays[(selectedDay) % currentMonthDays.length].name}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedDay++;
            });
            log('jmnjmnnn' + (selectedDay % totalDays).toString());
            _bloc.add(FetchProgramsSchedule(
                dayNum: selectedDay == 0
                    ? totalDays
                    : selectedDay == totalDays
                        ? selectedDay
                        : selectedDay % totalDays,
                day: currentMonthDays[(selectedDay - 1) % totalDays].name));
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
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: ProjectColors.ThemeColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
