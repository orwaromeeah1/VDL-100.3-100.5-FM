import 'package:flutter/material.dart';

typedef OnClickCallBack = Function();


class MenuItem extends StatelessWidget {
  final String title;
  final OnClickCallBack onClick;

  MenuItem({
    this.title,
    this.onClick,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$title',


                ),
                Icon(Icons.arrow_back_ios)
              ],
            ),
            Divider()
          ],
        )
      ),
    );
  }
}
