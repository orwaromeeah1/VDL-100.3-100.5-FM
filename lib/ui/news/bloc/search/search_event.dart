import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class FetchSearchResult extends SearchEvent {
  final String searchQuery;

   FetchSearchResult({
    this.searchQuery
});

  @override
  List<Object> get props => [];
}


class SetInitialState extends SearchEvent {

  const SetInitialState();

  @override
  List<Object> get props => [];
}

class FetchFilters extends SearchEvent {

  const FetchFilters();

  @override
  List<Object> get props => [];
}