import 'package:equatable/equatable.dart';

abstract class ProgramDetailsEvent extends Equatable {
  const ProgramDetailsEvent();
}

class FetchProgramDetails extends ProgramDetailsEvent {
  final int programId;
  final bool isRadio;
  FetchProgramDetails({this.programId, this.isRadio});

  @override
  List<Object> get props => [];
}
