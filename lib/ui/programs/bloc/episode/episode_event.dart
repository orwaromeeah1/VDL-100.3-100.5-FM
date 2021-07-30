import 'package:equatable/equatable.dart';

abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object> get props => [];
}

class FetchEpisode extends EpisodeEvent {
  final int episodeId;
  FetchEpisode({
    this.episodeId,
  });

}
class FetchAudio extends EpisodeEvent {
  final String audioKey;
  FetchAudio({
    this.audioKey,
  });

}
