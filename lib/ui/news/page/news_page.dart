import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/ui/news/widgets/news_card_widget.dart';
import 'package:vdl/ui/news/widgets/special_reporst_widget.dart';
import 'package:vdl/ui/news/widgets/tab_bar_cell.dart';
import 'package:vdl/ui/news/widgets/twitter_card.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

List<NewsType> newsTypes = [
  NewsType(
    selected: false,
    name: 'الاخبار',
  ),
  NewsType(
    selected: false,
    name: 'محلية',
  ),
  NewsType(
    selected: false,
    name: 'اقتصادية',
  ),
  NewsType(
    selected: false,
    name: 'امن وقضاء',
  ),
  NewsType(
    selected: false,
    name: 'امن وقضاء',
  )
];

class _NewsPageState extends State<NewsPage> {
  bool isSpeacialReports = false;

  @override
  void initState() {
    super.initState();
    selectType(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
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
                                    const EdgeInsets.only(top: 24.0, left: 19),
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
                                        CircleAvatar(
                                          radius: 20,
                                          child: Icon(
                                            CupertinoIcons.bell,
                                            color: Colors.black,
                                          ),
                                          backgroundColor: backgroundGrey,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CircleAvatar(
                                          radius: 20,
                                          child: Icon(
                                            CupertinoIcons.search,
                                            color: Colors.black,
                                          ),
                                          backgroundColor: backgroundGrey,
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
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                                  onTap: () =>
                                                      selectType(index),
                                                  child: tabBarCell(
                                                      newsType:
                                                          newsTypes[index])),
                                          itemCount: newsTypes.length))
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
          isSpeacialReports
              ? SliverList(
                  delegate: SliverChildListDelegate([
                  Container(
                      height: 150 * newsTypes.length.toDouble(),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => SpecialReportsCard(),
                          itemCount: newsTypes.length)),
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
                                    itemCount: newsTypes.length)),
                          ],
                        ),
                      ),
                      Container(
                          height: 360 * newsTypes.length.toDouble(),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => NewsCardWidget(),
                              itemCount: newsTypes.length)),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }

  void selectType(index) {
    setState(() {
      for (var i = 0; i < newsTypes.length; i++) {
        newsTypes[i].selected = false;
      }
      newsTypes[index].selected = true;
    });
  }
}
