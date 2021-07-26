import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

typedef RetryCallBack = void Function();

class ErrorScreen extends StatelessWidget {
  final RetryCallBack onRetry;

  ErrorScreen({this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
//            Image.asset(FilePath.LOGO),
            Text(
              'Error Fetching data\n Check your internet connection',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              color: ProjectColors.ThemeColor,
              child: FlatButton(
                onPressed: onRetry,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Try Again',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ]),
    ));
  }
}
