import 'package:bloc/bloc.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/programs/bloc/episode/episode_event.dart';
import 'package:vdl/ui/programs/bloc/episode/episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final Repository repository;

  EpisodeBloc(this.repository) : super(EpisodeEmpty()) {
    on<FetchEpisode>(_onFetchEpisode);
    on<FetchAudio>(_onFetchAudio);
  }

  Future<void> _onFetchEpisode(
      FetchEpisode event, Emitter<EpisodeState> emit) async {
    emit(EpisodeLoading());
    try {
      //EpisodeResponse episode = await repository.getEpisodeDetails(event.e);
      emit(EpisodeLoaded(episode: event.episode));
    } catch (_) {
      emit(EpisodeError());
    }
  }

  Future<void> _onFetchAudio(
      FetchAudio event, Emitter<EpisodeState> emit) async {
    try {
      AudioResponseModel audio =
          await repository.getAudioModel(event.audioKey);
      emit(AudioLoaded(audio: audio));
    } catch (_) {
      emit(AudioError());
    }
  }
}
