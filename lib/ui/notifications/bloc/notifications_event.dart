import 'package:equatable/equatable.dart';

class NotificationEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchNotificationPage extends NotificationEvent {
  final int page;

  FetchNotificationPage(this.page);
}
