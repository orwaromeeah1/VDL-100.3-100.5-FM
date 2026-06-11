import 'package:bloc/bloc.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/data/responses/program_details_response.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_event.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_state.dart';

class ProgramDetailsBloc
    extends Bloc<ProgramDetailsEvent, ProgramDetailsState> {
  final Repository repository;

  ProgramDetailsBloc(this.repository) : super(ProgramDetailsEmpty()) {
    on<FetchProgramDetails>(_onFetchProgramDetails);
  }

  Future<void> _onFetchProgramDetails(
      FetchProgramDetails event, Emitter<ProgramDetailsState> emit) async {
    emit(ProgramDetailsLoading());
//      try {

    ProgramDetailsResponse program = await repository.getProgramDetails(
        event.programId ?? 0, event.isRadio ?? false);
    emit(ProgramDetailsLoaded(program: program));
//      } catch (_) {
//        emit(ProgramDetailsError());
//      }
  }
}
