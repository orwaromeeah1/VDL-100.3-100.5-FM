import 'package:flutter/material.dart';

class ProgramsSchedulePage extends StatefulWidget {
  @override
  _ProgramsSchedulePageState createState() => _ProgramsSchedulePageState();
}

class _ProgramsSchedulePageState extends State<ProgramsSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('programs schedule'),
        ),
      ),
    );
  }
}
