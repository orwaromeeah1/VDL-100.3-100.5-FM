import 'package:vdl/data/models/menus_model.dart';
import 'package:vdl/data/models/news_category.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/models/tweets_model.dart';
import 'package:vdl/data/responses/news_cast_response.dart';

class HomeModel {
  List<NewsModel>? news;
  List<NewsModel>? specialReports;
  List<NewsModel>? articles;
  Menus? menus;
  List<NewsCategoryModel>? categories;
  Timeline? timeline;
  List<NewsCastResponse>? newsCasts;
  HomeModel(
      {this.news,
      this.menus,
      this.categories,
      this.specialReports,
      this.timeline,
      this.articles,
      this.newsCasts
      });
}
