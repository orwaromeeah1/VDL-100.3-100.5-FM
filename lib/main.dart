import 'package:flutter/material.dart';
import 'package:vdl/ui/onBoarding/onBoarding.dart';

import 'injection.dart';

void main() async{
  await setLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('ar'),
      title: 'VDL',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.green,
        fontFamily: "TheSans",
        secondaryHeaderColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          Directionality(textDirection: TextDirection.rtl, child: OnBoarding()),
    );
  }
}
