import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/homeModel.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/news/bloc/news_event.dart';
import 'package:vdl/ui/news/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Repository repo;

  NewsBloc(NewsState initialState, this.repo) : super(initialState);
  List<NewsModel> viewedNews = [];
  HomeModel homeModel;
  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchData) {
      try {
        yield Loading();
        homeModel = await repo.getHomeData();
        viewedNews = homeModel.news;
        yield Startup(homeModel);
      } catch (e) {
        print(e);
      }
    }
    if (event is FetchCategoryNews) {
      try {
        yield FetchingCategoryNews(homeModel);
        homeModel.news = await repo.getNewsByCategory(1, event.catId);
        print(homeModel.news[0].title);
        viewedNews = homeModel.news;
        yield Loaded(homeModel);
      } catch (e) {
        print(e);
      }
    }
  }
}
