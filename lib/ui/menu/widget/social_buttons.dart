import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class SocialButton extends StatelessWidget {
  final int tag;
  const SocialButton({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Center(
        child: tag == 3
            ? SvgPicture.asset(
                FilePath.TWITTER,
                color: green,
              )
            : Icon(
                tag == 1
                    ? FontAwesomeIcons.facebook
                    : tag == 2
                        ? FontAwesomeIcons.instagram
                        : tag == 3
                            ? FontAwesomeIcons.twitter
                            : FontAwesomeIcons.youtube,
                color: green,
              ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            width: 2,
            color: black.withOpacity(0.07),
          )),
    );
  }
}
