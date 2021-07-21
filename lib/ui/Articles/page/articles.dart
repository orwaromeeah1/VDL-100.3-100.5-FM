import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/Articles/bloc/articles_bloc.dart';
import 'package:vdl/ui/Articles/bloc/articles_event.dart';
import 'package:vdl/ui/Articles/bloc/articles_state.dart';
import 'package:vdl/ui/Articles/widgets/article_card_widget.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key key}) : super(key: key);

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  final bloc = locator<ArticlesBLoc>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(FetchArticlesPage(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 128,
            color: darkBlue,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  left: 19,
                  top: 40,
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
                BlocConsumer(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is Loading) {
                        return LoadingScreen();
                      }
                      if (state is LoadingNextPage) {}
                      if (state is Loaded) {
                        return articlesWidgetUi(context, state.articles);
                      }
                      return Container();
                    },
                    listener: (context, state) {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget articlesWidgetUi(BuildContext context, List<NewsModel> articles) {
  return Padding(
    padding: const EdgeInsets.only(top: 101.0),
    child: Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: (articles.length * 150).toDouble(),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ArticleCardWidget(
                          model: articles[index],
                        ),
                    itemCount: articles.length)),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    ),
  );
}
