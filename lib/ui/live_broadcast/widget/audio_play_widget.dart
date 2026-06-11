import 'package:flutter/material.dart';
import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class AudioPlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(FilePath.VOICE), fit: BoxFit.fitWidth)),
      child: Center(
        child: GlowingCircularButton(
          isGlowing: true,
          icon: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          onClick: () {},
          color: ProjectColors.ThemeColor,
          size: 50,
        ),
      ),
    );
  }
}
