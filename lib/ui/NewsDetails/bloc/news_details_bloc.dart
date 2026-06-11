import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_event.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_state.dart';

class NewsDetailsBloc extends Bloc<NewsDetailsEvent, NewsDetailsState> {
  final Repository repo;
  late NewsModel newsModel;

  NewsDetailsBloc(this.repo) : super(NewsDetailsState()) {
    on<FetchNewsDetails>(_onFetchNewsDetails);
    on<FetchAudio>(_onFetchAudio);
  }

  Future<void> _onFetchNewsDetails(
      FetchNewsDetails event, Emitter<NewsDetailsState> emit) async {
    emit(Loading());

    if (event.isSpecail) {
      newsModel = await repo.getSingleSpecialReportPage(event.id);
    } else {
      newsModel = await repo.getSingleNewsPage(event.id);
    }

    emit(Loaded(newsModel));
  }

  Future<void> _onFetchAudio(
      FetchAudio event, Emitter<NewsDetailsState> emit) async {
    try {
      AudioResponseModel audio = await repo.getAudioModel(event.id);
      emit(AudioLoaded(audio, newsModel));
      emit(Loaded(newsModel));
    } catch (e) {
      emit(Loaded(newsModel));
      print(e);
    }
  }
}
