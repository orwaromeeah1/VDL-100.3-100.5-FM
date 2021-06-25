import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
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

//
                            }),
                        Container(
                          width:width*0.75 ,
                          child: TextFormField(
                            controller: _searchController,
                            onFieldSubmitted: (value) {
                            },
                            decoration: InputDecoration(
                              hintText: 'ابحث',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){},
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
        ],
      ),
    );
  }
}
