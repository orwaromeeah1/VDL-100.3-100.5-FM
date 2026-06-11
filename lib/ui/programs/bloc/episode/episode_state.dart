import 'package:equatable/equatable.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/responses/program_details_response.dart';

class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object> get props => [];
}

class EpisodeEmpty extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoaded extends EpisodeState {
  final Episodes episode;

  const EpisodeLoaded({required this.episode});

  @override
  List<Object> get props => [episode];
}

class EpisodeError extends EpisodeState {}

class AudioLoading extends EpisodeState {}

class AudioLoaded extends EpisodeState {
  final AudioResponseModel audio;

  AudioLoaded({required this.audio});
}

class AudioError extends EpisodeState {}
