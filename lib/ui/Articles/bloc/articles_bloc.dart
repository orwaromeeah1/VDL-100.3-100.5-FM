import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/Articles/bloc/articles_event.dart';
import 'package:vdl/ui/Articles/bloc/articles_state.dart';

class ArticlesBLoc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBLoc(ArticlesState initialState, this.repo) : super(initialState);
  final Repository repo;
  List<NewsModel> articles = [];
  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {
    if (event is FetchArticlesPage) {
      if (event.page == 1) {
        yield Loading();
      } else {
        yield LoadingNextPage(articles);
      }
      try {
        List<NewsModel> data = await repo.getArticles(event.page);
        articles = articles + data;
        yield Loaded(articles);
      } catch (e) {
        print(e);
      }
    }
  }
}
