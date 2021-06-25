import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vdl/ui/live_broadcast/page/live_broadcast_page.dart';
import 'package:vdl/ui/menu/page/menu_page.dart';
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

  PersistentTabController _controller =PersistentTabController(initialIndex: 0);
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        activeColorPrimary: Colors.grey,
        activeColorSecondary: ProjectColors.ThemeColor,
        title: 'أخبار',
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.grid_view ),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: ProjectColors.ThemeColor,
        title: 'برامج',
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.wifi_tethering ),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: ProjectColors.ThemeColor,
        title: 'بث مباشر',
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calendar_today ,),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: ProjectColors.ThemeColor,
        title: 'جدول البرامج',
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.menu ),
          activeColorPrimary: Colors.grey,
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
        navBarHeight: 75,
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
              offset: Offset(-5,0),
              blurRadius: 1,
            ),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5,0),
              blurRadius: 1,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35),
              topLeft: Radius.circular(35)
          )
        ),

      ),
    );
  }
}
