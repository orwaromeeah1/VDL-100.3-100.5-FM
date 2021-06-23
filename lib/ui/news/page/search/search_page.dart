import 'package:flutter/material.dart';


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
                height: 75,
                width: width,
                color: Colors.white,
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.green,
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
              ),
          ),
        ],
      ),
    );
  }
}
