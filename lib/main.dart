import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/live_broadcast/page/live_audio/live_audio_page.dart';
import 'package:vdl/ui/onBoarding/onBoarding.dart';
import 'package:audioplayers/audioplayers.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("56917385-48bf-4670-bf10-2df27fc640c1");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
    // Will be called whenever a notification is received in foreground
    // Display Notification, pass null param for not displaying the notification
    event.complete(event.notification);
  });

  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    print(result.notification.body);
    // Will be called whenever a notification is opened/button pressed.
  });

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
      home: Platform.isAndroid
          ? Directionality(
              textDirection: TextDirection.rtl, child: OnBoarding())
          : AudioServiceWidget(
              child: Directionality(
                  textDirection: TextDirection.rtl, child: OnBoarding())),
    );
  }
}
