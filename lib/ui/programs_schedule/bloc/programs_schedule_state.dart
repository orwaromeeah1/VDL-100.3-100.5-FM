import 'package:equatable/equatable.dart';
import 'package:vdl/data/models/programs_schedule.dart';


class ProgramsScheduleState extends Equatable {
  const ProgramsScheduleState();

  @override
  List<Object> get props => [];
}

class ProgramsScheduleEmpty extends ProgramsScheduleState {}

class ProgramsScheduleLoading extends ProgramsScheduleState {}

class ProgramsScheduleLoaded extends ProgramsScheduleState {
  final List<ProgramSchedule> programsSchedule;

  const ProgramsScheduleLoaded({required this.programsSchedule});

  @override
  List<Object> get props => [programsSchedule];
}
class ProgramsScheduleError extends ProgramsScheduleState {}

