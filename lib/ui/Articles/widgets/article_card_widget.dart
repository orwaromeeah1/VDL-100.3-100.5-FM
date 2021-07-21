import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vdl/core/Manager.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/ui/ArticleDetails/page/article_details.dart';
import 'package:vdl/ui/shared_widget/cached_image.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class ArticleCardWidget extends StatelessWidget {
  final NewsModel model;
  const ArticleCardWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: ArticleDetailsPage(
            id: this.model.id,
          ),
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
                            this.model.humanDate,
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
                        Manager.removeAllHtmlTags(this.model.title),
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
                          Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        this.model.selectAuthor.image.medium),
                                    fit: BoxFit.fitHeight)),
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
                            this.model.selectAuthor.name,
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
