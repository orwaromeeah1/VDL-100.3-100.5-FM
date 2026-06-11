
import 'package:bloc/bloc.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/data/responses/search_response.dart';
import 'package:vdl/ui/news/bloc/search/search_event.dart';
import 'package:vdl/ui/news/bloc/search/search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository repository;

  SearchBloc(this.repository) : super(SearchEmpty()) {
    on<SetInitialState>(_onSetInitialState);
    on<FetchSearchResult>(_onFetchSearchResult);
  }

  Future<void> _onSetInitialState(
      SetInitialState event, Emitter<SearchState> emit) async {
    emit(SearchEmpty());
  }

  Future<void> _onFetchSearchResult(
      FetchSearchResult event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final List<SearchResponse> searchResult =
          await repository.search(event.searchQuery);
      emit(SearchLoaded(searchResult: searchResult));
    } catch (_) {
      emit(SearchError());
    }
  }
}
