import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class SpecialReportsCard extends StatelessWidget {
  final NewsModel newsModel;
  const SpecialReportsCard({
    Key key,
    this.newsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 19, left: 19, bottom: 19),
      child: Container(
        height: 123,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 12, bottom: 12),
              child: Container(
                width: 113,
                height: 96,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            this.newsModel.image.medium),
                        fit: BoxFit.cover)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 13.0, top: 12, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        this.newsModel.humanDate,
                        style: TextStyle(
                            fontSize: 12, color: black.withOpacity(0.41)),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      child: Text(
                        this.newsModel.title,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
