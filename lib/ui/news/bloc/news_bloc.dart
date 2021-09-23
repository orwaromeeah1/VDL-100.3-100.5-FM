import 'dart:math';

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
        yield NoInternetConnection();
      }
    }
    if (event is FetchCategoryNews) {
      try {
        if (event.page == 1) {
          yield FetchingCategoryNews(homeModel);
          homeModel.news =
              await repo.getNewsByCategory(event.page, event.catId);

          viewedNews = homeModel.news;
          yield Loaded(homeModel);
        } else {
          yield FetchingNextPage(homeModel);
          List<NewsModel> extra =
              await repo.getNewsByCategory(event.page, event.catId);
          homeModel.news = homeModel.news + extra;
          yield Loaded(homeModel);
        }
      } catch (e) {
        print(e);
        yield Loaded(homeModel);
      }
    } else if (event is FetchSpecialReportsPages) {
      try {
        yield FetchingNextPage(homeModel);
        List<NewsModel> specialReportsNextPage =
            await repo.getSpecialReports(event.page);
        homeModel.specialReports =
            homeModel.specialReports + specialReportsNextPage;
        yield Loaded(homeModel);
      } catch (e) {
        print(e);
        yield Loaded(homeModel);
      }
    } else if (event is MoveToTop) {
      yield MoveingToTop(homeModel);
      yield Loaded(homeModel);
    } else if (event is FetchArticles) {
      try {
        yield FetchingNextPage(homeModel);
        List<NewsModel> articles = await repo.getArticles(event.page);
        homeModel.articles = homeModel.articles + articles;
        yield Loaded(homeModel);
      } catch (e) {
        print(e);
        yield Loaded(homeModel);
      }
    }
  }
}
