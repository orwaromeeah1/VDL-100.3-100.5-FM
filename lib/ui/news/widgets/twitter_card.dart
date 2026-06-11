import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vdl/data/models/tweets_model.dart';
import 'package:vdl/utils/project_colors/project_color.dart';
import 'package:timeago/timeago.dart' as timeago;

class twitterCard extends StatelessWidget {
  final Tweet tweet;
  const twitterCard({
    Key? key,
    required this.tweet,
  }) : super(key: key);

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    return InkWell(
      onTap: () {
        _launchURL("https://twitter.com/sawtlebnan?lang=en");
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, bottom: 10),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ], borderRadius: BorderRadius.circular(7), color: Colors.white),
          height: 117,
          width: 272,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 19.0, left: 14, right: 15, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timeago.format(tweet.createdAt ?? DateTime.now(), locale: 'ar'),
                  style:
                      TextStyle(fontSize: 11, color: black.withOpacity(0.41)),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  tweet.text ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
