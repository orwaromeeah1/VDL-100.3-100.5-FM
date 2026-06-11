import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/ArticleDetails/bloc/article_details_event.dart';
import 'package:vdl/ui/ArticleDetails/bloc/article_details_state.dart';


class ArticleDetailsBloc
    extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  final Repository repo;
  late NewsModel newsModel;

  ArticleDetailsBloc(this.repo) : super(ArticleDetailsState()) {
    on<FetchArticleDetails>(_onFetchArticleDetails);
    on<FetchAudio>(_onFetchAudio);
  }

  Future<void> _onFetchArticleDetails(
      FetchArticleDetails event, Emitter<ArticleDetailsState> emit) async {
    emit(Loading());
    newsModel = await repo.getSingleArticle(event.id);
    emit(Loaded(newsModel));
  }

  Future<void> _onFetchAudio(
      FetchAudio event, Emitter<ArticleDetailsState> emit) async {
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
