import 'package:vdl/data/models/menus_model.dart';
import 'package:vdl/data/models/news_category.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/models/tweets_model.dart';

class HomeModel {
  List<NewsModel> news;
  List<NewsModel> specialReports;
  Menus menus;
  List<NewsCategoryModel> categories;
  Timeline timeline;
  HomeModel(
      {this.news,
      this.menus,
      this.categories,
      this.specialReports,
      this.timeline});
}
