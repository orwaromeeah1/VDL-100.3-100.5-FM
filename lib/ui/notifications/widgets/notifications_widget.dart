import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0, right: 19, bottom: 21),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(14)),
        height: 94,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 17.0, left: 14, right: 16, bottom: 14),
          child: Column(
            children: [
              Container(
                height: 48,
                child: Text(
                  'الجبهة المدنيَّة الوطنيَّة في يوم وداع لقمان سليم: ملتزمون معركة تحرير لبنان',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 14,
                child: Row(
                  children: [
                    Icon(
                      Icons.watch_later,
                      color: green,
                      size: 12,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'منذ ساعه',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
