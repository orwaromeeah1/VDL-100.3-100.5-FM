import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

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
      child: Padding(
        padding: const EdgeInsets.only(left: 21.0, right: 23),
        child: Container(
            height: 71,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$title',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: iconGrey,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: black.withOpacity(0.07),
                )
              ],
            )),
      ),
    );
  }
}
