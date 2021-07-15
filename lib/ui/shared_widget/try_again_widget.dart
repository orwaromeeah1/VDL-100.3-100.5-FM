import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

Widget tryAgain(BuildContext context, void ontap) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: InkWell(
      onTap: () => ontap,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: blue),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text('Try again'),
        ),
      ),
    ),
  );
}
