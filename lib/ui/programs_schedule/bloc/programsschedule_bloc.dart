
import 'package:bloc/bloc.dart';
import 'package:vdl/data/models/category_model.dart';
import 'package:vdl/data/models/programs_schedule.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_event.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_state.dart';
import 'package:vdl/ui/programs_schedule/bloc/programs_schedule_event.dart';
import 'package:vdl/ui/programs_schedule/bloc/programs_schedule_state.dart';




class ProgramsScheduleBloc extends Bloc<ProgramsScheduleEvent, ProgramsScheduleState> {
  final Repository repository;

  @override
  ProgramsScheduleBloc(ProgramsScheduleState initialState, this.repository) : super(initialState);

  @override
  ProgramsScheduleState get initialState => ProgramsScheduleEmpty();

  @override
  Stream<ProgramsScheduleState> mapEventToState(ProgramsScheduleEvent event) async* {
    if (event is FetchProgramsSchedule) {
      yield ProgramsScheduleLoading();
      try {

        List<ProgramSchedule> programsSchedule = await repository.getProgramsSchedule(event.day,event.dayNum);

        yield ProgramsScheduleLoaded(programsSchedule: programsSchedule);
      } catch (_) {
        yield ProgramsScheduleError();
      }
    }

  }
}
