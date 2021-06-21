import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vdl/ui/live_broadcast/page/live_broadcast_page.dart';
import 'package:vdl/ui/menu/page/menu_page.dart';
import 'package:vdl/ui/news/page/news_page.dart';
import 'package:vdl/ui/programs/page/progams_page.dart';
import 'package:vdl/ui/programs_schedule/page/programs_scedule_page.dart';


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

  PersistentTabController _controller =PersistentTabController(initialIndex: 0);
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        activeColorPrimary: Colors.grey,
        activeColorSecondary: Colors.green,
        title: 'أخبار',
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.grid_view ),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: Colors.green,
        title: 'برامج',
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.radio ),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: Colors.green,
        title: 'بث مباشر',
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.tv ,),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: Colors.green,
        title: 'جدول البرامج',
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.menu ),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: Colors.green,
        title: 'قائمة',
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(context,
        controller: _controller,
        screens: _pages,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style6,

      ),
    );
  }
}
