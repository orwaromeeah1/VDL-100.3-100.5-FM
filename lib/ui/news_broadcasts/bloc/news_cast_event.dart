import 'package:equatable/equatable.dart';

abstract class NewsCastEvent extends Equatable {
  const NewsCastEvent();
}

class FetchNewsCast extends NewsCastEvent {


   FetchNewsCast();

  @override
  List<Object> get props => [];
}


