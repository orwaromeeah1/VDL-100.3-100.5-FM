// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<LiveNotificationModel> notificationModelFromJson(String str) =>
    List<LiveNotificationModel>.from(
        json.decode(str).map((x) => LiveNotificationModel.fromJson(x)));

String notificationModelToJson(List<LiveNotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LiveNotificationModel {
  LiveNotificationModel({
    this.id,
    this.date,
    this.dateGmt,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.link,
    this.title,
    this.content,
    this.menuOrder,
    this.excerpt,
    this.image,
    this.humanDate,
    this.sinceDate,
  });

  int id;
  int date;
  int dateGmt;
  int modified;
  int modifiedGmt;
  String slug;

  String link;
  String title;
  String content;
  int menuOrder;
  dynamic excerpt;
  Image image;
  String humanDate;
  String sinceDate;

  factory LiveNotificationModel.fromJson(Map<String, dynamic> json) =>
      LiveNotificationModel(
        id: json["id"] == null ? null : json["id"],
        date: json["date"] == null ? null : json["date"],
        dateGmt: json["date_gmt"] == null ? null : json["date_gmt"],
        modified: json["modified"] == null ? null : json["modified"],
        modifiedGmt: json["modified_gmt"] == null ? null : json["modified_gmt"],
        slug: json["slug"] == null ? null : json["slug"],
        link: json["link"] == null ? null : json["link"],
        title: json["title"] == null ? null : json["title"],
        content: json["content"] == null ? null : json["content"],
        menuOrder: json["menu_order"] == null ? null : json["menu_order"],
        excerpt: json["excerpt"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        humanDate: json["human_date"] == null ? null : json["human_date"],
        sinceDate: json["since_date"] == null ? null : json["since_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "date": date == null ? null : date,
        "date_gmt": dateGmt == null ? null : dateGmt,
        "modified": modified == null ? null : modified,
        "modified_gmt": modifiedGmt == null ? null : modifiedGmt,
        "slug": slug == null ? null : slug,
        "link": link == null ? null : link,
        "title": title == null ? null : title,
        "content": content == null ? null : content,
        "menu_order": menuOrder == null ? null : menuOrder,
        "excerpt": excerpt,
        "image": image == null ? null : image.toJson(),
        "human_date": humanDate == null ? null : humanDate,
        "since_date": sinceDate == null ? null : sinceDate,
      };
}

class Image {
  Image();

  factory Image.fromJson(Map<String, dynamic> json) => Image();

  Map<String, dynamic> toJson() => {};
}
