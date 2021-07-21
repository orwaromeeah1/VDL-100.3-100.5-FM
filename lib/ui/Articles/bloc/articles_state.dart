import 'package:equatable/equatable.dart';
import 'package:vdl/data/models/news_model.dart';

class ArticlesState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends ArticlesState {}

class LoadingNextPage extends ArticlesState {}

class Loaded extends ArticlesState {
  final List<NewsModel> articles;

  Loaded(this.articles);
}
