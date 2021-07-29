import 'package:equatable/equatable.dart';

abstract class NewsCastEvent extends Equatable {
  const NewsCastEvent();
  @override
  List<Object> get props => [];
}

class FetchNewsCast extends NewsCastEvent {
   FetchNewsCast();

}




