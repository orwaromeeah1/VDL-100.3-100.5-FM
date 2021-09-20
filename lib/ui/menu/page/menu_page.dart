import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vdl/ui/Aboutus/pages/about_us_page.dart';
import 'package:vdl/ui/Articles/page/articles.dart';
import 'package:vdl/ui/ContactUs/pages/contact_us_page.dart';
import 'package:vdl/ui/menu/widget/menu_item_widget.dart';
import 'package:vdl/ui/menu/widget/social_buttons.dart';
import 'package:vdl/ui/news_broadcasts/page/news_broadcasts_page.dart';
import 'package:vdl/ui/programs/page/historical_programs/historical_programs_page.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class MenuPage extends StatefulWidget {
  AudioPlayer introductionAudioPlayer;

  MenuPage(AudioPlayer introductionAudioPlayer) {
    this.introductionAudioPlayer = introductionAudioPlayer;
  }
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  double width;

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    bool notificationOn = false;
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
              MenuItem(
                title: 'مقالات',
                onClick: () {
                  pushNewScreen(
                    context,
                    screen: ArticlesPage(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              MenuItem(
                title: 'نشرة الاخبار',
                onClick: () {
                  pushNewScreen(
                    context,
                    screen: NewsBroadcastsPage(widget.introductionAudioPlayer),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
//              MenuItem(
//                title: 'برامج تاريخية',
//                onClick: () {
//                  pushNewScreen(
//                    context,
//                    screen: HistoricalPrograms(),
//                    withNavBar: true,
//                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
//                  );
//                },
//              ),
              MenuItem(
                title: 'من نحن',
                onClick: () {
                  pushNewScreen(
                    context,
                    screen: AboutUsPage(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              MenuItem(
                title: 'اتصل بنا',
                onClick: () {
                  pushNewScreen(
                    context,
                    screen: ContactUsPage(),
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
                          FlutterSwitch(
                            height: 30.0,
                            width: 49.0,
                            padding: 4.0,
                            toggleSize: 22.0,
                            borderRadius: 21.0,
                            activeColor: green,
                            value: notificationOn,
                            onToggle: (value) {
                              setState(() {
                                notificationOn = value;
                              });
                            },
                          ),
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
