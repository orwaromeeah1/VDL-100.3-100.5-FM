
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_available/update_available.dart';
import 'package:vdl/data/models/homeModel.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/news/bloc/news_event.dart';
import 'package:vdl/ui/news/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Repository repo;
  List<NewsModel> viewedNews = [];
  late HomeModel homeModel;
  bool dismessdLive = false;

  NewsBloc(this.repo) : super(NewsState()) {
    on<FetchData>(_onFetchData);
    on<FetchCategoryNews>(_onFetchCategoryNews);
    on<FetchSpecialReportsPages>(_onFetchSpecialReportsPages);
    on<MoveToTop>(_onMoveToTop);
    on<FetchArticles>(_onFetchArticles);
  }

  Future<void> _onFetchData(
      FetchData event, Emitter<NewsState> emit) async {
    try {
      emit(Loading());
      homeModel = await repo.getHomeData();
      viewedNews = homeModel.news ?? [];
      emit(Startup(homeModel));

      bool canBeUpdated = await checkForUpdate();
      if (canBeUpdated) {
        emit(ShowUpdatePopup());
        emit(Startup(homeModel));
      }
    } catch (e) {
      print(e);
      emit(NoInternetConnection());
    }
  }

  Future<void> _onFetchCategoryNews(
      FetchCategoryNews event, Emitter<NewsState> emit) async {
    try {
      if (event.page == 1) {
        emit(FetchingCategoryNews(homeModel));
        homeModel.news =
            await repo.getNewsByCategory(event.page, event.catId);

        viewedNews = homeModel.news ?? [];
        emit(Loaded(homeModel, true));
      } else {
        emit(FetchingNextPage(homeModel));
        List<NewsModel> extra =
            await repo.getNewsByCategory(event.page, event.catId);
        homeModel.news = (homeModel.news ?? []) + extra;
        emit(Loaded(homeModel, false));
      }
    } catch (e) {
      print(e);
      emit(Loaded(homeModel, false));
    }
  }

  Future<void> _onFetchSpecialReportsPages(
      FetchSpecialReportsPages event, Emitter<NewsState> emit) async {
    try {
      emit(FetchingNextPage(homeModel));
      List<NewsModel> specialReportsNextPage =
          await repo.getSpecialReports(event.page);
      homeModel.specialReports =
          (homeModel.specialReports ?? []) + specialReportsNextPage;
      emit(Loaded(homeModel, false));
    } catch (e) {
      print(e);
      emit(Loaded(homeModel, false));
    }
  }

  Future<void> _onMoveToTop(
      MoveToTop event, Emitter<NewsState> emit) async {
    emit(MoveingToTop(homeModel));
    emit(Loaded(homeModel, false));
  }

  Future<void> _onFetchArticles(
      FetchArticles event, Emitter<NewsState> emit) async {
    try {
      emit(FetchingNextPage(homeModel));
      List<NewsModel> articles = await repo.getArticles(event.page);
      homeModel.articles = (homeModel.articles ?? []) + articles;
      emit(Loaded(homeModel, false));
    } catch (e) {
      print(e);
      emit(Loaded(homeModel, false));
    }
  }

  Future<bool> checkForUpdate() async {
    try {
      final updateAvailability = await getUpdateAvailability();
      return switch (updateAvailability) {
        UpdateAvailable() => true,
        NoUpdateAvailable() => false,
        UnknownAvailability() => false,
      };
    } catch (e) {
      return false;
    }
  }
}
