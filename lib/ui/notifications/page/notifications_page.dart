import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/ui/notifications/bloc/notifications_bloc.dart';
import 'package:vdl/ui/notifications/bloc/notifications_event.dart';
import 'package:vdl/ui/notifications/bloc/notifications_state.dart';
import 'package:vdl/ui/notifications/widgets/notifications_widget.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/ui/shared_widget/try_again_widget.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

import '../../../data/models/news_model.dart';
import '../../../injection.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final bloc = locator<NotificationBloc>();
  int page = 1;
  bool isLoadingNewPage = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(FetchNotificationPage(page));
  }

  void _getNextPage() {
    page++;
    bloc.add(FetchNotificationPage(page));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: bloc,
        builder: (context, state) {
          if (state is Loaded) {
            return screenUI(state.notifications, state);
          }
          if (state is LoadingNextPage) {
            return screenUI(state.notifications, state);
          }
          if (state is Loading) {
            return LoadingScreen();
          }
          return TryAgain(onRetry: () => bloc.add(FetchNotificationPage(1)));
        },
        listener: (context, state) {
          if (state is Loaded) {
            setState(() {
              isLoadingNewPage = false;
            });
          }
        });
  }

  Widget screenUI(
      List<NewsModel> notifications, NotificationState notificationState) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        body: Column(
          children: [
            Container(
                color: Colors.white,
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 49.0, right: 19, left: 19, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Container(
                              height: 29,
                              width: 25,
                              child: SvgPicture.asset('assets/images/bell.svg'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'الاشعارات',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          radius: 16,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(
                              CupertinoIcons.back,
                              color: Colors.black,
                            ),
                          ),
                          backgroundColor: black.withOpacity(0.07),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (!isLoadingNewPage &&
                      notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent) {
                    setState(() {
                      isLoadingNewPage = true;
                      _getNextPage();
                    });
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  child: Container(
                      child: Column(
                    children: [
                      Container(
                        child: LimitedBox(
                          maxHeight: 200 * notifications.length.toDouble(),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  NotificationCardWidget(
                                    notificationModel: notifications[index],
                                  ),
                              itemCount: notifications.length),
                        ),
                      ),
                      notificationState is LoadingNextPage
                          ? Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Platform.isIOS
                                  ? CupertinoActivityIndicator()
                                  : Center(
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: CircularProgressIndicator()),
                                    ),
                            )
                          : Container(),
                    ],
                  )),
                ),
              ),
            ),
            SizedBox(
              height: notificationState is LoadingNextPage ? 50 : 30,
            )
          ],
        ));
  }
}
