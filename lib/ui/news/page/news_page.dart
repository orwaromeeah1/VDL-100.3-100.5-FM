import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

import 'package:flutter_svg/svg.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:vdl/data/models/homeModel.dart';
import 'package:vdl/data/models/news_category.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/Articles/widgets/article_card_widget.dart';
import 'package:vdl/ui/news/bloc/news_bloc.dart';
import 'package:vdl/ui/news/bloc/news_event.dart';
import 'package:vdl/ui/news/bloc/news_state.dart';
import 'package:vdl/ui/news/page/search/search_page.dart';
import 'package:vdl/ui/news/widgets/news_card_widget.dart';
import 'package:vdl/ui/news/widgets/news_list_widget.dart';
import 'package:vdl/ui/news/widgets/podcasts_widget.dart';
import 'package:vdl/ui/news/widgets/special_reporst_widget.dart';
import 'package:vdl/ui/news/widgets/tab_bar_cell.dart';
import 'package:vdl/ui/news/widgets/twitter_card.dart';
import 'package:vdl/ui/notifications/page/notifications_page.dart';
import 'package:vdl/ui/shared_widget/error_screen.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/ui/shared_widget/try_again_widget.dart';
import 'package:vdl/utils/ads_manager/ad_state.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool isSpeacialReports = false;
  final _bloc = locator<NewsBloc>();
  int currentCatId = 0;
  int selectedIndex = 0;
  int page = 1;
  int specialReportsPage = 1;
  int pageIndex = 0;

  final _scrollController = ScrollController();
  bool isLoadingNextPage = false;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

//  BannerAd banner;

  final _adController = NativeAdmobController();

  @override
  void initState() {
    super.initState();
    _bloc.add(FetchData());
  }

  @override
  void dispose() {
//    banner?.dispose();
    super.dispose();
  }

  void _getNextPage() {
    isSpeacialReports ? specialReportsPage++ : page++;
    isSpeacialReports
        ? _bloc.add(FetchSpecialReportsPages(specialReportsPage))
        : _bloc.add(FetchCategoryNews(currentCatId, page));
  }

  List<NewsCategoryModel> categories = [
    NewsCategoryModel(name: "كل الاخبار", id: 0)
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
//    final adState = locator<AdState>();
//
//    adState.initialization.then((value) {
//      setState(() {
//        banner = BannerAd(
//            adUnitId: adState.bannerAdUnitId,
//            size: AdSize.mediumRectangle,
//            request: AdRequest(),
//            listener: adState.adListener)
//          ..load();
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        body: BlocConsumer(
            bloc: _bloc,
            builder: (context, state) {
              if (state is Loaded ||
                  state is FetchingCategoryNews ||
                  state is FetchingNextPage ||
                  state is MoveToTop) {
                return newsScreenLoaded(context, state.homeModel, state);
              } else if (state is Loading) {
                return LoadingScreen();
              } else if (state is Startup) {
                return newsScreenLoaded(context, state.homeModel, state);
              } else
                return ErrorScreen(
                  onRetry: () => _bloc.add(FetchData()),
                );
            },
            listener: (context, state) {
              if (state is Startup) {
                categories = categories + state.homeModel.categories;
                selectType(categories[0].id, 0, 0);
              }
              if (state is Loaded) {
                setState(() {
                  isLoadingNextPage = false;
                });
              } else if (state is MoveingToTop) {
                _scrollController.animateTo(0.0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300));
              }
            }));
  }

  //
  ///
  ///
  ///

  Widget newsScreenLoaded(
      BuildContext context, HomeModel model, NewsState state) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (!isLoadingNextPage &&
            notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
          setState(() {
            isLoadingNextPage = true;
            _getNextPage();
          });
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () {
          _bloc.add(FetchData());
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            Theme(
              data: ThemeData(primarySwatch: blue),
              child: SliverAppBar(
                expandedHeight: isSpeacialReports ? 154 : 180.0,
                pinned: false,
                snap: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 17.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40.0, left: 19),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 62,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/launcher/appIcon.png'))),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                pushNewScreen(
                                                  context,
                                                  screen: NotificationPage(),
                                                  withNavBar: true,
                                                  pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                );
                                              },
                                              child: CircleAvatar(
                                                radius: 20,
                                                child: Icon(
                                                  CupertinoIcons.bell,
                                                  color: Colors.black,
                                                ),
                                                backgroundColor: backgroundGrey,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () => pushNewScreen(
                                                context,
                                                screen: SearchPage(),
                                                withNavBar: true,
                                                pageTransitionAnimation:
                                                    PageTransitionAnimation
                                                        .cupertino,
                                              ),
                                              child: CircleAvatar(
                                                radius: 20,
                                                child: Icon(
                                                  CupertinoIcons.search,
                                                  color: Colors.black,
                                                ),
                                                backgroundColor: backgroundGrey,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: isSpeacialReports ? 25 : 0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                pageIndex = 0;
                                              });
                                            },
                                            child: Text(
                                              'الاخبار',
                                              style: TextStyle(
                                                  fontFamily: "TheSans",
                                                  color: pageIndex != 0
                                                      ? black.withOpacity(0.25)
                                                      : black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 32),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() => {pageIndex = 1});
                                            },
                                            child: Text(
                                              'تقارير خاصة',
                                              style: TextStyle(
                                                  fontFamily: "TheSans",
                                                  color: pageIndex == 1
                                                      ? black
                                                      : black.withOpacity(0.25),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 32),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() => {pageIndex = 2});
                                            },
                                            child: Text(
                                              'مقالات',
                                              style: TextStyle(
                                                  fontFamily: "TheSans",
                                                  color: pageIndex == 2
                                                      ? black
                                                      : black.withOpacity(0.25),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 32),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  pageIndex != 0
                                      ? Container(
                                          height: 50,
                                        )
                                      : Container(
                                          height: 50,
                                          child:
                                              ScrollablePositionedList.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: model.categories.length,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                                    onTap: () => selectType(
                                                        categories[index].id,
                                                        index,
                                                        currentCatId),
                                                    child: tabBarCell(
                                                      cat: categories[index],
                                                    )),
                                            itemScrollController:
                                                itemScrollController,
                                            itemPositionsListener:
                                                itemPositionsListener,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            pageIndex == 1
                ? SpecialReportsWidget(model, state)
                : pageIndex == 0
                    ? AllNewsWidget(model, state)
                    : ArticlesWidget(model, state)
          ],
        ),
      ),
    );
  }

  Widget ArticlesWidget(HomeModel model, NewsState state) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: LimitedBox(
            maxHeight: (model.articles.length * 145.5 + 50).toDouble(),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ArticleCardWidget(
                      model: model.articles[index],
                    ),
                itemCount: model.articles.length),
          )),
          state is FetchingNextPage
              ? Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Platform.isIOS
                      ? CupertinoActivityIndicator()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  child: CircularProgressIndicator()),
                            ),
                          ],
                        ),
                )
              : Container(),
          SizedBox(
            height: 50,
          )
        ],
      ),
    ]));
  }

/////
  ///
  ///
  Widget AllNewsWidget(HomeModel model, NewsState state) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SizedBox(
            height: 30,
          ),
          model.timeline == null
              ? Container()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 19.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/twitter.svg',
                            height: 21,
                            width: 17,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'أحدث التغريدات',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 19.0),
                      child: Column(
                        children: [
                          Container(
                              height: 130,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => twitterCard(
                                        tweet: model.timeline.data[index],
                                      ),
                                  itemCount: model.timeline.data.length)),
                        ],
                      ),
                    ),
                  ],
                ),
          state is FetchingCategoryNews
              ? Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Center(
                      child: Platform.isIOS
                          ? CupertinoActivityIndicator()
                          : CircularProgressIndicator(
                              color: blue,
                            )),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Container(
                      child: Column(
                    children: [
                      // GestureDetector(
                      //   onPanUpdate: (details) {
                      //     // Swiping in right direction.
                      //     if (details.delta.dx > 0) {
                      //       setState(() {
                      //         isSpeacialReports = true;
                      //       });
                      //     }
                      //   },
                      //   child: Container(
                      //     height: 330,
                      //     padding: EdgeInsets.all(10),
                      //     margin: EdgeInsets.only(bottom: 20.0),
                      //     child: NativeAdmob(
                      //       // Your ad unit id
                      //       adUnitID:
                      //           'ca-app-pub-3940256099942544/8135179316',
                      //       numberAds: 3,
                      //       controller: _adController,
                      //       type: NativeAdmobType.full,
                      //     ),
                      //   ),
                      // ),
//                                    banner == null
//                                        ? Container(height: 20)
//                                        : Container(
//                                            height: 320,
//                                            child: Padding(
//                                              padding:
//                                                  const EdgeInsets.all(20.0),
//                                              child: AdWidget(
//                                                ad: banner,
//                                              ),
//                                            ),
//                                          ),

                      LimitedBox(
                        maxHeight: 400 * model.news.length.toDouble() + 50,
                        child: Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => index != 1
                                  ? NewsCardWidget(
                                      newsModel: model.news[index],
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                          height: 330,
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.only(bottom: 20.0),
                                          child: NativeAdmob(
                                            // Your ad unit id
                                            adUnitID:
                                                'ca-app-pub-3940256099942544/8135179316',
                                            numberAds: 3,
                                            controller: _adController,
                                            type: NativeAdmobType.full,
                                          ),
                                        ),
                                        NewsCardWidget(
                                          newsModel: model.news[index],
                                        ),
                                      ],
                                    ),
                              itemCount: model.news.length),
                        ),
                      ),
                      state is FetchingNextPage
                          ? Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Platform.isIOS
                                  ? CupertinoActivityIndicator()
                                  : Center(
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: CircularProgressIndicator()),
                                    ),
                            )
                          : Container()
                    ],
                  )),
                ),
          PodcastsWidet(),
        ],
      ),
    );
  }

  ////
  ///
  ///
  ///
  Widget SpecialReportsWidget(HomeModel model, NewsState state) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Container(
          height: 142 * model.specialReports.length.toDouble() + 50,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SpecialReportsCard(
                    newsModel: model.specialReports[index],
                  ),
              itemCount: model.specialReports.length)),
      state is FetchingNextPage
          ? Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : Center(
                      child: Container(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator()),
                    ),
            )
          : Container(),
      SizedBox(
        height: 40,
      )
    ]));
  }

  void selectType(catId, index, currentSelected) {
    setState(() {
      for (var i = 0; i < categories.length; i++) {
        categories[i].selected = false;
      }
      categories[index].selected = true;
      currentCatId = catId;
      selectedIndex = index;
      page = 1;
      isLoadingNextPage = false;
    });

    ////
    ///
    ///
    if (currentSelected != catId) {
      _bloc.add(FetchCategoryNews(catId, page));
    }
  }
}
