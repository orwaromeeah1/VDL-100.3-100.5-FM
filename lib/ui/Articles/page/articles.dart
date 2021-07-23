import 'dart:io';

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
  bool isLoadingNewPage = false;
  int page = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(FetchArticlesPage(1));
  }

  void _getNextPage() {
    page++;
    bloc.add(FetchArticlesPage(page));
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

                      if (state is Loaded || state is LoadingNextPage) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 101.0),
                          child: Container(
                            child: NotificationListener<ScrollNotification>(
                              onNotification: (notification) {
                                if (!isLoadingNewPage &&
                                    notification.metrics.pixels ==
                                        notification.metrics.maxScrollExtent) {
                                  setState(() {
                                    isLoadingNewPage = true;
                                    _getNextPage();
                                  });
                                }
                                return true;
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height:
                                            (state.articles.length * 145.5 + 50)
                                                .toDouble(),
                                        child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                ArticleCardWidget(
                                                  model: state.articles[index],
                                                ),
                                            itemCount: state.articles.length)),
                                    state is LoadingNextPage
                                        ? Container(
                                            color: Colors.transparent,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50,
                                            child: Platform.isIOS
                                                ? CupertinoActivityIndicator()
                                                : CircularProgressIndicator(),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 50,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                        ;
                      }
                      return Container();
                    },
                    listener: (context, state) {
                      if (state is Loaded) {
                        setState(() {
                          isLoadingNewPage = false;
                        });
                      }
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
