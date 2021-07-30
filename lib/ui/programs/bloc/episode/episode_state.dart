import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/responses/episode_response.dart';


class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object> get props => [];
}

class EpisodeEmpty extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoaded extends EpisodeState {
  final EpisodeResponse episode;

  const EpisodeLoaded({@required this.episode}) : assert(episode != null);

  @override
  List<Object> get props => [episode];
}


class EpisodeError extends EpisodeState {}


class AudioLoading extends EpisodeState {}

class AudioLoaded extends EpisodeState {

  final AudioResponseModel audio;

  AudioLoaded({this.audio});
}

class AudioError extends EpisodeState {}