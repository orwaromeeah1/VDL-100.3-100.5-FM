import 'package:flutter/material.dart';
import 'package:vdl/data/models/news_category.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class tabBarCell extends StatelessWidget {
  NewsCategoryModel cat;
  tabBarCell({
    Key key,
    this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 18,
            child: Text(cat.name,
                style: TextStyle(
                    color: cat.selected ? green : black,
                    fontWeight:
                        cat.selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14)),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            color: cat.selected ? green : Colors.white,
            height: 3,
            width: 55,
          )
        ],
      ),
    );
  }
}

class NewsType {
  bool selected;
  String name;

  NewsType({this.selected, this.name});
}
