import 'package:equatable/equatable.dart';

abstract class ProgramsScheduleEvent extends Equatable {
  const ProgramsScheduleEvent();
}

class FetchProgramsSchedule extends ProgramsScheduleEvent {
  final String? day;
  final int? dayNum;

  const FetchProgramsSchedule({this.dayNum, this.day});

  @override
  List<Object?> get props => [day, dayNum];
}