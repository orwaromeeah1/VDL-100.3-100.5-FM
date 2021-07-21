import 'package:equatable/equatable.dart';

class ArticlesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchArticlesPage extends ArticlesEvent {
  final int page;

  FetchArticlesPage(this.page);
}
