import 'package:equatable/equatable.dart';
import 'package:vdl/data/models/news_model.dart';

class NewsDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends NewsDetailsState {}

class Loaded extends NewsDetailsState {
  final NewsModel newsModel;

  Loaded(this.newsModel);
}
