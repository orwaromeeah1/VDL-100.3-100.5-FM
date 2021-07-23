import 'package:equatable/equatable.dart';

abstract class ProgramDetailsEvent extends Equatable {
  const ProgramDetailsEvent();
}

class FetchProgramDetails extends ProgramDetailsEvent {
 final int programId;
  FetchProgramDetails({
   this.programId,
});

  @override
  List<Object> get props => [];
}
