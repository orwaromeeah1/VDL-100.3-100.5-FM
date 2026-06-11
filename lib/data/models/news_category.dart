// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

List<NewsCategoryModel> newsCategoriesFromJson(String str) =>
    List<NewsCategoryModel>.from(
        json.decode(str).map((x) => NewsCategoryModel.fromJson(x)));

String newsToJson(List<NewsCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsCategoryModel {
  NewsCategoryModel({
    this.id,
    this.selected,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.parent,
    this.meta,
    this.mobileAppTitle,
    this.news,
  });

  int? id;
  int? count;
  bool? selected;
  String? description;
  String? link;
  String? name;
  String? slug;
  String? taxonomy;
  int? parent;
  List<dynamic>? meta;
  dynamic mobileAppTitle;
  String? news;

  factory NewsCategoryModel.fromJson(Map<String, dynamic> json) =>
      NewsCategoryModel(
        id: json["id"],
        count: json["count"],
        description: json["description"],
        link: json["link"],
        name: json["name"],
        slug: json["slug"],
        taxonomy: json["taxonomy"],
        parent: json["parent"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        mobileAppTitle: json["mobile_app_title"],
        news: json["news"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "description": description,
        "link": link,
        "name": name,
        "slug": slug,
        "taxonomy": taxonomy,
        "parent": parent,
        "meta": meta != null ? List<dynamic>.from(meta!.map((x) => x)) : null,
        "mobile_app_title": mobileAppTitle,
        "news": news,
      };
}
