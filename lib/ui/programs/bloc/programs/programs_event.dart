import 'package:equatable/equatable.dart';

abstract class ProgramsEvent extends Equatable {
  const ProgramsEvent();
}

class FetchPrograms extends ProgramsEvent {

  FetchPrograms();

  @override
  List<Object> get props => [];
}

class FetchCategoryPrograms extends ProgramsEvent{
  final int categoryId;

  FetchCategoryPrograms({this.categoryId});

  @override
  List<Object> get props => [];
}
class SearchPrograms extends ProgramsEvent{
  final int categoryId;
  final String searchQuery;

  SearchPrograms({this.categoryId,this.searchQuery});

  @override
  List<Object> get props => [];
}

class FetchCategories extends ProgramsEvent {

  FetchCategories();

  @override
  List<Object> get props => [];
}
