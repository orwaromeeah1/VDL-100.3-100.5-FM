import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/ui/live_broadcast/bloc/live_podcast_event.dart';
import 'package:vdl/ui/live_broadcast/bloc/live_podcast_state.dart';

class LivePodcastBloc extends Bloc<LivePodcastEvent, LivePodcastState> {
  LivePodcastBloc(LivePodcastState initialState) : super(initialState);

  @override
  Stream<LivePodcastState> mapEventToState(LivePodcastEvent event) async* {
    if (event is StopLiveAudio) {
      yield PodcastStoped();
      yield LivePodcastState();
    } else {
      yield PodcastPlaying();
      yield LivePodcastState();
    }
  }
}
