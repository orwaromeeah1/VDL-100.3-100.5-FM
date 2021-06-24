import 'package:flutter/material.dart';

typedef OnClickCallBack = Function();
class GlowingCircularButton extends StatelessWidget {
  final OnClickCallBack onClick;
  final double size;
  final Color color;
  final Icon icon;
  final bool isGlowing;
  final String iconImage;

  GlowingCircularButton({
    this.onClick,
    this.size,
    this.color,
    this.icon,
    this.isGlowing : false,
    this.iconImage:'',
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size+10,
      height: size+10,
      padding: EdgeInsets.all(5),

      decoration: BoxDecoration(
        color: isGlowing ? color.withOpacity(0.3) : Colors.transparent,
        borderRadius: BorderRadius.circular(60),

      ),
      child: Container(
        child: GestureDetector(
          onTap: onClick,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(

              color: color,
              borderRadius: BorderRadius.circular(50),

            ),
            child:iconImage != ''
                  ?Image.asset(iconImage,height: size,width: size,)
                  :icon
          ),
        ),
      ),
    );
  }
}
