import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_event.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_state.dart';

class NewsDetailsBloc extends Bloc<NewsDetailsEvent, NewsDetailsState> {
  final Repository repo;

  NewsDetailsBloc(NewsDetailsState initialState, this.repo)
      : super(initialState);

  @override
  Stream<NewsDetailsState> mapEventToState(NewsDetailsEvent event) async* {
    if (event is FetchNewsDetails) {
      yield Loading();
      NewsModel newsModel = await repo.getSingleNewsPage(event.id);
      print(newsModel);
      yield Loaded(newsModel);
    }
  }
}
