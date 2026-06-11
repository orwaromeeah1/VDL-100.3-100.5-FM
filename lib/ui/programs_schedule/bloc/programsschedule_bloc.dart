import 'package:bloc/bloc.dart';
import 'package:vdl/data/models/programs_schedule.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/programs_schedule/bloc/programs_schedule_event.dart';
import 'package:vdl/ui/programs_schedule/bloc/programs_schedule_state.dart';

class ProgramsScheduleBloc
    extends Bloc<ProgramsScheduleEvent, ProgramsScheduleState> {
  final Repository repository;
  List<ProgramSchedule> programsSchedule = [];
  List<ProgramSchedule> WebProgramsSchedule = [];

  ProgramsScheduleBloc(this.repository) : super(ProgramsScheduleEmpty()) {
    on<FetchProgramsSchedule>(_onFetchProgramsSchedule);
  }

  Future<void> _onFetchProgramsSchedule(
      FetchProgramsSchedule event, Emitter<ProgramsScheduleState> emit) async {
    emit(ProgramsScheduleLoading());
    try {
      await Future.wait([
        getRadioSchedule(event.day ?? '', event.dayNum ?? 0),
        getWebSchedule(event.day ?? '', event.dayNum ?? 0)
      ]);

      emit(ProgramsScheduleLoaded(programsSchedule: programsSchedule));
    } catch (_) {
      emit(ProgramsScheduleError());
    }
  }

  Future<void> getRadioSchedule(String day, int dayNum) async {
    programsSchedule = await repository.getProgramsSchedule(day, dayNum);
  }

  Future<void> getWebSchedule(String day, int dayNum) async {
    WebProgramsSchedule = await repository.getWebProgramsSchedule(day, dayNum);
  }
}
