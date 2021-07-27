import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class VdlProgressIndicator extends StatelessWidget {
  final double size;
  VdlProgressIndicator({this.size: 50});
  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: size,
      heightFactor: size,
      child: CircularProgressIndicator(
        color: ProjectColors.ThemeColor,
      ),
    );
  }
}
