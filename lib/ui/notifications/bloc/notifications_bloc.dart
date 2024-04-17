import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/models/notification_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/notifications/bloc/notifications_event.dart';
import 'package:vdl/ui/notifications/bloc/notifications_state.dart';

import '../../../data/models/news_model.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(NotificationState initialState, this.repo)
      : super(initialState);
  final Repository repo;
  List<NewsModel> notifications = [];
  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is FetchNotificationPage) {
      if (event.page == 1) {
        yield Loading();
      } else {
        yield LoadingNextPage(notifications);
      }
      try {
        List<NewsModel> data = await repo.getLiveNotifications(event.page);
        notifications = notifications + data;
        yield Loaded(notifications);
      } catch (e) {
        print(e);
      }
    }
  }
}
