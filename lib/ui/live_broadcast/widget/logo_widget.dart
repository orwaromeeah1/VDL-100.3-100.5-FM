import 'package:flutter/material.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatelessWidget {
  final double? size;

  const LogoWidget({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55.0, left: 55, right: 55),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Center(
            child: SvgPicture.asset(
              'assets/images/illustration.svg',
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Center(
            heightFactor: (size ?? 1.0) * 0.4,
            widthFactor: (size ?? 1.0) * 0.4,
            child: Image.asset(
              FilePath.LOGO,
              height: MediaQuery.of(context).size.height / 2.5 * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        ]),
      ),
    );
  }
}
