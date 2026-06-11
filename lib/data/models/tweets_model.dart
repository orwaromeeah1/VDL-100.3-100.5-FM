// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

Timeline tweetsFromJson(String str) => Timeline.fromJson(json.decode(str));

class Timeline {
  Timeline({
    this.data,
    this.meta,
  });

  List<Tweet>? data;
  Meta? meta;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        data: json["data"] == null
            ? null
            : List<Tweet>.from(json["data"].map((x) => Tweet.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data != null ? List<dynamic>.from(data!.map((x) => x.toJson())) : null,
        "meta": meta?.toJson(),
      };
}

class Tweet {
  Tweet({
    this.createdAt,
    this.id,
    this.text,
  });

  DateTime? createdAt;
  String? id;
  String? text;

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "id": id,
        "text": text,
      };
}

class Meta {
  Meta({
    this.oldestId,
    this.newestId,
    this.resultCount,
    this.nextToken,
  });

  String? oldestId;
  String? newestId;
  int? resultCount;
  String? nextToken;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        oldestId: json["oldest_id"] == null ? null : json["oldest_id"],
        newestId: json["newest_id"] == null ? null : json["newest_id"],
        resultCount: json["result_count"] == null ? null : json["result_count"],
        nextToken: json["next_token"] == null ? null : json["next_token"],
      );

  Map<String, dynamic> toJson() => {
        "oldest_id": oldestId,
        "newest_id": newestId,
        "result_count": resultCount,
        "next_token": nextToken,
      };
}
