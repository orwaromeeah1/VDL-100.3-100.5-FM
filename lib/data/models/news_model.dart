// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

List<NewsModel> allNewsFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel(
      {this.id,
      this.date,
      this.dateGmt,
      this.modified,
      this.modifiedGmt,
      this.slug,
      this.status,
      this.link,
      this.title,
      this.content,
      this.excerpt,
      this.author,
      this.menuOrder,
      this.format,
      this.tags,
      this.sliderDescriptionText,
      this.audiowatFile,
      this.audiowatEmbedIframe,
      this.image,
      this.categories,
      this.humanDate,
      this.sinceDate,
      this.source,
      this.time,
      this.audioTitle,
      this.audio,
      this.video,
      this.vimeo,
      this.youtube,
      this.relatedArticles,
      this.selectAuthor});

  int id;
  int date;
  int dateGmt;
  int modified;
  int modifiedGmt;
  String slug;
  String status;
  String link;
  String title;
  String content;
  String excerpt;
  int author;
  int menuOrder;
  String format;
  Map<String, Category> tags;
  String sliderDescriptionText;
  String audiowatFile;
  String audiowatEmbedIframe;
  Image image;
  Map<String, Category> categories;
  SelectAuthor selectAuthor;
  String humanDate;
  String sinceDate;
  String source;
  String time;
  String audioTitle;
  String audio;
  String video;
  dynamic vimeo;
  String youtube;
  List<RelatedArticle> relatedArticles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        date: json["date"],
        dateGmt: json["date_gmt"],
        modified: json["modified"],
        modifiedGmt: json["modified_gmt"],
        slug: json["slug"],
        status: json["status"],
        link: json["link"],
        title: json["title"],
        content: json["content"],
        excerpt: json["excerpt"],
        author: json["author"],
        menuOrder: json["menu_order"],
        format: json["format"],
        selectAuthor: json["select_author"] == null
            ? null
            : SelectAuthor.fromJson(json["select_author"]),
        tags: json["tags"] == null
            ? null
            : Map.from(json["tags"]).map(
                (k, v) => MapEntry<String, Category>(k, Category.fromJson(v))),
        sliderDescriptionText: json["slider_description_text"] == null
            ? ""
            : json["slider_description_text"],
        audiowatFile:
            json["audiowat_file"] == null ? "" : json["audiowat_file"],
        audiowatEmbedIframe: json["audiowat_embed_iframe"] == null
            ? ""
            : json["audiowat_embed_iframe"],
        image: Image.fromJson(json["image"]),
        categories: json["categories"] == null
            ? null
            : Map.from(json["categories"]).map(
                (k, v) => MapEntry<String, Category>(k, Category.fromJson(v))),
        humanDate: json["human_date"],
        sinceDate: json["since_date"],
        source: json["source"] == null ? "" : json["source"],
        time: json["time"],
        audioTitle: json["audio_title"] == null ? "" : json["audio_title"],
        audio: json["audio"],
        video: json["video"],
        vimeo: json["vimeo"] == null ? "" : json["vimeo"],
        youtube: json["youtube"] == null ? null : json["youtube"],
        relatedArticles: json["related_articles"] == null
            ? []
            : List<RelatedArticle>.from(json["related_articles"]
                .map((x) => RelatedArticle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "date_gmt": dateGmt,
        "modified": modified,
        "modified_gmt": modifiedGmt,
        "slug": slug,
        "status": status,
        "link": link,
        "title": title,
        "content": content,
        "excerpt": excerpt,
        "author": author,
        "menu_order": menuOrder,
        "format": format,
        "tags": Map.from(tags)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "slider_description_text": sliderDescriptionText,
        "audiowat_file": audiowatFile,
        "audiowat_embed_iframe": audiowatEmbedIframe,
        "image": image.toJson(),
        "categories": Map.from(categories)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "human_date": humanDate,
        "since_date": sinceDate,
        "source": source,
        "time": time,
        "audio_title": audioTitle,
        "audio": audio,
        "video": video,
        "vimeo": vimeo,
        "youtube": youtube == null ? null : youtube,
      };
}

class Category {
  Category({
    this.name,
    this.news,
  });

  String name;
  String news;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        news: json["news"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "news": news,
      };
}

class Exclusive {
  Exclusive({
    this.the11,
  });

  Category the11;

  factory Exclusive.fromJson(Map<String, dynamic> json) => Exclusive(
        the11: json["11"] == null ? null : Category.fromJson(json["11"]),
      );

  Map<String, dynamic> toJson() => {
        "11": the11 == null ? null : the11.toJson(),
      };
}

class Image {
  Image({
    this.original,
    this.large,
    this.medium,
    this.thumbnail,
  });

  String original;
  String large;
  String medium;
  String thumbnail;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        original: json["original"],
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}

class RelatedArticle {
  RelatedArticle({
    this.id,
    this.link,
    this.author,
    this.date,
    this.dateGmt,
    this.content,
    this.title,
    this.excerpt,
    this.status,
    this.name,
    this.modified,
    this.modifiedGmt,
    this.humanDate,
    this.sinceDate,
    this.image,
  });

  int id;
  String link;
  int author;
  int date;
  int dateGmt;
  String content;
  String title;
  String excerpt;
  String status;
  String name;
  int modified;
  int modifiedGmt;
  String humanDate;
  String sinceDate;
  Image image;

  factory RelatedArticle.fromJson(Map<String, dynamic> json) => RelatedArticle(
        id: json["id"],
        link: json["link"],
        author: json["author"],
        date: json["date"],
        dateGmt: json["date_gmt"],
        content: json["content"],
        title: json["title"],
        excerpt: json["excerpt"],
        status: json["status"],
        name: json["name"],
        modified: json["modified"],
        modifiedGmt: json["modified_gmt"],
        humanDate: json["human_date"],
        sinceDate: json["since_date"],
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "author": author,
        "date": date,
        "date_gmt": dateGmt,
        "content": content,
        "title": title,
        "excerpt": excerpt,
        "status": status,
        "name": name,
        "modified": modified,
        "modified_gmt": modifiedGmt,
        "human_date": humanDate,
        "since_date": sinceDate,
        "image": image.toJson(),
      };
}

NewsModel newsModelFromRelatedArticle(RelatedArticle r) {
  return NewsModel(
      id: r.id, humanDate: r.humanDate, image: r.image, title: r.title);
}

class SelectAuthor {
  SelectAuthor({
    this.id,
    this.name,
    this.image,
  });

  int id;
  String name;
  Image image;

  factory SelectAuthor.fromJson(Map<String, dynamic> json) => SelectAuthor(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image.toJson(),
      };
}
