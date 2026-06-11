import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vdl/data/shared_preferences/auth_prefes_helper.dart';
import 'package:vdl/ui/Aboutus/pages/about_us_page.dart';
import 'package:vdl/ui/Articles/page/articles.dart';
import 'package:vdl/ui/ContactUs/pages/contact_us_page.dart';
import 'package:vdl/ui/TermsOfUse/terms_of_use.dart';
import 'package:vdl/ui/menu/widget/menu_item_widget.dart';
import 'package:vdl/ui/menu/widget/social_buttons.dart';
import 'package:vdl/ui/news_broadcasts/page/news_broadcasts_page.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

import '../../../injection.dart';

class MenuPage extends StatefulWidget {
  final AudioPlayer introductionAudioPlayer;

  const MenuPage(this.introductionAudioPlayer, {Key? key}) : super(key: key);
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late double width;

  final _helper = locator<AuthPrefsHelper>();
  var notification = true;
  @override
  void initState() {
    super.initState();

    getNotification();
  }

  void _launchURL(String _url) async {
    final uri = Uri.parse(_url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $_url';
    }
  }

  void getNotification() async {
    bool n = await _helper.getNotification() ?? false;

    if (!n) {
      OneSignal.User.pushSubscription.optOut();
    } else {
      OneSignal.User.pushSubscription.optIn();
    }
    setState(() {
      notification = n;
    });
  }

  void setNotifications(bool value) async {
    await _helper.setNotification(value);
    if (!value) {
      OneSignal.User.pushSubscription.optOut();
    } else {
      OneSignal.User.pushSubscription.optIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 53.0,
                  right: 23,
                ),
                child: Text(
                  'القائمة',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MenuButtonItem(
                title: 'مقالات',
                onClick: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: ArticlesPage(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              MenuButtonItem(
                title: 'نشرة الاخبار',
                onClick: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: NewsBroadcastsPage(
                      introductionAudioPlayer: widget.introductionAudioPlayer,
                    ),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
//              MenuButtonItem(
//                title: 'برامج تاريخية',
//                onClick: () {
//                  PersistentNavBarNavigator.pushNewScreen(
//                    context,
//                    screen: HistoricalPrograms(),
//                    withNavBar: true,
//                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
//                  );
//                },
//              ),
              MenuButtonItem(
                title: 'من نحن',
                onClick: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: AboutUsPage(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              MenuButtonItem(
                title: 'اتصل بنا',
                onClick: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: ContactUsPage(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              MenuButtonItem(
                title: 'شروط الإستخدام',
                onClick: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: TermsOfUsePage(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 21.0, right: 23),
                child: Container(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 33.0, top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'اشعارات',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          CupertinoSwitch(
                              activeTrackColor: green,
                              value: notification,
                              onChanged: (value) {
                                setNotifications(value);
                                setState(() {
                                  notification = value;
                                });
                              }),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 23.0, bottom: 99),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          _launchURL('https://twitter.com/sawtlebnan?lang=en'),
                      child: SocialButton(
                        tag: 3,
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    GestureDetector(
                      onTap: () => _launchURL(
                          'https://www.instagram.com/voice_of_lebanon/'),
                      child: SocialButton(
                        tag: 2,
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    GestureDetector(
                        onTap: () =>
                            _launchURL('https://www.facebook.com/sawtlebnan/'),
                        child: SocialButton(
                          tag: 1,
                        )),
                    SizedBox(
                      width: 13,
                    ),
                    GestureDetector(
                        onTap: () => _launchURL(
                            'https://www.youtube.com/@VoiceOfLebanon100.5'),
                        child: SocialButton(
                          tag: 4,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
