import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:html/parser.dart';

// import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:vdl/core/Manager.dart';
import 'package:vdl/data/responses/program_details_response.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_bloc.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_event.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_state.dart';
import 'package:vdl/ui/programs/widget/episode_card.dart';
import 'package:vdl/ui/shared_widget/error_screen.dart';
import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/utils/ads_manager/ad_state.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

import '../../../../injection.dart';

class ProgramDetailsPage extends StatefulWidget {
  final int programId;
  final bool isRadioTv;

  ProgramDetailsPage({this.programId, this.isRadioTv});

  @override
  _ProgramDetailsPageState createState() => _ProgramDetailsPageState();
}

class _ProgramDetailsPageState extends State<ProgramDetailsPage> {
  double width;
  ProgramDetailsResponse program;
  final _bloc = locator<ProgramDetailsBloc>();

  @override
  void initState() {
    _bloc.add(FetchProgramDetails(
        programId: widget.programId, isRadio: widget.isRadioTv));
    super.initState();
  }

  BannerAd _bannerAd;
  bool _bannerAdIsLoaded = false;
  bool _bannerAdIfailed = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Create the ad objects and load ads.
    if (!_bannerAdIsLoaded) {
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
                _bannerAdIsLoaded = true;
                _bannerAdIfailed = false;
              });

              ad.dispose();
            },
            onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
            onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
          ),
          request: AdRequest());
    }
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _bloc.close();
    super.dispose();
  }

  Future loadBanner() async {
    await _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocBuilder(
        bloc: _bloc,
        builder: (context, ProgramDetailsState state) {
          if (state is ProgramDetailsEmpty) {
            _bloc.add(FetchProgramDetails());
          }
          if (state is ProgramDetailsError) {
            return ErrorScreen(
              onRetry: () => _bloc.add(FetchProgramDetails()),
            );
          }
          if (state is ProgramDetailsLoaded) {
            program = state.program;
            loadBanner();
            return screenUiWithSliver();
          }

          if (state is ProgramDetailsLoading) {
            return LoadingScreen();
          }

          return Center(
            child: LoadingScreen(),
          );
        });
  }

  Widget screenUiWithSliver() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: MyDynamicHeader(
              expandedHeight: height / 3,
              program: program,
              viewAudio: true,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                padding: new EdgeInsets.only(top: 30, right: 10.0, left: 10.0),
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Container(
                            child: HtmlWidget(
                              program.programInfoDescription.trim(),
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(17.5)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: ProjectColors.ThemeColor,
                                  ),
                                  Text(
                                    '${program.programTextTime} ',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
//                          SizedBox(
//                            height: 20,
//                          ),
//                          Text(
//                            '${Bidi.stripHtmlIfNeeded(program.content)}',
//                            style: TextStyle(
//                              fontWeight: FontWeight.bold,
//                              fontSize: 14,
//                            ),
//                          ),
                        SizedBox(
                          height: 20,
                        ),
                        !_bannerAdIsLoaded
                            ? Container()
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

                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'الحلقات',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: program.episodes.length > 30
                                ? 30
                                : program.episodes.length,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return EpisodeCard(
                                episode: program.episodes[index],
                                youtubelink: program.episodes[index].youtubeKey,
                                image:
                                    '${program.episodes[index].image.thumbnail}',
                                date: '${program.episodes[index].humanDate}',
                                title: '${program.episodes[index].title}',
                                episodeNumber: 'الحلقة ${index + 1}',
                                id: program.episodes[index].id,
                                program: program,
                                containsAudio:
                                    program.episodes[index].containAudio,
                                containsVideo:
                                    program.episodes[index].containVideo,
                              );
                            }),
                        SizedBox(height: 50),
                      ],
                    ),
                  ],
                )),
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
}

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  double expandedHeight;
  ProgramDetailsResponse program;
  bool viewAudio;
  final VoidCallback hndlAudio;
  MyDynamicHeader(
      {@required this.expandedHeight,
      this.program,
      this.viewAudio,
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
                image: CachedNetworkImageProvider(program.image.medium),
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
                    Share.share(program.link);
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

String stripHtmlIfNeeded(String text) {
  return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}
