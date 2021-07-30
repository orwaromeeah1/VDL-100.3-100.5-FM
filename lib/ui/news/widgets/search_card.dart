import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vdl/ui/NewsDetails/page/news_detials_page_s.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class SearchCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String category;
  final int id;

 SearchCardWidget({
    this.image,
   this.category,
   this.date,
   this.title,
   this.id,
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNewScreen(
        context,
        screen: NewsPageDetails(newsId:id ,isSpecial: false,),
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
                            image: NetworkImage("$image"),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 19.0, left: 14, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$date',
                            style: TextStyle(
                                fontSize: 11, color: black.withOpacity(0.41)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${Bidi.stripHtmlIfNeeded(title)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 2,
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
                      '$category',
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
