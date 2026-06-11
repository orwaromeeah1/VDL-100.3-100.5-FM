import 'package:equatable/equatable.dart';

import '../../../data/models/news_model.dart';

class NotificationState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends NotificationState {}

class LoadingNextPage extends NotificationState {
  final List<NewsModel> notifications;

  LoadingNextPage(this.notifications);
}

class Loaded extends NotificationState {
  final List<NewsModel> notifications;

  Loaded(this.notifications);
}
