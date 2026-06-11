import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

typedef OnClickCallBack = Function();
class LiveStreamButton extends StatelessWidget {
  final String image;
  final String text;
  final OnClickCallBack onClick;

  const LiveStreamButton({
    Key? key,
    required this.image,
    required this.text,
    required this.onClick,
  }) : super(key: key);

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
              SvgPicture.asset(image),
             SizedBox(width: 10,),
             Text(
               '$text',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 16,
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
