import 'dart:developer';

import 'package:audioplayers/audioplayers.dart' as Player;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vdl/data/responses/episode_response.dart';
import 'package:vdl/data/responses/program_details_response.dart';
import 'package:vdl/ui/NewsDetails/widgets/video_player.dart';
import 'package:vdl/ui/programs/bloc/episode/episode_bloc.dart';
import 'package:vdl/ui/programs/bloc/episode/episode_event.dart';
import 'package:vdl/ui/programs/bloc/episode/episode_state.dart';
import 'package:vdl/ui/programs/widget/episode_card.dart';
import 'package:vdl/ui/shared_widget/app_progress_indicator.dart';
import 'package:vdl/ui/shared_widget/error_screen.dart';
import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

import '../../../../injection.dart';
import '../../../NewsDetails/widgets/html_viewer.dart';

class EpisodePage extends StatefulWidget {
  final int episodeId;
  final ProgramDetailsResponse program;
  final String youtubeVideo;
  final Episodes episode;

  EpisodePage(
      {@required this.episodeId,
      @required this.program,
      this.youtubeVideo,
      this.episode})
      : assert(episodeId != null && program != null);

  @override
  _EpisodePageState createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  double width;
  final _bloc = locator<EpisodeBloc>();
  //EpisodeResponse episode = new EpisodeResponse();
  AnimationController _animationController;
  bool isPlaying = false;
  Duration duration;
  Player.AudioPlayer audioPlayer = locator<Player.AudioPlayer>();
  bool audioLoaded = false;
  String audioUrl = "";
  List<Episodes> episodes = [];

  bool containsVideo = false;
  String youtubeUrl = "";

////YoutubePlayer
  YoutubePlayerController _youtubeController;

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _bloc.add(FetchEpisode(episode: widget.episode));
    super.initState();
    episodes = widget.program.episodes;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    // Triggers the onDurationChanged listener and sets the max duration string
    audioPlayer.onDurationChanged.listen((Duration duration) {
      if (mounted) {
        setState(() {
          audioDuration = duration.inSeconds;
        });
      }
    });
    audioPlayer.onAudioPositionChanged.listen((Duration position) async {
      if (mounted) {
        setState(() {
          timeProgress = position.inSeconds;
        });
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
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      if (isPlaying) {
        pauseMusic();
        isPlaying = true;
      }

      //stop your audio player
    }
    //  else if (state == AppLifecycleState.resumed) {
    //   if (isPlaying) {
    //     if (mounted) {
    //       setState(() {
    //         isPlaying = true;
    //         resume();
    //       });
    //     }
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocBuilder(
        bloc: _bloc,
        builder: (context, EpisodeState state) {
          if (state is EpisodeEmpty) {
            _bloc.add(FetchEpisode(episode: widget.episode));
          }
          if (state is EpisodeError) {
            return ErrorScreen(
                onRetry: () =>
                    _bloc.add(FetchEpisode(episode: widget.episode)));
          }
          if (state is EpisodeLoaded) {
            ;
            containsVideo = (widget.episode.video != "");

            if (containsVideo) {
              _youtubeController = YoutubePlayerController(
                initialVideoId: _getYoutubeId(widget.episode.video),
                params: YoutubePlayerParams(
                  startAt: Duration(seconds: 30),
                  showControls: true,
                  showFullscreenButton: true,
                ),
              );
            }
            _bloc.add(FetchAudio(audioKey: widget.episode.audio));
            return screenUi();
          }

          if (state is AudioLoaded) {
            return screenUi();
          }
          if (state is EpisodeLoading) {
            return LoadingScreen();
          }

          return Center(
            child: LoadingScreen(),
          );
        });
  }

  Widget screenUi() {
    return Scaffold(
      body: Container(
        width: width,
        child: Stack(
          children: <Widget>[
            // image
            Positioned(
              top: 0,
              child: new Column(
                children: <Widget>[
                  new Container(
                      height: 211,
                      width: width,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.episode.image.medium),
                                    fit: BoxFit.cover)),
                          ),
                          // CachedNetworkImage(
                          //   imageUrl: '${episode.image.original}',
                          //   imageBuilder: (context, imageProvider) => Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     padding: EdgeInsets.symmetric(horizontal: 25),
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //         image: imageProvider,
                          //         fit: BoxFit.cover,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                              left: 10,
                              top: 40,
                              child: GlowingCircularButton(
                                color: Colors.black26,
                                onClick: () {
                                  Navigator.pop(context);
                                },
                                size: 35,
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      )),
                ],
              ),
            ),

            new Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 180),
              padding: new EdgeInsets.only(top: 0, right: 10.0, left: 10.0),
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GlowingCircularButton(
                          size: 50,
                          color: Colors.white,
                          onClick: () {
                            Share.share(widget.episode.link);
                          },
                          iconImage: FilePath.SHARE,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 20),
                        child: GlowingCircularButton(
                          size: 50,
                          color: ProjectColors.ThemeColor,
                          isGlowing: true,
                          onClick: () {
                            _handleOnPressed();
                          },
                          icon: Icon(
                            Icons.volume_down,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Text(
                              '${Bidi.stripHtmlIfNeeded(widget.program.title)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Text(
                              '${Bidi.stripHtmlIfNeeded(widget.episode.title)}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Icon(
                                  Icons.watch_later,
                                  color: ProjectColors.ThemeColor,
                                ),
                                Text('${widget.episode.time}'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          BlocListener(
                            bloc: _bloc,
                            listener: (context, state) {
                              if (state is AudioLoaded) {
                                setState(() {
                                  log('audios fully loaded');
                                  isPlaying = false;
                                  isPlaying = false;
                                  audioLoaded = true;
                                  audioUrl = state.audio.file.url;
                                });
                              }
                            },
                            child: Container(
                              height: 100,
                              width: width * 0.9,
                              padding: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.14),
                                    blurRadius: 10,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20.0, bottom: 20),
                                        child: GlowingCircularButton(
                                          size: 30,
                                          color: ProjectColors.ThemeColor,
                                          icon: audioLoaded
                                              ? AnimatedIcon(
                                                  icon:
                                                      AnimatedIcons.play_pause,
                                                  progress:
                                                      _animationController,
                                                  size: 15,
                                                  color: Colors.white,
                                                )
                                              : VdlProgressIndicator(
                                                  size: 5,
                                                  color: Colors.white,
                                                ),
                                          onClick: () {
                                            _handleOnPressed();
                                          },
                                          isGlowing: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'استمع للحلقة',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/recording.svg'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                getTimeString(audioDuration -
                                                    timeProgress),
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                height: 10,
                                                width: width * 0.3,
                                                child: IgnorePointer(
                                                  ignoring: audioDuration == 0,
                                                  child: ProgressBar(
                                                    thumbColor: green,
                                                    progressBarColor: green,
                                                    thumbRadius: 5,
                                                    progress: Duration(
                                                        seconds: timeProgress),
                                                    buffered: Duration(
                                                        seconds: timeProgress),
                                                    total: Duration(
                                                        seconds: audioDuration),
                                                    timeLabelTextStyle:
                                                        TextStyle(
                                                            color:
                                                                Colors.white),
                                                    onSeek: (duration) {
                                                      if (audioDuration != 0) {
                                                        audioPlayer
                                                            .seek(duration);
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // youtube vedio
                          containsVideo
                              ? VideoPlayer(
                                  path: 'https://embed.kwikmotion.com/Embed/' +
                                      widget.episode.video,
                                )

                              // Padding(
                              //     padding: const EdgeInsets.only(
                              //         right: 19.0,
                              //         top: 9,
                              //         left: 19,
                              //         bottom: 10),
                              //     child: Column(
                              //       children: [
                              //         YoutubePlayerIFrame(
                              //           controller: _youtubeController,
                              //           aspectRatio: 16 / 9,
                              //         ),
                              //         SizedBox(
                              //           height: 10,
                              //         ),
                              //         InkWell(
                              //             onTap: () {
                              //               _launchURL(episode.video.trim());
                              //             },
                              //             child: Text(
                              //               'View in Youtube',
                              //               style: TextStyle(
                              //                   fontWeight: FontWeight.bold),
                              //             ))
                              //       ],
                              //     ),
                              //   )
                              : Container(),
                          if (widget.youtubeVideo != null &&
                              widget.youtubeVideo != '')
                            Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: HtmlViewer(
                                          html:
                                              '<iframe src="https://www.youtube.com/embed/${widget.youtubeVideo}"></iframe>')
                                      // VideoPlayer(
                                      //   path: video,
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 8.0),
                          //   child: Align(
                          //     alignment: Alignment.centerRight,
                          //     child: Text(
                          //       'باقي الحلقات',
                          //       style: TextStyle(
                          //           fontSize: 20, fontWeight: FontWeight.bold),
                          //     ),
                          //   ),
                          // ),

                          // ListView.builder(
                          //     shrinkWrap: true,
                          //     itemCount: episodes.length,
                          //     physics: NeverScrollableScrollPhysics(),
                          //     padding: EdgeInsets.zero,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return widget.episodeId == episodes[index].id
                          //           ? Container()
                          //           : EpisodeCard(
                          //               image:
                          //                   '${episodes[index].image.original}',
                          //               date: '${episodes[index].humanDate}',
                          //               title: '${episodes[index].title}',
                          //               episodeNumber: 'الحلقة ${index + 1}',
                          //               id: widget.program.episodes[index].id,
                          //               program: widget.program,
                          //               containsVideo: widget.program
                          //                   .episodes[index].containVideo,
                          //               containsAudio: widget.program
                          //                   .episodes[index].containAudio,
                          //             );
                          //     }),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  resume() async {
    await audioPlayer.setReleaseMode(Player.ReleaseMode.STOP);
    await audioPlayer.setUrl(audioUrl);
    audioPlayer.resume();
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
      setState(() => {print(d)});
    });
  }

  /// Compulsory
  pauseMusic() async {
    int result = await audioPlayer.pause();
  }

  stopMusic() async {
    int result = await audioPlayer.stop();
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }

  /// Compulsory
  @override
  void dispose() {
    if (_youtubeController != null) {
      _youtubeController.close();
    }
    audioPlayer.pause();
    _bloc.close();
    super.dispose();
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
      if (timeProgress != 0 && isPlaying) {
        resume();
      } else if (isPlaying) {
        playMusic();
      } else {
        pauseMusic();
      }
    });
  }

  String _getYoutubeId(String link) {
    if (link.contains('&')) {
      return link.substring(link.indexOf('=') + 1, link.indexOf('&'));
    } else if (link.contains('?')) {
      return link.substring(link.indexOf('=') + 1).trim();
    } else {
      return link.substring(17).trim();
    }
  }
}
