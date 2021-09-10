import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vdl/ui/live_broadcast/page/live_audio/live_audio_android_page.dart';
import 'package:vdl/ui/live_broadcast/widget/live_stream_button.dart';
import 'package:vdl/ui/live_broadcast/widget/logo_widget.dart';
import 'package:vdl/utils/file_path/file_path.dart';

import 'live_audio/live_audio_page.dart';
import 'live_video/live_video_page.dart';

class LiveBroadcastPage extends StatefulWidget {
  @override
  _LiveBroadcastPageState createState() => _LiveBroadcastPageState();
}

class _LiveBroadcastPageState extends State<LiveBroadcastPage> {
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  FilePath.LIVE_BACKGROUND,
                ),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
              width: width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(FilePath.MASK), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: LogoWidget(
                      size: 100,
                    ),
                  ),
                  LiveStreamButton(
                    image: FilePath.AUDIO_LOGO,
                    text: 'بث سمعي',
                    onClick: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Platform.isAndroid
                                ? AndroidLiveAudioPage()
                                : LiveAudioPage())),
                  ),
                  // LiveStreamButton(
                  //   image: FilePath.VIDEO_LOGO,
                  //   text: 'بث بصري',
                  //   onClick: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => LiveVideoPage())),
                  // ),
                ],
              )),
        ),
      ),
    );
  }
}
