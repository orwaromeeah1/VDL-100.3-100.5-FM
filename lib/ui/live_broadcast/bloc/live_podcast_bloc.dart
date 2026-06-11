import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/ui/live_broadcast/bloc/live_podcast_event.dart';
import 'package:vdl/ui/live_broadcast/bloc/live_podcast_state.dart';

class LivePodcastBloc extends Bloc<LivePodcastEvent, LivePodcastState> {
  LivePodcastBloc() : super(LivePodcastState()) {
    on<StopLiveAudio>(_onStopLiveAudio);
    on<PlayLiveAudio>(_onPlayLiveAudio);
  }

  Future<void> _onStopLiveAudio(
      StopLiveAudio event, Emitter<LivePodcastState> emit) async {
    emit(PodcastStoped());
    emit(LivePodcastState());
  }

  Future<void> _onPlayLiveAudio(
      PlayLiveAudio event, Emitter<LivePodcastState> emit) async {
    emit(PodcastPlaying());
    emit(LivePodcastState());
  }
}
