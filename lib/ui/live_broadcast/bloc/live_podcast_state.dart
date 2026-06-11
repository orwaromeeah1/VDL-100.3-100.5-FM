import 'package:equatable/equatable.dart';

class LivePodcastState extends Equatable {
  @override
  List<Object> get props => [];
}

class PodcastPlaying extends LivePodcastState {}

class PodcastStoped extends LivePodcastState {}
