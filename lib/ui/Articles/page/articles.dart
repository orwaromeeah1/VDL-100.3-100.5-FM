import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:vdl/ui/Articles/widgets/article_card_widget.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key key}) : super(key: key);

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 128,
            color: darkBlue,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    right: 19,
                  ),
                  child: Text(
                    'مقالات',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    height: (5 * 150).toDouble(),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ArticleCardWidget(),
                        itemCount: 5)),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
          Positioned(
            left: 19,
            top: 19,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
