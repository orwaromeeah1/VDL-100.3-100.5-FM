import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';
import 'package:vdl/ui/live_broadcast/widget/live_stream_button.dart';
import 'package:vdl/ui/programs/page/program_details/program_details_page.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

import '../../live_broadcast/page/live_audio/live_audio_android_page.dart';
import '../../live_broadcast/page/live_audio/live_audio_page.dart';
import '../../live_broadcast/page/live_video/live_video_page.dart';

class ProgramScheduleCard extends StatelessWidget {
  final String image;
  final String duration;
  String link;
  final int id;
  final String name;
  final bool isRadio;
  final bool isDisplayingNow;

  ProgramScheduleCard(
      {this.name,
      this.image,
      this.duration,
      this.id,
      this.link,
      //TODO : show something if program is displaying now
      this.isDisplayingNow: false,
      this.isRadio});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDisplayingNow && isRadio) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Platform.isAndroid
                      ? AndroidLiveAudioPage()
                      : LiveAudioPage()));
        } else if (isDisplayingNow && !isRadio) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LiveVideoPage()));
        } else {
          id != 0
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProgramDetailsPage(
                            isRadioTv: isRadio,
                            programId: id,
                          )))
              : null;
        }
      },
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    CachedNetworkImage(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 77,
                      imageUrl: '$image',
                      imageBuilder: (context, imageProvider) => Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 24,
                          width: 45,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              '$duration',
                              style: TextStyle(
                                  color: ProjectColors.ThemeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text(
                          '$name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
                if (isDisplayingNow)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'يعرض الان',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 17,
                  child: InkWell(
                      onTap: () {
                        Share.share(link);
                      },
                      child: Icon(
                        Icons.share,
                        color: Colors.black,
                        size: 17,
                      )),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
