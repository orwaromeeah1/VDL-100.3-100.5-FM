import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vdl/data/models/notification_model.dart';
import 'package:vdl/ui/NewsDetails/page/news_detials_page_s.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

import '../../../data/models/news_model.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    Key key,
    this.notificationModel,
  }) : super(key: key);
  final NewsModel notificationModel;

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => NewsPageDetails(
        //               newsId: notificationModel.id,
        //               isSpecial: false,
        //             )));
        _launchURL(notificationModel.link);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 19.0, right: 19, bottom: 21),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 17.0, left: 14, right: 16, bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48,
                  child: Text(
                    notificationModel.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 18,
                  child: Row(
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: green,
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        notificationModel.humanDate,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
