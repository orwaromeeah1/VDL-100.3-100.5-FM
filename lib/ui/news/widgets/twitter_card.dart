import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class twitterCard extends StatelessWidget {
  const twitterCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, bottom: 10),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ], borderRadius: BorderRadius.circular(7), color: Colors.white),
        height: 117,
        width: 272,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 19.0, left: 14, right: 15, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'منذ ساعه ',
                style: TextStyle(fontSize: 11, color: black.withOpacity(0.41)),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'التقى رئيس حزب الكتائب اللبنانية النائب سامي الجميل في بيت الكتائب المركزي المنسق الخاص للأمم المتحدة في لبنان يان كوبيتش وكانت مناسبة للبحث في آخر التطورات',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
