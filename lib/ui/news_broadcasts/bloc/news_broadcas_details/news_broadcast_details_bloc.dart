import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/repository/repository.dart';

import 'package:vdl/ui/news_broadcasts/bloc/news_broadcas_details/news_broadcast_details_event.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_broadcas_details/news_broadcast_details_state.dart';

class NewsCastDetailsBloc
    extends Bloc<NewsCastDetailsEvent, NewsCastDetailsState> {
  final Repository repository;

  NewsCastDetailsBloc(this.repository) : super(NewsCastDetailsState()) {
    on<FetchAudios>(_onFetchAudios);
  }

  Future<void> _onFetchAudios(
      FetchAudios event, Emitter<NewsCastDetailsState> emit) async {
    try {
      emit(AudiosLoading());
      List<AudioResponseModel> audios = await repository.getBroadcastsAudios(
          event.introductionId, event.fullAudioId);
      emit(AudiosLoaded(introAudio: audios[0], fullAudio: audios[1]));
    } catch (e) {
      emit(AudiosError());
      print(e);
    }
  }
}
