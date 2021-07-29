import 'package:equatable/equatable.dart';

class NewsCastDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAudios extends NewsCastDetailsEvent {
  final String introductionId;
  final String fullAudioId;

  FetchAudios({this.introductionId,this.fullAudioId});

}
