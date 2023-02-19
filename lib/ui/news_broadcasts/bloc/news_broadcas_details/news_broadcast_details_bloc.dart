import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/ArticleDetails/bloc/article_details_event.dart';

import 'package:vdl/ui/news_broadcasts/bloc/news_broadcas_details/news_broadcast_details_event.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_broadcas_details/news_broadcast_details_state.dart';

class NewsCastDetailsBloc
    extends Bloc<NewsCastDetailsEvent, NewsCastDetailsState> {
  final Repository repository;

  NewsCastDetailsBloc(NewsCastDetailsState initialState, this.repository)
      : super(initialState);
  @override
  Stream<NewsCastDetailsState> mapEventToState(
      NewsCastDetailsEvent event) async* {
    if (event is FetchAudios) {
      try {
        yield AudiosLoading();
        List<AudioResponseModel> audios = await repository.getBroadcastsAudios(
            event.introductionId, event.fullAudioId);
        yield AudiosLoaded(introAudio: audios[0], fullAudio: audios[1]);
      } catch (e) {
        yield AudiosError();
        print(e);
      }
    }
  }
}
