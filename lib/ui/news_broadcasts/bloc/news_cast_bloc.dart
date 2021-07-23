import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/data/responses/news_cast_response.dart';

import 'news_cast_event.dart';
import 'news_cast_state.dart';


class NewsCastBloc extends Bloc<NewsCastEvent, NewsCastState> {
  final Repository repository;

  @override
  NewsCastBloc(NewsCastState initialState, this.repository) : super(initialState);

  @override
  NewsCastState get initialState => NewsCastEmpty();

  @override
  Future<void> close() {
    //cancel streams
    super.close();
  }

  @override
  Stream<NewsCastState> mapEventToState(NewsCastEvent event) async* {

    if (event is FetchNewsCast) {
      yield NewsCastLoading();
      try {
        final List<NewsCastResponse> newsCasts = await repository.getNewsCasts();
        yield NewsCastLoaded(newsCasts: newsCasts);
      } catch (_) {
        yield NewsCastError();
      }
    }
  }

}
