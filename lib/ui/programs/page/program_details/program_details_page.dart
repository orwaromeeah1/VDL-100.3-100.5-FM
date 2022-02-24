import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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

  ProgramDetailsPage({this.programId});

  @override
  _ProgramDetailsPageState createState() => _ProgramDetailsPageState();
}

class _ProgramDetailsPageState extends State<ProgramDetailsPage> {
  double width;
  ProgramDetailsResponse program;
  final _bloc = locator<ProgramDetailsBloc>();

  @override
  void initState() {
    _bloc.add(FetchProgramDetails(programId: widget.programId));
    super.initState();
  }

  BannerAd _bannerAd;
  bool _bannerAdIsLoaded = false;
  bool _bannerAdIfailed = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Create the ad objects and load ads.
    _bannerAd = BannerAd(
        size: AdSize.largeBanner,
        adUnitId: AdState.bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            print('$BannerAd loaded.');
            setState(() {
              _bannerAdIsLoaded = true;
            });
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            print('$BannerAd failedToLoad: $error');
            _bannerAdIsLoaded = true;

            _bannerAdIfailed = false;
            ad.dispose();
          },
          onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
          onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
        ),
        request: AdRequest())
      ..load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _bloc.close();
    super.dispose();
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
                          CachedNetworkImage(
                            imageUrl: '${program.image.original}',
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
              margin: EdgeInsets.only(top: 178),
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
                        child: InkWell(
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
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            '${Manager.removeAllHtmlTags(program.programInfoDescription.trim())}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
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
                              ? LoadingIndicator()
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
                          //Add Place
                          // Container(
                          //   height: 330,
                          //   padding: EdgeInsets.all(10),
                          //   margin: EdgeInsets.only(bottom: 20.0),
                          //   child: NativeAdmob(
                          //     // Your ad unit id
                          //     adUnitID:
                          //         'ca-app-pub-3940256099942544/8135179316',
                          //     numberAds: 3,
                          //     controller: _adController,
                          //     type: NativeAdmobType.full,
                          //   ),
                          // ),
//
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
                              itemCount: program.episodes.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return EpisodeCard(
                                  image:
                                      '${program.episodes[index].image.original}',
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
                        Text(
                          '${Manager.removeAllHtmlTags(program.programInfoDescription.trim())}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(17.5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
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
                            itemCount: program.episodes.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return EpisodeCard(
                                image:
                                    '${program.episodes[index].image.original}',
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
                image: CachedNetworkImageProvider(program.image.original),
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
