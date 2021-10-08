import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/live_broadcast/bloc/live_podcast_bloc.dart';
import 'package:vdl/ui/live_broadcast/bloc/live_podcast_event.dart';
import 'package:vdl/ui/live_broadcast/page/live_broadcast_page.dart';
import 'package:vdl/ui/menu/page/menu_page.dart';
import 'package:vdl/ui/news/bloc/news_bloc.dart';
import 'package:vdl/ui/news/bloc/news_event.dart';
import 'package:vdl/ui/news/page/news_page.dart';
import 'package:vdl/ui/programs/page/progams_page.dart';
import 'package:vdl/ui/programs_schedule/page/programs_scedule_page.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class MainTabsPage extends StatefulWidget {
  AudioPlayer introductionAudioPlayer = new AudioPlayer();
  MenuPage menuPage;
  NewsPage newsPage;
  List<Widget> _pages;

  MainTabsPage() {
    menuPage = new MenuPage(introductionAudioPlayer);
    newsPage = new NewsPage(introductionAudioPlayer);
    _pages = [
      newsPage,
      ProgramsPage(),
      LiveBroadcastPage(),
      ProgramsSchedulePage(),
      menuPage,
      // see the SettingsPage class
    ];
  }
  @override
  _MainTabsPageState createState() => _MainTabsPageState();
}

class _MainTabsPageState extends State<MainTabsPage> {
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
          widget.introductionAudioPlayer.pause();
        },
        icon: Icon(Icons.home_rounded),
        iconSize: 27,
        textStyle: TextStyle(fontSize: 10),
        activeColorPrimary: Colors.grey.withOpacity(0.4),
        activeColorSecondary: ProjectColors.ThemeColor,
        title: 'أخبار',
      ),
      PersistentBottomNavBarItem(
        iconSize: 27,
        textStyle: TextStyle(fontSize: 10),
        icon: Icon(Icons.grid_view_rounded),
        activeColorPrimary: Colors.grey.withOpacity(0.4),
        activeColorSecondary: ProjectColors.ThemeColor,
        title: 'برامج',
      ),
      PersistentBottomNavBarItem(
        iconSize: 27,
        textStyle: TextStyle(fontSize: 10),
        icon: Icon(Icons.podcasts),
        activeColorPrimary: Colors.grey.withOpacity(0.4),
        activeColorSecondary: ProjectColors.ThemeColor,
        title: 'بث مباشر',
      ),
      PersistentBottomNavBarItem(
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
        onItemSelected: (index) {
          setState(() {
            audioPlayer.pause();
            // locator<BackGroundAudioPlayer>().player.stop();
            // locator<BackGroundAndroidAudioPlayer>().player.stop();
            widget.introductionAudioPlayer.pause();
            locator<LivePodcastBloc>().add(StopLiveAudio());
          });
        },
        controller: _controller,
        screens: widget._pages,
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

  @override
  void dispose() {
    widget.introductionAudioPlayer.release();
    widget.introductionAudioPlayer.dispose();
    super.dispose();
  }
}
