import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vdl/core/Manager.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/ArticleDetails/bloc/Article_details_bloc.dart';
import 'package:vdl/ui/ArticleDetails/bloc/article_details_event.dart';
import 'package:vdl/ui/ArticleDetails/bloc/article_details_state.dart';
import 'package:vdl/ui/news/widgets/news_card_widget.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/utils/ads_manager/ad_state.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class ArticleDetailsPage extends StatefulWidget {
  final int id;
  const ArticleDetailsPage({Key key, @required this.id}) : super(key: key);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;
  final _bloc = locator<ArticleDetailsBloc>();
  BannerAd banner;
  Duration duration;
  AudioPlayer audioPlayer = AudioPlayer();
  bool audioLoaded = false;
  String audioUrl = "";

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;
  //
  @override
  void initState() {
    super.initState();
    _bloc.add(FetchArticleDetails(widget.id));
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    // Triggers the onDurationChanged listener and sets the max duration string
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inSeconds;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration position) async {
      setState(() {
        timeProgress = position.inSeconds;
      });
    });
  }

  /// Compulsory
  playMusic() async {
    await audioPlayer.setUrl(
        audioUrl); // prepare the player with this audio but do not start playing
    await audioPlayer.setReleaseMode(ReleaseMode.STOP);
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
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = locator<AdState>();
    adState.initialization.then((value) {
      setState(() {
        banner = BannerAd(
            adUnitId: adState.bannerAdUnitId,
            size: AdSize.mediumRectangle,
            request: AdRequest(),
            listener: adState.adListener)
          ..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer(
      bloc: _bloc,
      builder: (context, state) {
        if (state is Loaded) {
          return loadedStateUI(context, state.article);
        } else if (state is Loading) {
          return LoadingScreen();
        }
        return Container();
      },
      listener: (context, state) {
        if (!audioLoaded && state is Loaded) {
          if (state.article.audio != "") {
            audioLoaded = true;
            _bloc.add(FetchAudio(state.article.audio));
          }
        } else if (state is AudioLoaded) {
          audioUrl = state.audio.file.url;
        }
      },
    )
    );
  }

  Widget loadedStateUI(BuildContext context, NewsModel article) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
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
                      Container(
                        height: 189,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 19,
                              top: 40,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: CircleAvatar(
                                      radius: 16,
                                      child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Icon(
                                          CupertinoIcons.back,
                                          color: black,
                                        ),
                                      ),
                                      backgroundColor: black.withOpacity(0.07),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.14),
                                                blurRadius: 10,
                                                offset: Offset(0, 10),
                                              ),
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(48 / 2)),
                                        child: Icon(
                                          Icons.reply,
                                          color: green,
                                          size: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      CircleAvatar(
                                        radius: 32,
                                        backgroundColor:
                                            green.withOpacity(0.41),
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 40,
                              right: 19,
                              child: Column(
                                children: [
                                  Container(
                                    height: 102,
                                    width: 102,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(51),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                article
                                                    .selectAuthor.image.medium),
                                            fit: BoxFit.fitHeight)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        MaterialIcons.format_quote,
                                        color: blue,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        article.selectAuthor.name,
                                        style: TextStyle(
                                          color: blue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      !audioLoaded
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.only(
                                left: 19.0,
                                right: 19,
                              ),
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
                                        backgroundColor: blue.withOpacity(0.41),
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
                                          top: 16.0,
                                          left: 15,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Text(
                                                Manager.removeAllHtmlTags(
                                                    article.title),
                                                maxLines: 2,
                                                textAlign: TextAlign.right,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons.recordingtape,
                                                  color: blue,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  getTimeString(audioDuration -
                                                      timeProgress),
                                                  style: TextStyle(
                                                      color: black
                                                          .withOpacity(0.41),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            )
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
                            article.humanDate,
                            style: TextStyle(
                                color: black.withOpacity(0.41),
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 19.0, top: 4, left: 19),
                        child: Container(
                          child: Text(
                            Manager.removeAllHtmlTags(article.title),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 19.0, top: 9, left: 19),
                        child: Container(
                          child: Text(
                            Manager.removeAllHtmlTags(article.content),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      banner == null
                          ? Container(height: 20)
                          : Container(
                              height: 240,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: AdWidget(
                                  ad: banner,
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 19.0, left: 19, bottom: 34),
                        child: Container(
                          child: Text(
                            Manager.removeAllHtmlTags(article.excerpt),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ],
              )),
          // Padding(
          //   padding: const EdgeInsets.only(
          //       right: 19.0, top: 34, left: 19, bottom: 15),
          //   child: Container(
          //     child: Center(
          //       child: Text(
          //         'اقرأ ايضا',
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   height: 400,
          //   child: Swiper(
          //     itemHeight: 330,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Padding(
          //         padding: const EdgeInsets.only(top: 10.0, bottom: 24),
          //         child: NewsCardWidget(newsModel:,),
          //       );
          //     },
          //     itemCount: 3,
          //     pagination: SwiperPagination(
          //         builder: DotSwiperPaginationBuilder(
          //             color: Colors.grey,
          //             activeColor: Colors.green,
          //             size: 10.0,
          //             activeSize: 10.0)),
          //   ),
          // ),
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
      isPlaying ? playMusic() : pauseMusic();
    });
  }
}
