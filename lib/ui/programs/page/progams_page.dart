import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vdl/data/responses/programs_response.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_bloc.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_event.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_state.dart';
import 'package:vdl/ui/programs/widget/category_widget.dart';
import 'package:vdl/ui/programs/widget/program_card.dart';
import 'package:vdl/data/models/category_model.dart';
import 'package:vdl/ui/programs/page/program_details/program_details_page.dart';
import 'package:vdl/ui/shared_widget/app_progress_indicator.dart';
import 'package:vdl/ui/shared_widget/error_screen.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

import '../../../injection.dart';

class ProgramsPage extends StatefulWidget {
  @override
  _ProgramsPageState createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  late double width;
  final GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  List<Widget> categoriesWidget = [];
  List<CategoryModel> categories = [];

  List<ProgramsResponse> programs = [];
  final _bloc = locator<ProgramsBloc>();
  int selectedCategoryId = -100;

  @override
  void initState() {
    _bloc.add(FetchPrograms());
    _bloc.add(FetchCategories());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    _getCategoriesWidget();

    return BlocBuilder(
        bloc: _bloc,
        builder: (context, ProgramsState state) {
          if (state is ProgramsEmpty) {
            _bloc.add(FetchPrograms());
          }
          if (state is ProgramsError) {
            return ErrorScreen(
              onRetry: () => _bloc.add(FetchPrograms()),
            );
          }
          if (state is ProgramsLoaded) {
            programs = state.programs;
            return screenUi();
          }

          if (state is ProgramsLoading) {
            return LoadingScreen();
          }

          return Center(
            child: screenUi(),
          );
        });
  }

  Widget screenUi() {
    return Scaffold(
//      appBar: AppBar(),
        body: RefreshIndicator(
      onRefresh: () async {
        _bloc.add(FetchPrograms());
      },
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              child: new Container(
                height: 216,
                width: width,
                color: ProjectColors.BLACK,
                padding: EdgeInsets.all(19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'البرامج',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    Form(
                      key: _searchFormKey,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            width: width * 0.70,
                            child: Card(
                              elevation: 10,
                              color: Colors.white12,
                              margin: EdgeInsets.only(top: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                ),
                                child: TextFormField(
                                  controller: _searchController,

                                  style: TextStyle(
                                      color: ProjectColors.ThemeColor),
                                  onFieldSubmitted: (value) {
                                    _bloc.add(SearchPrograms(
                                        categoryId: selectedCategoryId,
                                        searchQuery:
                                            _searchController.text.trim()));
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      prefixIcon: GestureDetector(
                                        onTap: () {
                                          _bloc.add(SearchPrograms(
                                              categoryId: selectedCategoryId,
                                              searchQuery: _searchController
                                                  .text
                                                  .trim()));
                                        },
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        ),
                                      ),
                                      hintText: ' إضغط هنا للبحث',
                                      hintStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelStyle:
                                          TextStyle(color: Colors.white70)),
//                                 textInputAction: TextInputAction.next,
//                               onEditingComplete: () => node.nextFocus(),
                                  // Move focus to next
//                                 validator: (result) {
//                                   if (result.isEmpty) {
//                                     return '';
//                                   }
//                                   return null;
//                                 },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                _modalBottomSheetMenu();
                              },
                              child: CircleAvatar(
                                radius: 21,
                                backgroundColor: green,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11,
                                      right: 10,
                                      top: 13.0,
                                      bottom: 8.9),
                                  child: Icon(
                                    FontAwesomeIcons.filter,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                // iconImage: FilePath.FILTER,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          new Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 180),
              padding: new EdgeInsets.only(
                  top: 0, right: 10.0, left: 10.0, bottom: 50),
              child: ListView.builder(
                  itemCount: programs.length,
                  padding: EdgeInsets.only(top: 0),
//                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ProgramDetailsPage(
                                    programId: programs[index].id,
                                  ))),
                      child: Container(
                        child: ProgramCard(
                          image: '${programs[index].image?.large ?? ''}',
                          category:
                              '${programs[index].categories?.category?.name ?? ''}',
                          name: '${programs[index].title}',
                          date: '${programs[index].humanDate}',
                        ),
                      ),
                    );
                  })),
          BlocListener(
            bloc: _bloc,
            listener: (context, state) {
              if (state is CategoriesLoaded) {
                setState(() {
                  categories = state.categories;
                });
                log('categories fetched successfully');
              }
            },
            child: Container(),
          ),
        ],
      ),
    ));
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(50.0),
                topRight: const Radius.circular(50.0))),
        context: context,
        builder: (builder) {
          return new Container(
              height: 250.0,
              color: Colors.transparent,
              padding:
                  EdgeInsets.all(20), //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: StatefulBuilder(builder: (context, setState) {
                return new Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                                onPressed: () => Navigator.pop(context)),
                            Text(
                              'تصنيف النتائج',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  selectedCategoryId = -100;
                                  Navigator.pop(context);
                                  _bloc.add(FetchPrograms());
                                },
                                child: Text(
                                  'الغاء',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ProjectColors.ThemeColor),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _bloc.add(FetchCategoryPrograms(
                                      categoryId: selectedCategoryId));
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'تم',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ProjectColors.ThemeColor),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ])
                      ],
                    ),
                    Container(
                      height: 150,
                      child: categories.isEmpty
                          ? VdlProgressIndicator()
                          : GridView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
//                                          categories[index].isSelected = !categories[index].isSelected;
                                            selectedCategoryId =
                                                categories[index].id ?? 0;
                                          });
                                        },
                                        child: CategoryWidget(
                                            name: categories[index].name ?? '',
                                            isSelected: categories[index].id ==
                                                selectedCategoryId
//                                        categories[index].isSelected,
                                            )),
                                  ),
                                );
                              },
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 3,
                                      childAspectRatio: (2 / 1)),
                              itemCount: categories.length,
                              shrinkWrap: true,
                            ),
                    ),
                  ],
                ));
              }));
        });
  }

  _getCategoriesWidget() {
    categories.forEach((element) {
      categoriesWidget.add(Container(
        width: 75,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            )),
        padding: EdgeInsets.all(5),
        child: new Center(
          child: Text(element.name ?? ''),
        ),
      ));
    });
  }
}
