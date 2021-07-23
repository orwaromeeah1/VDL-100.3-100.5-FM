import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/ArticleDetails/bloc/article_details_event.dart';
import 'package:vdl/ui/ArticleDetails/bloc/article_details_state.dart';

class ArticleDetailsBloc
    extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  final Repository repo;

  ArticleDetailsBloc(ArticleDetailsState initialState, this.repo)
      : super(initialState);

  @override
  Stream<ArticleDetailsState> mapEventToState(
      ArticleDetailsEvent event) async* {
    if (event is FetchArticleDetails) {
      yield Loading();

      NewsModel newsModel = await repo.getSingleArticle(event.id);

      yield Loaded(newsModel);
    }
  }
}
