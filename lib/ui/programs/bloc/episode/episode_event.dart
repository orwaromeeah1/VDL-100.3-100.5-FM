import 'package:equatable/equatable.dart';
import 'package:vdl/data/responses/program_details_response.dart';

abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object> get props => [];
}

class FetchEpisode extends EpisodeEvent {
  final Episodes episode;
  FetchEpisode({
    this.episode,
  });
}

class FetchAudio extends EpisodeEvent {
  final String audioKey;
  FetchAudio({
    this.audioKey,
  });
}
