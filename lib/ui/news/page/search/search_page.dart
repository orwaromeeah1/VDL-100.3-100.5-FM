import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vdl/data/responses/search_response.dart';
import 'package:vdl/ui/news/bloc/search/search_bloc.dart';
import 'package:vdl/ui/news/bloc/search/search_event.dart';
import 'package:vdl/ui/news/bloc/search/search_state.dart';
import 'package:vdl/ui/news/widgets/news_card_widget.dart';
import 'package:vdl/ui/news/widgets/search_card.dart';
import 'package:vdl/ui/shared_widget/error_screen.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

import '../../../../injection.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  double width;
  String searchQuery = 'ابحث';
  List<SearchResponse> searchResult =[];
  final _bloc = locator<SearchBloc>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, SearchState state) {
          print('current state is : ${state.runtimeType}');
          if (state is SearchEmpty) {
            return screenUi();
          }
          if (state is SearchError) {
            return ErrorScreen(
              onRetry: () =>
                  _bloc.add(FetchSearchResult(searchQuery: searchQuery)),
            );
          }
          if (state is SearchLoaded) {
            searchResult = state.searchResult;
            return screenUi();
          }
          if (state is SearchLoading) {
            return LoadingScreen();
          }

          return screenUi();
        });
  }

  Widget screenUi(){
    return Scaffold(
      body: Stack(

        children: [
          Positioned(
            child: Container(
                height: 100,
                width: width,
                color: Colors.white,
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [

                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          radius: 16,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(
                              CupertinoIcons.back,
                              color: Colors.black,
                            ),
                          ),
                          backgroundColor: black.withOpacity(0.07),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              color: ProjectColors.ThemeColor,
                            ),
                            onPressed: () {
                              searchQuery = _searchController.text.trim();
                              _bloc.add(FetchSearchResult(searchQuery: searchQuery));
                            }),
                        Container(
                          width:width*0.75 ,
                          child: TextFormField(
                            controller: _searchController,
                            onFieldSubmitted: (value) {
                              searchQuery = _searchController.text.trim();
                              _bloc.add(FetchSearchResult(searchQuery: searchQuery));
                            },
                            decoration: InputDecoration(
                              hintText: '$searchQuery',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            _searchController.clear();
                            searchQuery = 'ابحث';
                            setState(() {
                              searchResult.clear();
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(
                              Icons.close,
                            ),
                          ),
                        ),


                      ],
                    ),
                  ],
                )
            ),
          ),
          searchResult.isEmpty
          ? Container()
          : Container(
            padding: EdgeInsets.only(top: 150,bottom: 40),
              height: 360 * searchResult.length.toDouble(),
              child: ListView.builder(
                  itemBuilder: (context,int index) => SearchCardWidget(
                    title: searchResult[index].title,
                    image: searchResult[index].image.original,
                    date: searchResult[index].humanDate,
                    category: searchResult[index].categories.category.name,
                    id: searchResult[index].id
                  ),
                  itemCount: searchResult.length
              )
          ),
        ],
      ),
    );
  }
}
