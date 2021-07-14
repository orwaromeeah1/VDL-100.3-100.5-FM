import 'package:bloc/bloc.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/data/responses/program_details_response.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_event.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_state.dart';

class ProgramDetailsBloc extends Bloc<ProgramDetailsEvent, ProgramDetailsState> {
  final Repository repository;

  @override
  ProgramDetailsBloc(ProgramDetailsState initialState, this.repository)
      : super(initialState);

  @override
  ProgramDetailsState get initialState => ProgramDetailsEmpty();

  @override
  Stream<ProgramDetailsState> mapEventToState(ProgramDetailsEvent event) async* {
    if (event is FetchProgramDetails) {
      yield ProgramDetailsLoading();
//      try {

      ProgramDetailsResponse program = await repository.getProgramDetails(event.programId);
      yield ProgramDetailsLoaded(program: program);
//      } catch (_) {
//        yield ProgramDetailsError();
//      }
    }
  }
}
