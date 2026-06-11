
import 'package:bloc/bloc.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/data/responses/news_cast_response.dart';

import 'news_cast_event.dart';
import 'news_cast_state.dart';


class NewsCastBloc extends Bloc<NewsCastEvent, NewsCastState> {
  final Repository repository;

  NewsCastBloc(this.repository) : super(NewsCastEmpty()) {
    on<FetchNewsCast>(_onFetchNewsCast);
  }

  Future<void> _onFetchNewsCast(
      FetchNewsCast event, Emitter<NewsCastState> emit) async {
    emit(NewsCastLoading());
    try {
      final List<NewsCastResponse> newsCasts = await repository.getNewsCasts();
      emit(NewsCastLoaded(newsCasts: newsCasts));
    } catch (_) {
      emit(NewsCastError());
    }
  }
}
