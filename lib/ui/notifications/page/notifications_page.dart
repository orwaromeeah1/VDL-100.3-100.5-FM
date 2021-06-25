import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/ui/news/widgets/news_card_widget.dart';
import 'package:vdl/ui/notifications/widgets/notifications_widget.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundGrey,
        body: Column(
          children: [
            Container(
                color: Colors.white,
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 49.0, right: 19, left: 19, bottom: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Container(
                              height: 29,
                              width: 25,
                              child: SvgPicture.asset('assets/images/bell.svg'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'الاشعارات',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          radius: 16,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(
                              CupertinoIcons.back,
                              color: Colors.black,
                            ),
                          ),
                          backgroundColor: black.withOpacity(0.07),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                child: Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => NotificationCardWidget(),
                  itemCount: 20),
            )),
            SizedBox(
              height: 50,
            )
          ],
        ));
  }
}
