import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vdl/data/models/news_category.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/NewsDetails/page/news_detials_page_s.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel newsModel;

  const NewsCardWidget({
    Key key,
    @required this.newsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNewScreen(
        context,
        screen: NewsPageDetails(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 19.0, left: 19, bottom: 24),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 330,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ], borderRadius: BorderRadius.circular(14), color: Colors.white),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 230,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        topRight: const Radius.circular(14.0),
                        topLeft: const Radius.circular(14.0),
                      ),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              this.newsModel.image.large),
                          fit: BoxFit.cover),
                      //  DecorationImage(
                      //     image: AssetImage("assets/images/Lebanon.jpg"),
                      //     fit: BoxFit.fill)
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 19.0, left: 14, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            this.newsModel.humanDate,
                            style: TextStyle(
                                fontSize: 11, color: black.withOpacity(0.41)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            this.newsModel.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 2,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 215,
                left: 16,
                child: Container(
                  height: 25.23,
                  width: 50,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: AutoSizeText(
                        this
                            .newsModel
                            .categories[this.newsModel.categories.keys.first]
                            .name,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        presetFontSizes: [11, 8],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: brown, borderRadius: BorderRadius.circular(13)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
