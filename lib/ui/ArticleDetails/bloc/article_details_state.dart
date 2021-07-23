import 'package:equatable/equatable.dart';
import 'package:vdl/data/models/news_model.dart';

class ArticleDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends ArticleDetailsState {}

class Loaded extends ArticleDetailsState {
  final NewsModel article;

  Loaded(this.article);
}
