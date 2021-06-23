import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/ui/news/widgets/news_card_widget.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class NewsPageDetails extends StatefulWidget {
  const NewsPageDetails({Key key}) : super(key: key);

  @override
  _NewsPageDetailsState createState() => _NewsPageDetailsState();
}

class _NewsPageDetailsState extends State<NewsPageDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: Container(
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: MyDynamicHeader(expandedHeight: height / 2.5),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
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
                        children: [
                          Padding(
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
                                    offset: Offset(0, 10),
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
                                        child: Icon(
                                          Icons.play_arrow,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0, left: 15, bottom: 12),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Text(
                                              'الجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنانالجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنانالجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنانالجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنانالجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنانالجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنانالجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنانالجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنانالجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنانالجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنان',
                                              maxLines: 2,
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
                                                '20:22',
                                                style: TextStyle(
                                                    color:
                                                        black.withOpacity(0.41),
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
                                '21 كانون الثاني 2020',
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
                                'سامي الجميّل ينشر لقطات "صادمة"',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 19.0, top: 9, left: 19, bottom: 34),
                            child: Container(
                              child: Text(
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة'
                                'سامي الجميّل ينشر لقطات "صادمة',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    right: 19.0, top: 34, left: 19, bottom: 15),
                child: Container(
                  child: Center(
                    child: Text(
                      'اقرأ ايضا',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Container(
                height: 400,
                child: Swiper(
                  itemHeight: 330,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 24),
                      child: NewsCardWidget(),
                    );
                  },
                  itemCount: 3,
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.grey,
                          activeColor: Colors.green,
                          size: 10.0,
                          activeSize: 10.0)),
                ),
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
      ),
    );
  }
}

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  double expandedHeight;

  MyDynamicHeader({@required this.expandedHeight});

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
                    top: 19,
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
                image: AssetImage('assets/images/newsImage.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: shrinkOffset < minExtent
              ? expandedHeight - (height / 18) - shrinkOffset
              : expandedHeight - (height / 18) - minExtent,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.14),
                          blurRadius: 10,
                          offset: Offset(0, 10),
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
                SizedBox(
                  width: 9,
                ),
                CircleAvatar(
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
