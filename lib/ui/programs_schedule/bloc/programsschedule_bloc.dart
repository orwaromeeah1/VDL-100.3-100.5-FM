import 'package:bloc/bloc.dart';
import 'package:vdl/data/models/category_model.dart';
import 'package:vdl/data/models/programs_schedule.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_event.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_state.dart';
import 'package:vdl/ui/programs_schedule/bloc/programs_schedule_event.dart';
import 'package:vdl/ui/programs_schedule/bloc/programs_schedule_state.dart';

class ProgramsScheduleBloc
    extends Bloc<ProgramsScheduleEvent, ProgramsScheduleState> {
  final Repository repository;
  List<ProgramSchedule> programsSchedule = [];
  List<ProgramSchedule> WebProgramsSchedule = [];

  @override
  ProgramsScheduleBloc(ProgramsScheduleState initialState, this.repository)
      : super(initialState);

  @override
  ProgramsScheduleState get initialState => ProgramsScheduleEmpty();

  @override
  Stream<ProgramsScheduleState> mapEventToState(
      ProgramsScheduleEvent event) async* {
    if (event is FetchProgramsSchedule) {
      yield ProgramsScheduleLoading();
      try {
        await Future.wait([
          getRadioSchedule(event.day, event.dayNum),
          getWebSchedule(event.day, event.dayNum)
        ]);

        yield ProgramsScheduleLoaded(programsSchedule: programsSchedule);
      } catch (_) {
        yield ProgramsScheduleError();
      }
    }
  }

  Future<void> getRadioSchedule(String day, int dayNum) async {
    programsSchedule = await repository.getProgramsSchedule(day, dayNum);
  }

  Future<void> getWebSchedule(String day, int dayNum) async {
    WebProgramsSchedule = await repository.getWebProgramsSchedule(day, dayNum);
  }
}
