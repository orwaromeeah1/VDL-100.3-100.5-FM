import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/data/responses/search_response.dart';
import 'package:vdl/ui/news/bloc/search/search_event.dart';
import 'package:vdl/ui/news/bloc/search/search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository repository;

  @override
  SearchBloc(SearchState initialState, this.repository) : super(initialState);

  @override
  SearchState get initialState => SearchEmpty();

  @override
  Future<void> close() {
    //cancel streams
    super.close();
  }

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if(event is SetInitialState){
    yield SearchEmpty();


    }
    if (event is FetchSearchResult) {
      yield SearchLoading();
      try {
        final List<SearchResponse> searchResult = await repository.search(event.searchQuery);
        yield SearchLoaded(searchResult: searchResult);
      } catch (_) {
        yield SearchError();
      }
    }
  }

}
