import 'package:equatable/equatable.dart';

class LivePodcastEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StopLiveAudio extends LivePodcastEvent {}

class PlayLiveAudio extends LivePodcastEvent {}
