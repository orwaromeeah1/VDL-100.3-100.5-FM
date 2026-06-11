import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/notifications/bloc/notifications_event.dart';
import 'package:vdl/ui/notifications/bloc/notifications_state.dart';

import '../../../data/models/news_model.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(this.repo) : super(NotificationState()) {
    on<FetchNotificationPage>(_onFetchNotificationPage);
  }

  final Repository repo;
  List<NewsModel> notifications = [];

  Future<void> _onFetchNotificationPage(
      FetchNotificationPage event, Emitter<NotificationState> emit) async {
    if (event.page == 1) {
      emit(Loading());
    } else {
      emit(LoadingNextPage(notifications));
    }
    try {
      List<NewsModel> data = await repo.getLiveNotifications(event.page);
      notifications = notifications + data;
      emit(Loaded(notifications));
    } catch (e) {
      print(e);
    }
  }
}
