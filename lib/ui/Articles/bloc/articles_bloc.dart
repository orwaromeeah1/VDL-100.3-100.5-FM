import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/Articles/bloc/articles_event.dart';
import 'package:vdl/ui/Articles/bloc/articles_state.dart';

class ArticlesBLoc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBLoc(this.repo) : super(ArticlesState()) {
    on<FetchArticlesPage>(_onFetchArticlesPage);
  }

  final Repository repo;
  List<NewsModel> articles = [];

  Future<void> _onFetchArticlesPage(
      FetchArticlesPage event, Emitter<ArticlesState> emit) async {
    if (event.page == 1) {
      emit(Loading());
    } else {
      emit(LoadingNextPage(articles));
    }
    try {
      List<NewsModel> data = await repo.getArticles(event.page);
      articles = articles + data;
      emit(Loaded(articles));
    } catch (e) {
      print(e);
    }
  }
}
