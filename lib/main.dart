import 'package:flutter/material.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/onBoarding/onBoarding.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:audioplayers/audioplayers.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  final futureInit = MobileAds.instance.initialize();

  await setLocator(/*futureInit*/);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('ar'),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ), //set desired text scale factor here
          child: child,
        );
      },
      title: 'VDL',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.grey,
        fontFamily: "TheSans",
        secondaryHeaderColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          Directionality(textDirection: TextDirection.rtl, child: OnBoarding()),
    );
  }
}


