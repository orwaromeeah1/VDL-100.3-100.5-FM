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
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(

            color: color,
            borderRadius: BorderRadius.circular(50),
            boxShadow: isGlowing ? [
              BoxShadow(
                color: color.withOpacity(0.8),
                blurRadius: 20,
                offset: Offset(4, 4,), // Shadow position
              ),
              BoxShadow(
                color: color.withOpacity(0.8),
                blurRadius: 20,
                offset: Offset(-4, -4,), // Shadow position
              ),
            ]:
            [],
          ),
          child:iconImage != ''
                ?Image.asset(iconImage,height: size,width: size,)
                :icon
        ),
      ),
    );
  }
}
