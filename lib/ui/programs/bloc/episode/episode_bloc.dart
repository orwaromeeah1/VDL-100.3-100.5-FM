import 'package:bloc/bloc.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/data/responses/episode_response.dart';
import 'package:vdl/ui/programs/bloc/episode/episode_event.dart';
import 'package:vdl/ui/programs/bloc/episode/episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final Repository repository;

  @override
  EpisodeBloc(EpisodeState initialState, this.repository) : super(initialState);

  @override
  EpisodeState get initialState => EpisodeEmpty();

  @override
  Stream<EpisodeState> mapEventToState(EpisodeEvent event) async* {
    if (event is FetchEpisode) {
      yield EpisodeLoading();
      try {

        //EpisodeResponse episode = await repository.getEpisodeDetails(event.e);
        yield EpisodeLoaded(episode: event.episode);
      } catch (_) {
        yield EpisodeError();
      }
    }

    if (event is FetchAudio) {
      try {
        AudioResponseModel audio =
            await repository.getAudioModel(event.audioKey);
        yield AudioLoaded(audio: audio);
      } catch (_) {
        yield AudioError();
      }
    }
  }
}
