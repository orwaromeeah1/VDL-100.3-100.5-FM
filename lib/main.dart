import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:vdl/firebase_options.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/NewsDetails/page/news_detials_page_s.dart';
import 'package:vdl/ui/notifications/page/notifications_page.dart';
import 'package:vdl/ui/onBoarding/onBoarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MobileAds.instance.initialize();

  if (Platform.isIOS) {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    );
  }
  await setLocator();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      locale: const Locale('ar'),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        );
      },
      title: 'VDL',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.grey,
        fontFamily: "TheSans",
        secondaryHeaderColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: OnBoarding(),
      ),
    );
  }

  Future<void> initPlatformState() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    await OneSignal.initialize('56917385-48bf-4670-bf10-2df27fc640c1');

    OneSignal.Notifications.addClickListener((event) async {
      try {
        final source = event.notification.additionalData;
        await Future.delayed(const Duration(seconds: 2));
        navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: NewsPageDetails(
                  newsId: int.parse(source!['post_id']), isSpecial: false),
            ),
          ),
        );
      } catch (e) {
        navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (context) => const Directionality(
                textDirection: TextDirection.rtl, child: NotificationPage()),
          ),
        );
      }
    });

    OneSignal.Notifications.requestPermission(false).then((accepted) {
      print("Accepted permission: $accepted");
    });
  }
}
