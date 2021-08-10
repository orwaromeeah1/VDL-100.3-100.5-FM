import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/ui/live_broadcast/widget/audio_play_widget.dart';
import 'package:vdl/ui/live_broadcast/widget/logo_widget.dart';
import 'package:vdl/utils/file_path/file_path.dart';

class LiveAudioPage extends StatefulWidget {
  @override
  _LiveAudioPageState createState() => _LiveAudioPageState();
}

class _LiveAudioPageState extends State<LiveAudioPage> {
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

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
                    margin: EdgeInsets.only(top: 50),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(children: [
                              Center(
                                child: SvgPicture.asset(
                                  'assets/images/illustration.svg',
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              Center(
                                heightFactor: height * 0.4,
                                widthFactor: width * 0.4,
                                child: Image.asset(
                                  FilePath.LOGO,
                                  height: MediaQuery.of(context).size.height /
                                      2.5 *
                                      0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          AudioPlayWidget(),
                          Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(FilePath.AUDIO_LOGO),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'بث سمعي',
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
