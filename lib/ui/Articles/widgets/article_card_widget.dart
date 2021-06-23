import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vdl/ui/ArticleDetails/page/article_details.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class ArticleCardWidget extends StatelessWidget {
  const ArticleCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: ArticleDetailsPage(),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 19.0, right: 19, bottom: 20.5),
        child: Container(
          height: 125,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ]),
          child: Row(
            children: [
              Container(
                width: 6,
                color: green,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 13.0, top: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14,
                      child: Row(
                        children: [
                          Icon(
                            Icons.watch_later,
                            color: green,
                            size: 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'الخميس 20 تشرين الثاني',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 32,
                      child: Text(
                        'الجغرافيا تقتل لقمان سليم وتخوّن أسامة سعد',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 44,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            child: Image.asset('assets/images/article.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            MaterialIcons.format_quote,
                            color: blue,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'جورج يزبك',
                            style: TextStyle(
                              color: blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
