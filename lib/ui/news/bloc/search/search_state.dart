import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:vdl/data/responses/search_response.dart';


 class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends SearchState {}

class SearchLoading extends SearchState {}

class NewPageLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<SearchResponse> searchResult;

  const SearchLoaded({@required this.searchResult}) : assert(searchResult != null);

  @override
  List<Object> get props => [searchResult];
}
class SearchNextPageLoaded extends SearchState {
  final SearchResponse searchResult;

  const SearchNextPageLoaded({@required this.searchResult}) : assert(searchResult != null);

  @override
  List<Object> get props => [searchResult];
}
class SearchError extends SearchState {}

class ProductsPaginationError extends SearchState {}

