import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:vdl/data/responses/program_details_response.dart';


class ProgramDetailsState extends Equatable {
  const ProgramDetailsState();

  @override
  List<Object> get props => [];
}

class ProgramDetailsEmpty extends ProgramDetailsState {}

class ProgramDetailsLoading extends ProgramDetailsState {}

class ProgramDetailsLoaded extends ProgramDetailsState {
  final ProgramDetailsResponse program;

  const ProgramDetailsLoaded({@required this.program}) : assert(program != null);

  @override
  List<Object> get props => [program];
}


class ProgramDetailsError extends ProgramDetailsState {}