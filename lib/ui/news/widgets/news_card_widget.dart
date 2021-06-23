import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vdl/ui/NewsDetails/page/news_detials_page_s.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNewScreen(
        context,
        screen: NewsPageDetails(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 19.0, left: 19, bottom: 24),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 330,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ], borderRadius: BorderRadius.circular(14), color: Colors.white),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 230,
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topRight: const Radius.circular(14.0),
                          topLeft: const Radius.circular(14.0),
                        ),
                        image: DecorationImage(
                            image: AssetImage("assets/images/Lebanon.jpg"),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 19.0, left: 14, right: 15, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'الخميس ١١ شباط ٢٠٢١ – 07:21',
                            style: TextStyle(
                                fontSize: 11, color: black.withOpacity(0.41)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'الجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنان',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 215,
                left: 16,
                child: Container(
                  height: 25.23,
                  width: 50,
                  child: Center(
                    child: Text(
                      'محلية',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: brown, borderRadius: BorderRadius.circular(13)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
