import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:vdl/data/responses/programs_response.dart';


class ProgramsState extends Equatable {
  const ProgramsState();

  @override
  List<Object> get props => [];
}

class ProgramsEmpty extends ProgramsState {}

class ProgramsLoading extends ProgramsState {}

class ProgramsLoaded extends ProgramsState {
  final List<ProgramsResponse> programs;

  const ProgramsLoaded({@required this.programs}) : assert(programs != null);

  @override
  List<Object> get props => [programs];
}


class ProgramsError extends ProgramsState {}