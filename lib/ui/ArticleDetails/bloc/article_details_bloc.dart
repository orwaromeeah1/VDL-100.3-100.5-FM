import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/ArticleDetails/bloc/article_details_event.dart';
import 'package:vdl/ui/ArticleDetails/bloc/article_details_state.dart';



class ArticleDetailsBloc
    extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  final Repository repo;

  ArticleDetailsBloc(ArticleDetailsState initialState, this.repo)
      : super(initialState);
  NewsModel newsModel;
  @override
  Stream<ArticleDetailsState> mapEventToState(
      ArticleDetailsEvent event) async* {
    if (event is FetchArticleDetails) {
      yield Loading();
      newsModel = await repo.getSingleArticle(event.id);
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
