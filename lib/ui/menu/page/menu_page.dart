import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:vdl/ui/menu/widget/menu_item_widget.dart';
import 'package:vdl/ui/menu/widget/social_buttons.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  double width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    bool notificationOn = false;
    return Scaffold(
      body: Container(
        width: width,
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
              onClick: () {},
            ),
            MenuItem(
              title: 'نشرة الاخبار',
              onClick: () {},
            ),
            MenuItem(
              title: 'برامج تاريخية',
              onClick: () {},
            ),
            MenuItem(
              title: 'من نحن',
              onClick: () {},
            ),
            MenuItem(
              title: 'اتصل بنا',
              onClick: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21.0, right: 23),
              child: Container(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 25),
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
              padding: const EdgeInsets.only(right: 23.0),
              child: Row(
                children: [
                  SocialButton(
                    tag: 3,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  SocialButton(
                    tag: 2,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  SocialButton(
                    tag: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
