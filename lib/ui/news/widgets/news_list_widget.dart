import 'package:flutter/material.dart';
import 'package:vdl/data/models/news_model.dart';

import 'news_card_widget.dart';

Widget newsListWidget(BuildContext context, List<NewsModel> news) {
  return Container(
      height: 360 * news.length.toDouble(),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => NewsCardWidget(
                newsModel: news[index],
              ),
          itemCount: news.length));
}
