import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/live_broadcast/page/live_audio/live_audio_page.dart';
import 'package:vdl/ui/notifications/page/notifications_page.dart';
import 'package:vdl/ui/onBoarding/onBoarding.dart';
import 'package:audioplayers/audioplayers.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ////
  ///
  ///
  ///
  ///
  if (Platform.isIOS) {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    );
  }
  await setLocator(/*futureInit*/);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

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
      home: Platform.isAndroid
          ? Directionality(
              textDirection: TextDirection.rtl, child: OnBoarding())
          : AudioServiceWidget(
              child: Directionality(
                  textDirection: TextDirection.rtl, child: OnBoarding())),
    );
  }

  Future<void> initPlatformState() async {
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId('56917385-48bf-4670-bf10-2df27fc640c1');

    OneSignal.shared.setNotificationOpenedHandler((notification) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NotificationPage()));
    });
    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
// OneSignal.shared.pauseInAppMessages(!isNotificationOn);
  }
}
