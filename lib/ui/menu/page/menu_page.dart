import 'package:flutter/material.dart';
import 'package:vdl/ui/menu/widget/menu_item_widget.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  double width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: width ,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            'القائمة',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            MenuItem(title: 'مقالات',onClick: (){},),
            MenuItem(title: 'مقالات',onClick: (){},),
            MenuItem(title: 'مقالات',onClick: (){},),
            MenuItem(title: 'مقالات',onClick: (){},),
            MenuItem(title: 'مقالات',onClick: (){},),
            MenuItem(title: 'مقالات',onClick: (){},),

          ],
        ),
      ),
    );
  }
}
