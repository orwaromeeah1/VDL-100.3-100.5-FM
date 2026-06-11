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

  FetchCategoryPrograms({required this.categoryId});

  @override
  List<Object> get props => [];
}
class SearchPrograms extends ProgramsEvent{
  final int categoryId;
  final String searchQuery;

  SearchPrograms({required this.categoryId, required this.searchQuery});

  @override
  List<Object> get props => [];
}

class FetchCategories extends ProgramsEvent {

  FetchCategories();

  @override
  List<Object> get props => [];
}
