import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:vdl/data/models/homeModel.dart';
import 'package:vdl/data/models/news_category.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/injection.dart';
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
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/ui/shared_widget/try_again_widget.dart';
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
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    _bloc.add(FetchData());
  }

  List<NewsCategoryModel> categories = [
    NewsCategoryModel(name: "كل الاخبار", id: 0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundGrey,
        body: BlocConsumer(
            bloc: _bloc,
            builder: (context, state) {
              if (state is Loaded || state is FetchingCategoryNews) {
                return newsScreenLoaded(context, state.homeModel, state);
              } else if (state is Loading) {
                return LoadingScreen();
              } else if (state is Startup) {
                return newsScreenLoaded(context, state.homeModel, state);
              } else
                return tryAgain(context, () {
                  _bloc.add(FetchData());
                });
            },
            listener: (context, state) {
              if (state is Startup) {
                categories = categories + state.homeModel.categories;
                selectType(categories[0].id, 0, 0);
              }
            }));
  }

  //
  ///
  ///
  ///

  Widget newsScreenLoaded(
      BuildContext context, HomeModel model, NewsState state) {
    return CustomScrollView(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40.0, left: 19),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/VDL_LOGO-image.jpg.svg',
                                      height: 52,
                                      width: 67,
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
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isSpeacialReports = false;
                                      });
                                    },
                                    child: Text(
                                      'الاخبار',
                                      style: TextStyle(
                                          color: isSpeacialReports
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
                                      setState(
                                          () => {isSpeacialReports = true});
                                    },
                                    child: Text(
                                      'تقارير خاصة',
                                      style: TextStyle(
                                          color: isSpeacialReports
                                              ? black
                                              : black.withOpacity(0.25),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32),
                                    ),
                                  )
                                ],
                              ),
                              isSpeacialReports
                                  ? Container()
                                  : Container(
                                      height: 50,
                                      child: ScrollablePositionedList.builder(
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
                                      //  ListView.builder(
                                      //     scrollDirection: Axis.horizontal,
                                      //     itemBuilder: (context, index) =>
                                      //         InkWell(
                                      //             onTap: () => selectType(
                                      //                 categories[index].id,
                                      //                 index,
                                      //                 currentCatId),
                                      //             child: tabBarCell(
                                      //               cat: categories[index],
                                      //             )),
                                      //     itemCount: model.categories.length)
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
        isSpeacialReports
            ? SliverList(
                delegate: SliverChildListDelegate([
                Container(
                    height: 150 * model.specialReports.length.toDouble(),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => SpecialReportsCard(
                              newsModel: model.specialReports[index],
                            ),
                        itemCount: model.specialReports.length)),
                SizedBox(
                  height: 40,
                )
              ]))
            : SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 30,
                    ),
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
                                  itemBuilder: (context, index) =>
                                      twitterCard(),
                                  itemCount: model.specialReports.length)),
                        ],
                      ),
                    ),
                    state is FetchingCategoryNews
                        ? Center(
                            child: Platform.isIOS
                                ? CupertinoActivityIndicator()
                                : CircularProgressIndicator(
                                    color: blue,
                                  ))
                        : newsListWidget(context, model.news),
                    PodcastsWidet(),
                  ],
                ),
              )
      ],
    );
  }

  ////
  ///
  ///
  ///

  void selectType(catId, index, currentSelected) {
    setState(() {
      for (var i = 0; i < categories.length; i++) {
        categories[i].selected = false;
      }
      categories[index].selected = true;
      currentCatId = catId;
      selectedIndex = index;
    });

    ////
    ///
    ///
    if (currentSelected != catId) {
      _bloc.add(FetchCategoryNews(catId, 1));
      itemScrollController.jumpTo(index: index);
    }
  }
}
