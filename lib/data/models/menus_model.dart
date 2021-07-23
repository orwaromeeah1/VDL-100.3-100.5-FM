// To parse this JSON data, do
//
//     final menus = menusFromJson(jsonString);

import 'dart:convert';

Menus menusFromJson(String str) => Menus.fromJson(json.decode(str));

String menusToJson(Menus data) => json.encode(data.toJson());

class Menus {
  Menus({
    this.topBarMenu,
    this.sideBarMenu,
  });

  List<BarMenu> topBarMenu;
  List<BarMenu> sideBarMenu;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        topBarMenu: List<BarMenu>.from(
            json["top_bar_menu"].map((x) => BarMenu.fromJson(x))),
        sideBarMenu: List<BarMenu>.from(
            json["side_bar_menu"].map((x) => BarMenu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "top_bar_menu": List<dynamic>.from(topBarMenu.map((x) => x.toJson())),
        "side_bar_menu": List<dynamic>.from(sideBarMenu.map((x) => x.toJson())),
      };
}

class BarMenu {
  BarMenu({
    this.name,
    this.count,
    this.posts,
    this.id,
  });

  String name;
  int count;
  String posts;
  int id;

  factory BarMenu.fromJson(Map<String, dynamic> json) => BarMenu(
        name: json["name"],
        count: json["count"],
        posts: json["posts"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "count": count,
        "posts": posts,
        "id": id,
      };
}
