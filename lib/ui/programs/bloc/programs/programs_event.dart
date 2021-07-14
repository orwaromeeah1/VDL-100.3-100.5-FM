import 'package:equatable/equatable.dart';

abstract class ProgramsEvent extends Equatable {
  const ProgramsEvent();
}

class FetchPrograms extends ProgramsEvent {

  FetchPrograms();

  @override
  List<Object> get props => [];
}
