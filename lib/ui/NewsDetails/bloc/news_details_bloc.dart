import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_event.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_state.dart';

class NewsDetailsBloc extends Bloc<NewsDetailsEvent, NewsDetailsState> {
  final Repository repo;

  NewsDetailsBloc(NewsDetailsState initialState, this.repo)
      : super(initialState);
  NewsModel newsModel;
  @override
  Stream<NewsDetailsState> mapEventToState(NewsDetailsEvent event) async* {
    if (event is FetchNewsDetails) {
      yield Loading();

      if (event.isSpecail) {
        newsModel = await repo.getSingleSpecialReportPage(event.id);
      } else {
        newsModel = await repo.getSingleNewsPage(event.id);
      }

      yield Loaded(newsModel);
    } else if (event is FetchAudio) {
      try {
        AudioResponseModel audio = await repo.getAudioModel(event.id);
        yield AudioLoaded(audio, newsModel);
        yield Loaded(newsModel);
      } catch (e) {
        yield Loaded(newsModel);
        print(e);
      }
    }
  }
}
