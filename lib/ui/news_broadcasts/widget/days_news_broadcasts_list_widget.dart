import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vdl/data/responses/news_cast_response.dart';
import 'package:vdl/ui/news_broadcasts/page/news_broadcast_details/news_broadcast_details_page.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class DaysNewsBroadcastsWidget extends StatelessWidget {
  final List<String> broadcasts;
  final String date;
  final NewsCastResponse newsCast;
  final AudioPlayer introductionAudioPlayer;

  DaysNewsBroadcastsWidget({
    required this.broadcasts,
    required this.date,
    required this.newsCast,
    required this.introductionAudioPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: ListView.builder(
          itemCount: broadcasts.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                isActive(broadcasts[index])
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsBroadcastDetailsPage(
                                  newsCast: newsCast,
                                  timeSlutIndex: index,
                                  broadcasts: getTimesSluts(broadcasts),
                                  introductionAudioPlayer:
                                      introductionAudioPlayer,
                                )))
                    : log('');
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Image.asset(
                            isActive(broadcasts[index])
                                ? FilePath.PREVIOUS_BROADCAST
                                : FilePath.COMING_BROADCAST2,
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${getTimeSlut(broadcasts[index])}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: isActive(broadcasts[index])
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      isActive(broadcasts[index])
                          ? Flex(
                              direction: Axis.horizontal,
                              children: [
                                hasVideo(index)
                                    ? Icon(
                                        Icons.play_arrow,
                                        color: ProjectColors.ThemeColor,
                                      )
                                    : Container(),
                                Icon(
                                  Icons.headset,
                                  color: ProjectColors.ThemeColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  )),
            );
          }),
    );
  }

  String getTimeSlut(String s) => s.replaceAll('_', ':');

  bool isActive(String s) {
    var currentDate = DateTime.now();
    String formattedCurrentDate = DateFormat('dd-MM-yyyy').format(currentDate);

    if (isDayBeforeNow(date, formattedCurrentDate)) return true;

    String s2 = s.replaceAll('_', '.');
    double i = double.parse(s2);
    double currentHour = DateTime.now().hour.toDouble();
    return i < currentHour;
  }

  bool hasVideo(int index) {
    switch (index) {
      case 0:
        return newsCast.videoKwikMotionKeyBlock715 != '' ||
            newsCast.videoYoutubeKeyBlock715 != '';
      case 1:
        return newsCast.videoKwikMotionKeyBlock815 != '' ||
            newsCast.videoYoutubeKeyBlock815 != '';
      case 2:
        return newsCast.videoKwikMotionKeyBlock1015 != '' ||
            newsCast.videoYoutubeKeyBlock1015 != '';
      case 3:
        return newsCast.videoKwikMotionKeyBlock1415 != '' ||
            newsCast.videoYoutubeKeyBlock1415 != '';
      case 4:
        return newsCast.videoKwikMotionKeyBlock1715 != '' ||
            newsCast.videoYoutubeKeyBlock1715 != '';
      case 5:
        return newsCast.videoKwikMotionKeyBlock1915 != '' ||
            newsCast.videoYoutubeKeyBlock1915 != '';
      default:
        return false;
    }
  }

  bool isDayBeforeNow(String date, String now) {
    int day1 = int.parse(date.substring(0, date.indexOf('-')));
    int day2 = int.parse(now.substring(0, now.indexOf('-')));

    date = date.substring(date.indexOf('-') + 1);
    now = now.substring(now.indexOf('-') + 1);

    int month1 = int.parse(date.substring(0, date.indexOf('-')));
    int month2 = int.parse(now.substring(0, now.indexOf('-')));

    if (month1 < month2) return true;
    return ((day1 < day2) && (month1 <= month2)) ? true : false;
  }

  List<String> getTimesSluts(List<String> l) {
    List<String> res = [];
    l.forEach((element) {
      if (isActive(element)) res.add(getTimeSlut(element));
    });

    return res;
  }
}
