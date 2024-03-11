import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart' as Player;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vdl/core/Manager.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_bloc.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_event.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_state.dart';
import 'package:vdl/ui/NewsDetails/widgets/video_player.dart';

import 'package:vdl/ui/news/widgets/news_card_widget.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/utils/ads_manager/ad_state.dart';
import 'package:vdl/utils/project_colors/project_color.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

//
class NewsPageDetails extends StatefulWidget {
  final int newsId;
  String tag;

  final bool isSpecial;
  NewsPageDetails(
      {Key key, @required this.newsId, this.tag, @required this.isSpecial})
      : super(key: key);

  @override
  _NewsPageDetailsState createState() => _NewsPageDetailsState();
}

class _NewsPageDetailsState extends State<NewsPageDetails>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final _bloc = locator<NewsDetailsBloc>();
  AnimationController _animationController;
  bool isPlaying = false;
  bool hasAudio = true;
  Duration duration;
  Player.AudioPlayer audioPlayer = locator<Player.AudioPlayer>();
  bool audioLoaded = false;
  bool viewYoutube = false;
  String audioUrl = "";
//  BannerAd banner;
  String youtubeUrl = "";
////YoutubePlayer
  YoutubePlayerController _youtubeController;

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;

  //

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      if (isPlaying) {
        pauseMusic();
        isPlaying = true;
      }
      //stop your audio player
    } else if (state == AppLifecycleState.resumed) {
      if (isPlaying) {
        if (mounted) {
          setState(() {
            resume();
            isPlaying = true;
          });
        }
      }
    }
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  BannerAd _bannerAd;
  bool _bannerAdIsLoaded = false;
  bool _bannerAdIfailed = false;
  @override
  Future loadBanner() async {
    await _bannerAd.load();
  }

  void setAds() {
    _bannerAd = BannerAd(
        size: AdSize.largeBanner,
        adUnitId: AdState.bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            print('$BannerAd loaded.');
            setState(() {
              _bannerAdIfailed = false;
              _bannerAdIsLoaded = true;
            });
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            print('$BannerAd failedToLoad: $error');
            setState(() {
              _bannerAdIfailed = true;
              _bannerAdIsLoaded = true;
            });

            ad.dispose();
          },
          onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
          onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
        ),
        request: AdRequest());
  }

  @override
  void initState() {
    setAds();
    super.initState();
    audioPlayer.stop();
    WidgetsBinding.instance.addObserver(this);

    _bloc.add(FetchNewsDetails(widget.newsId, widget.isSpecial));

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

  /// Compulsory
  @override
  void dispose() {
    audioPlayer.stop();
    _bannerAd.dispose();
    _bloc.close();
    super.dispose();
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

  /// Compulsory
  pauseMusic() async {
    int result = await audioPlayer.pause();
  }

  resume() async {
    await audioPlayer.setReleaseMode(Player.ReleaseMode.STOP);
    await audioPlayer.setUrl(audioUrl);
    audioPlayer.resume();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        body: BlocConsumer(
            bloc: _bloc,
            builder: (context, state) {
              if (state is Loaded) {
                loadBanner();
                return LoadedScreen(context, state);
              } else if (state is Loading) {
                return LoadingScreen();
              }
              return Container();
            },
            listener: (context, state) {
              if (!audioLoaded && state is Loaded) {
                if (state.newsModel.audio != "") {
                  audioLoaded = true;

                  _bloc.add(FetchAudio(state.newsModel.audio));
                }

                if (state.newsModel.youtube != null ||
                    state.newsModel.video != null) {
                  setState(() {
                    String youtubeid;
                    if (state.newsModel.video != null &&
                        state.newsModel.video != '' &&
                        state.newsModel.video.contains('https')) {
                      viewYoutube = true;
                      youtubeid = getYoutubeId(state.newsModel.video);
                    }
                    if (state.newsModel.youtube != null &&
                        state.newsModel.youtube != '') {
                      viewYoutube = true;
                      youtubeid = getYoutubeId(state.newsModel.youtube);
                    }
                    _youtubeController = YoutubePlayerController(
                      initialVideoId: youtubeid,
                      params: YoutubePlayerParams(
                        startAt: Duration(seconds: 30),
                        showControls: true,
                        showFullscreenButton: true,
                      ),
                    );
                  });
                }
              } else if (state is AudioLoaded) {
                audioUrl = state.audio.file.url;
              }
            }));
  }

  Widget LoadedScreen(BuildContext context, Loaded state) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: MyDynamicHeader(
                expandedHeight: height / 2.5,
                state: state,
                viewAudio: audioLoaded,
                hndlAudio: () => _handleOnPressed()),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.14),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ]),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        !audioLoaded
                            ? Container()
                            // : Padding(
                            //     padding: const EdgeInsets.only(
                            //         left: 19.0, right: 19, top: 38),
                            //     child: Container(
                            //       height: 100,
                            //       width: MediaQuery.of(context).size.width,
                            //       child: WebView(
                            //         initialUrl: state.newsModel.audiowatFile,
                            //       ),
                            //     ),
                            //   )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    left: 19.0, right: 19, top: 38),
                                child: Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
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
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: CircleAvatar(
                                          radius: 22,
                                          backgroundColor:
                                              blue.withOpacity(0.41),
                                          child: CircleAvatar(
                                            backgroundColor: blue,
                                            radius: 15,
                                            child: InkWell(
                                              onTap: () => _handleOnPressed(),
                                              child: AnimatedIcon(
                                                icon: AnimatedIcons.play_pause,
                                                progress: _animationController,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0, left: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  Manager.removeAllHtmlTags(
                                                      state.newsModel.title),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/icons/recording.svg'),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          getTimeString(
                                                              audioDuration -
                                                                  timeProgress),
                                                          style: TextStyle(
                                                              color: black
                                                                  .withOpacity(
                                                                      0.41),
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.2,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: IgnorePointer(
                                                        ignoring:
                                                            audioDuration == 0,
                                                        child: ProgressBar(
                                                          thumbColor: green,
                                                          progressBarColor:
                                                              green,
                                                          thumbRadius: 5,
                                                          progress: Duration(
                                                              seconds:
                                                                  timeProgress),
                                                          buffered: Duration(
                                                              seconds:
                                                                  timeProgress),
                                                          total: Duration(
                                                              seconds:
                                                                  audioDuration),
                                                          timeLabelTextStyle:
                                                              TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                          onSeek: (duration) {
                                                            if (audioDuration !=
                                                                0) {
                                                              audioPlayer.seek(
                                                                  duration);
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 19.0, top: 17, left: 19),
                          child: Container(
                            child: Text(
                              state.newsModel.humanDate,
                              style: TextStyle(
                                  color: black.withOpacity(0.41), fontSize: 13),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 19.0, top: 4, left: 19),
                          child: Container(
                            child: Text(
                              Manager.removeAllHtmlTags(state.newsModel.title),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                        viewYoutube
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    right: 19.0, top: 9, left: 19, bottom: 10),
                                child: Column(
                                  children: [
                                    YoutubePlayerIFrame(
                                      controller: _youtubeController,
                                      aspectRatio: 16 / 9,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          _launchURL(
                                              state.newsModel.youtube.trim());
                                        },
                                        child: Text(
                                          'View in Youtube',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              )
                            : Container(),

                        if (state.newsModel.kwikmotion != null &&
                            state.newsModel.kwikmotion != "")
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: VideoPlayer(
                              path: state.newsModel.kwikmotion,
                            ),
                          ),

                        !_bannerAdIsLoaded
                            ? LoadingIndicator()
                            : _bannerAdIfailed
                                ? Container()
                                : Container(
                                    height: Platform.isIOS ? 330 : 150,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(
                                        bottom: Platform.isIOS ? 20.0 : 10),
                                    child: Center(
                                      child: AdWidget(
                                        ad: _bannerAd,
                                      ),
                                    )),
                        // Container(
                        //   height: 330,
                        //   padding: EdgeInsets.all(10),
                        //   margin: EdgeInsets.only(bottom: 20.0),
                        //   child: NativeAdmob(
                        //     // Your ad unit id
                        //     adUnitID: 'ca-app-pub-3940256099942544/8135179316',
                        //     numberAds: 3,
                        //     controller: _adController,
                        //     type: NativeAdmobType.full,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 19.0, top: 9, left: 19, bottom: 20),
                          child: Container(
                            child: HtmlWidget(
                              state.newsModel.content,
                              webViewMediaPlaybackAlwaysAllow: true,
                              webView: true,
                              webViewJs: true,
                            ),
                            //Html(data: state.newsModel.content),
                            //     Text(
                            //   Manager.removeAllHtmlTags(
                            //       state.newsModel.content),
                            //   style: TextStyle(fontSize: 15),
                            // ),
                          ),
                        ),
                        Platform.isIOS
                            ? Container()
                            : ListTileTheme(
                                contentPadding: const EdgeInsets.only(
                                    right: 19.0, left: 19, bottom: 34),
                                child: ExpansionTile(
                                  key: GlobalKey(),
                                  title: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        child: Text(
                                          "المصدر:",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      )),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: state.newsModel.link == null
                                          ? Text(
                                              'No Brand Brief',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                _launchURL(
                                                    state.newsModel.link);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  state.newsModel.link,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ],
                )),
            state.newsModel.relatedArticles.isEmpty
                ? Container()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 19.0, top: 34, left: 19, bottom: 15),
                        child: Container(
                          child: Center(
                            child: Text(
                              'اقرأ ايضا',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 400,
                        child: Swiper(
                          autoplay: false,
                          loop: false,
                          itemHeight: 330,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 24),
                              child: NewsCardWidget(
                                newsModel: newsModelFromRelatedArticle(
                                  state.newsModel.relatedArticles[index],
                                ),
                              ),
                            );
                          },
                          itemCount: state.newsModel.relatedArticles.length,
                          pagination: SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.grey,
                                  activeColor: Colors.green,
                                  size: 10.0,
                                  activeSize: 10.0)),
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: 50,
            )
          ])),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
      if (timeProgress != 0 && isPlaying) {
        resume();
      } else if (isPlaying) {
        stopMusic();
        playMusic();
      } else {
        pauseMusic();
      }
    });
  }
}

String getYoutubeId(String link) {
  try {
    var youtubeid = "";
    if (link.contains('&')) {
      return link.substring(link.indexOf('=') + 1, link.indexOf('&'));
    } else if (link.contains('?')) {
      return link.substring(link.indexOf('=') + 1).trim();
    } else {
      return link.substring(17).trim();
    }
  } catch (e) {
    return "";
  }
}

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  double expandedHeight;
  Loaded state;
  bool viewAudio;
  final VoidCallback hndlAudio;
  MyDynamicHeader(
      {@required this.expandedHeight,
      this.state,
      @required this.viewAudio,
      this.hndlAudio});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var width = MediaQuery.of(context).size.width;

    var height = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: Stack(
            children: [
              Stack(
                children: [
                  Positioned(
                    left: 19,
                    top: 40,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        radius: 16,
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: black.withOpacity(0.71),
                      ),
                    ),
                  ),
                ],
              ),
              // Positioned(
              //   child:
              //   top: 35,
              //   right: 20,
              // )
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    CachedNetworkImageProvider(state.newsModel.image.original),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: shrinkOffset < minExtent
              ? expandedHeight - (height / 22) - shrinkOffset
              : expandedHeight - (height / 22) - minExtent,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Share.share(state.newsModel.link);
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.14),
                            blurRadius: 7,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(48 / 2)),
                    child: Icon(
                      Icons.reply,
                      color: green,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                viewAudio
                    ? InkWell(
                        onTap: () {
                          hndlAudio();
                        },
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: green.withOpacity(0.41),
                          child: CircleAvatar(
                            backgroundColor: green,
                            radius: 25,
                            child: Icon(
                              CupertinoIcons.speaker_2_fill,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight / 2;
}
