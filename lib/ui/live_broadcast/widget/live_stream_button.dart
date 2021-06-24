import 'package:flutter/material.dart';
import 'package:vdl/ui/menu/widget/menu_item_widget.dart';

typedef OnClickCallBack = Function();
class LiveStreamButton extends StatelessWidget {
  final String image;
  final String text;
  final OnClickCallBack onClick;

  LiveStreamButton({
    this.image,
    this.text,
    this.onClick,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 100,
        width: 300,
        margin: EdgeInsets.symmetric(vertical: 20),
        color: Colors.white10,
        child: Center(
          child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset(image),
             SizedBox(width: 10,),
             Text(
               '$text',
               style: TextStyle(
                 color: Colors.white
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
