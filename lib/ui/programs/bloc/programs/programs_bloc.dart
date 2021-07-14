
import 'package:bloc/bloc.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/data/responses/programs_response.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_event.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_state.dart';




class ProgramsBloc extends Bloc<ProgramsEvent, ProgramsState> {
  final Repository repository;

  @override
  ProgramsBloc(ProgramsState initialState, this.repository) : super(initialState);

  @override
  ProgramsState get initialState => ProgramsEmpty();

  @override
  Stream<ProgramsState> mapEventToState(ProgramsEvent event) async* {
    if (event is FetchPrograms) {
      yield ProgramsLoading();
      try {

        List<ProgramsResponse> programs = await repository.getPrograms(1,10);

        yield ProgramsLoaded(programs: programs);
      } catch (_) {
        yield ProgramsError();
      }
    }

  }
}
