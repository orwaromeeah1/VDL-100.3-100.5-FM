import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class SocialButton extends StatelessWidget {
  final int tag;
  const SocialButton({
    Key key,
    this.tag,
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
                    ? FontAwesome.facebook
                    : tag == 2
                        ? FontAwesome.instagram
                        : tag == 3
                            ? FontAwesome.twitter
                            : FontAwesome.youtube_play,
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
