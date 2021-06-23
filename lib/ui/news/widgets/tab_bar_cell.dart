import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class tabBarCell extends StatelessWidget {
  NewsType newsType;
  tabBarCell({
    Key key,
    this.newsType,
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
            child: Text(newsType.name,
                style: TextStyle(
                    color: newsType.selected ? green : black,
                    fontWeight:
                        newsType.selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14)),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            color: newsType.selected ? green : Colors.white,
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
