import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/ui/live_broadcast/widget/audio_play_widget.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';
import 'package:video_player/video_player.dart';

class LiveVideoPage extends StatefulWidget {
  @override
  _LiveVideoPageState createState() => _LiveVideoPageState();
}

class _LiveVideoPageState extends State<LiveVideoPage> {
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    VideoPlayerController _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

    @override
    void initState() {
      super.initState();

      _controller.addListener(() {
        setState(() {});
      });

      _controller.initialize();

      ;
    }

    @override
    void dispose() {
      super.dispose();
      _controller.dispose();
    }

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
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      child: Container(
                        width: width,
                        margin: EdgeInsets.only(top: 50),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                padding: EdgeInsets.only(right: 3),
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _controller.value.isInitialized
                              ? VideoPlayer(_controller)
                              : Container(),
                          // Image.asset(
                          //   FilePath.LOGO,
                          //   height: 100,
                          //   width: 100,
                          // ),
                          // SizedBox(
                          //   height: 32,
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 20),
                          //   child: Container(
                          //     height: MediaQuery.of(context).size.height / 4,
                          //     width: MediaQuery.of(context).size.width,
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             color: ProjectColors.ThemeColor,
                          //             width: 1),
                          //         image: DecorationImage(
                          //             image: AssetImage(
                          //               FilePath.VIDEO_IMAGE_BACKGROUND,
                          //             ),
                          //             fit: BoxFit.fill)),
                          //     child: AudioPlayWidget(),
                          //   ),
                          // ),
                          SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(FilePath.VIDEO_LOGO),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'بث بصري',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
