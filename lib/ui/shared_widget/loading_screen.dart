import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator(
                      color: ProjectColors.ThemeColor,
                    ))),
    );
  }
}

Widget LoadingIndicator() {
  return Center(
    child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 50,
          width: 50,
          child: Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator(
                      color: ProjectColors.ThemeColor,
                    )),
        )),
  );
}
