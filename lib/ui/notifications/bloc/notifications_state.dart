import 'package:equatable/equatable.dart';
import 'package:vdl/data/models/notification_model.dart';

class NotificationState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends NotificationState {}

class LoadingNextPage extends NotificationState {
  final List<LiveNotificationModel> notifications;

  LoadingNextPage(this.notifications);
}

class Loaded extends NotificationState {
  final List<LiveNotificationModel> notifications;

  Loaded(this.notifications);
}
