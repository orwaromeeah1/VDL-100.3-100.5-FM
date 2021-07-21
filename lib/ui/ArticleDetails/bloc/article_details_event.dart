import 'package:equatable/equatable.dart';

class ArticleDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchArticleDetails extends ArticleDetailsEvent {
  final int id;

  FetchArticleDetails(
    this.id,
  );
}
