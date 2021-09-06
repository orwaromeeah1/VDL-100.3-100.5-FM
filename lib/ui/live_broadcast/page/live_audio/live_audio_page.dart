import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/injection.dart';
import 'package:audioplayers/audioplayers.dart' as Player;
import 'package:vdl/ui/live_broadcast/widget/audio_play_widget.dart';

import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/utils/file_path/file_path.dart';

import 'package:vdl/utils/project_colors/project_color.dart';

class LiveAudioPage extends StatefulWidget {
  @override
  _LiveAudioPageState createState() => _LiveAudioPageState();
}

class _LiveAudioPageState extends State<LiveAudioPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  double width;
  double height;
  AnimationController _animationController;
  bool isPlaying = false;
  bool hasAudio = true;
  Duration duration;
  Player.AudioPlayer audioPlayer = locator<Player.AudioPlayer>();
  bool audioLoaded = false;
  bool viewYoutube = false;
  String audioUrl = "https://l3.itworkscdn.net/itwaudio/9054/stream";

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      if (isPlaying) {
        pauseMusic();
        isPlaying = true;
      }
      //stop your audio player
    }
  }

  pauseMusic() async {
    int result = await audioPlayer.pause();
  }

  /// Compulsory
  playMusic() async {
    await audioPlayer.setUrl(
        audioUrl); // prepare the player with this audio but do not start playing
    await audioPlayer.setReleaseMode(Player.ReleaseMode.STOP);
    int result = await audioPlayer.play(audioUrl);
    if (result == 1) {
      // success
    }
    audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      if (mounted) {
        setState(() => {print(d)});
      }
    });
  }

  stopMusic() async {
    int result = await audioPlayer.stop();
  }

  @override
  void initState() {
    super.initState();
    audioPlayer.stop();
    WidgetsBinding.instance.addObserver(this);

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));

    audioPlayer.onPlayerStateChanged.listen((state) async {
      if (audioPlayer.state == Player.PlayerState.PAUSED) {
        if (mounted) {
          setState(() {
            isPlaying = false;
            _animationController.reverse();
          });
        }
      }
    });

    audioPlayer.onPlayerCompletion.listen((event) {
      if (mounted) {
        setState(() {
          audioPlayer.seek(Duration(seconds: 0));
          _handleOnPressed();
        });
      }
    });
  }

  // Audio _audioPlayer;
  // PlayerState audioPlayerState = PlayerState.STOPPED;
  // bool _loading = false;
  // bool _isLive = false;
  // @override
  // void initState() {
  //   super.initState();

  //   // Init audio player with a callback to handle events
  //   _audioPlayer = Audio.instance();

  //   // Listen for audio player events
  //   listenForAudioPlayerEvents();
  // }

  // @override
  // void didUpdateWidget(AudioPlayout oldWidget) {
  //   if (oldWidget.desiredState != widget.desiredState) {
  //     _onDesiredStateChanged(oldWidget);
  //   } else if (oldWidget.url != widget.url) {
  //     play();
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  // /// The [desiredState] flag has changed so need to update playback to
  // /// reflect the new state.
  // void _onDesiredStateChanged(AudioPlayout oldWidget) async {
  //   switch (widget.desiredState) {
  //     case PlayerState.PLAYING:
  //       play();
  //       break;
  //     case PlayerState.PAUSED:
  //       pause();
  //       break;
  //     case PlayerState.STOPPED:
  //       pause();
  //       break;
  //   }
  // }

  // @override
  // void onPlay() {
  //   setState(() {
  //     audioPlayerState = PlayerState.PLAYING;
  //     _loading = false;
  //   });
  // }

  // @override
  // void onPause() {
  //   setState(() {
  //     audioPlayerState = PlayerState.PAUSED;
  //   });
  // }

  // @override
  // void onSeek(int position, double offset) {
  //   super.onSeek(position, offset);
  // }

  // @override
  // void onDuration(int duration) {
  //   if (duration <= 0) {
  //     setState(() {
  //       _isLive = true;
  //     });
  //   } else {
  //     setState(() {
  //       _isLive = false;
  //       this.duration = Duration(milliseconds: duration);
  //     });
  //   }
  // }

  // @override
  // void onError(String error) {
  //   super.onError(error);
  // }

  // get isPlaying => audioPlayerState == PlayerState.PLAYING;
  // get isPaused =>
  //     audioPlayerState == PlayerState.PAUSED ||
  //     audioPlayerState == PlayerState.STOPPED;

  // get durationText =>
  //     duration != null ? duration.toString().split('.').first : '';
  // // Request audio pause
  // Future<void> pause() async {
  //   _audioPlayer.pause();
  //   setState(() => audioPlayerState = PlayerState.PAUSED);
  // }

  // // Request audio stop. this will also clear lock screen controls
  // Future<void> stop() async {
  //   _audioPlayer.reset();

  //   setState(() {
  //     audioPlayerState = PlayerState.STOPPED;

  //   });
  // }
  // @override
  // void dispose() {
  //   if (mounted) {
  //     _audioPlayer.dispose();
  //   }
  //   super.dispose();
  // }
  // Future<void> play() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   // here we send position in case user has scrubbed already before hitting
  //   // play in which case we want playback to start from where user has
  //   // requested
  //   _audioPlayer.play(widget.url,
  //       title: widget.title,
  //       subtitle: widget.subtitle,

  //       isLiveStream: false);
  // }

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
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
      if (isPlaying) {
        playMusic();
      } else {
        stopMusic();
      }
    });
  }
}
