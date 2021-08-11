import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/live_broadcast/page/live_broadcast_page.dart';
import 'package:vdl/ui/menu/page/menu_page.dart';
import 'package:vdl/ui/news/bloc/news_bloc.dart';
import 'package:vdl/ui/news/bloc/news_event.dart';
import 'package:vdl/ui/news/page/news_page.dart';
import 'package:vdl/ui/programs/page/progams_page.dart';
import 'package:vdl/ui/programs_schedule/page/programs_scedule_page.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class MainTabsPage extends StatefulWidget {
  @override
  _MainTabsPageState createState() => _MainTabsPageState();
}

class _MainTabsPageState extends State<MainTabsPage> {
  List<Widget> _pages = [
    NewsPage(),
    ProgramsPage(),
    LiveBroadcastPage(),
    ProgramsSchedulePage(),
    MenuPage(),
    // see the SettingsPage class
  ];
  AudioPlayer audioPlayer = locator<AudioPlayer>();

  /// Compulsory
  pauseMusic() async {
    int result = await audioPlayer.pause();
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        onSelectedTabPressWhenNoScreensPushed: () {
          locator<NewsBloc>().add(MoveToTop());
          audioPlayer.pause();
        },
        onPressed: (context) {
          _controller.index = 0;
          setState(() {
            audioPlayer.pause();
          });
        },
        icon: Icon(Icons.home_rounded),
        iconSize: 27,
        textStyle: TextStyle(fontSize: 10),
        activeColorPrimary: Colors.grey.withOpacity(0.4),
        activeColorSecondary: ProjectColors.ThemeColor,
        title: 'أخبار',
      ),
      PersistentBottomNavBarItem(
        onPressed: (context) {
          _controller.index = 1;
          setState(() {
            audioPlayer.pause();
          });
        },
        iconSize: 27,
        textStyle: TextStyle(fontSize: 10),
        icon: Icon(Icons.grid_view_rounded),
        activeColorPrimary: Colors.grey.withOpacity(0.4),
        activeColorSecondary: ProjectColors.ThemeColor,
        title: 'برامج',
      ),
      PersistentBottomNavBarItem(
        onPressed: (context) {
          _controller.index = 2;
          setState(() {
            audioPlayer.pause();
          });
        },
        onSelectedTabPressWhenNoScreensPushed: () {
          audioPlayer.pause();
        },
        iconSize: 27,
        textStyle: TextStyle(fontSize: 10),
        icon: Icon(Icons.podcasts),
        activeColorPrimary: Colors.grey.withOpacity(0.4),
        activeColorSecondary: ProjectColors.ThemeColor,
        title: 'بث مباشر',
      ),
      PersistentBottomNavBarItem(
        onPressed: (context) {
          _controller.index = 3;
          setState(() {
            audioPlayer.pause();
          });
        },
        iconSize: 27,
        textStyle: TextStyle(fontSize: 10),
        icon: Icon(
          FlutterIcons.calendar_alt_faw5,
        ),
        activeColorPrimary: Colors.grey.withOpacity(0.4),
        activeColorSecondary: ProjectColors.ThemeColor,
        title: 'جدول البرامج',
      ),
      PersistentBottomNavBarItem(
        onPressed: (context) {
          _controller.index = 4;
          setState(() {
            audioPlayer.pause();
          });
        },
        iconSize: 27,
        textStyle: TextStyle(fontSize: 10),
        icon: Icon(Ionicons.md_menu),
        activeColorPrimary: Colors.grey.withOpacity(0.4),
        activeColorSecondary: ProjectColors.ThemeColor,
        title: 'قائمة',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _pages,
        items: _navBarsItems(),
        navBarHeight: 70,
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style6,
        padding: NavBarPadding.only(top: 15),
        decoration: NavBarDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(-5, 0),
                blurRadius: 5,
              ),
              BoxShadow(
                color: Colors.black12,
                offset: Offset(5, 0),
                blurRadius: 5,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(35), topLeft: Radius.circular(35))),
      ),
    );
  }
}
