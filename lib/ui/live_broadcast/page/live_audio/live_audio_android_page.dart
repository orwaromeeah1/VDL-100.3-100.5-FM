import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/live_broadcast/bloc/live_podcast_bloc.dart';
import 'package:vdl/ui/live_broadcast/bloc/live_podcast_state.dart';
import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:just_audio/just_audio.dart';

import 'package:vdl/utils/project_colors/project_color.dart';

// Must be a top-level function

class BackGroundAndroidAudioPlayer {
  final player = AudioPlayer();
}

class AndroidLiveAudioPage extends StatefulWidget {
  const AndroidLiveAudioPage({Key? key}) : super(key: key);

  @override
  _AndroidLiveAudioPageState createState() => _AndroidLiveAudioPageState();
}

class _AndroidLiveAudioPageState extends State<AndroidLiveAudioPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool isPlaying = false;
  late double width;
  String audioUrl = "https://l3.itworkscdn.net/itwaudio/9054/stream";
  late double height;
  late AnimationController _animationController;

  bool hasAudio = true;
  Duration? duration;
  bool audioLoaded = false;
  bool viewYoutube = false;
  final bloc = locator<LivePodcastBloc>();
  final player = locator<BackGroundAndroidAudioPlayer>();

  @override
  void dispose() async {
    super.dispose();
    player.player.stop();
  }

  @override
  void initState() {
    super.initState();
    //  audioPlayer.stop();
    WidgetsBinding.instance.addObserver(this);
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    player.player.setUrl(audioUrl);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      if (player.player.playing) {
        if (mounted) {
          setState(() {
            isPlaying = true;
            _animationController.forward();
          });
        }
      } else {
        if (mounted) {
          setState(() {
            isPlaying = false;
            _animationController.reverse();
          });
        }
      }
    }
    if (state == AppLifecycleState.resumed) {
      if (player.player.playing) {
        if (mounted) {
          setState(() {
            isPlaying = true;
            _animationController.forward();
          });
        }
      } else {
        if (mounted) {
          setState(() {
            isPlaying = false;
            _animationController.reverse();
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return BlocConsumer(
      bloc: bloc,
      listener: (context, state) {
        if (state is PodcastStoped) {
          setState(() {
            player.player.stop();
            isPlaying = false;
            _animationController.reverse();
          });
        }
      },
      builder: (context, state) {
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
                                          MediaQuery.of(context).size.height /
                                              2.5,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                  Center(
                                    heightFactor: height * 0.4,
                                    widthFactor: width * 0.4,
                                    child: Image.asset(
                                      FilePath.LOGO,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.5 *
                                              0.3,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(FilePath.VOICE),
                                        fit: BoxFit.fitWidth)),
                                child: Center(
                                  child: GlowingCircularButton(
                                    isGlowing: true,
                                    icon: InkWell(
                                      onTap: () => _handleOnPressed(),
                                      child: AnimatedIcon(
                                        color: Colors.white,
                                        icon: AnimatedIcons.play_pause,
                                        progress: _animationController,
                                        size: 30,
                                      ),
                                    ),
                                    onClick: () {},
                                    color: ProjectColors.ThemeColor,
                                    size: 50,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
      },
    );
  }

  void _handleOnPressed() {
    if (mounted) {
      setState(() {
        isPlaying = !isPlaying;
        isPlaying
            ? _animationController.forward()
            : _animationController.reverse();

        if (isPlaying) {
          player.player.play();
        } else {
          player.player.stop();
        }
      });
    }
  }
}
