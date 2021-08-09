import 'package:flutter/material.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatelessWidget {
  final double size;

  LogoWidget({
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(FilePath.SURROUNDING_LOGO))),
      child: Stack(
        children: [
      Center(
      child: SvgPicture.asset(
      'assets/images/illustration.svg',
        height: 173,
        width: 216,
      ),
    ),
          Center(
            heightFactor: size*0.4,
            widthFactor: size*0.4,
            child: Image.asset(
              FilePath.LOGO ,
              height: size*0.4,
              width: size*0.4,
            ),
          ),
    ]),






    );
  }
}
