import 'package:flutter/material.dart';
import 'package:vdl/utils/file_path/file_path.dart';

class BroadcastCard extends StatelessWidget {
  final bool isAvailable;
  final bool isSelected;
  final String time;

  BroadcastCard({
    this.time,
    this.isAvailable,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: 100,
            height: 68,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'نشرة الساعة',
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '$time',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          isAvailable
              ? Image.asset(
                  isSelected
                      ? FilePath.CURRENT_BROADCAST
                      : FilePath.OTHER_BROADCAST,
                  width: 100,
                )
              : Container(),
        ],
      ),
    );
  }
}
