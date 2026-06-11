import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final bool isSelected;

  CategoryWidget({
    required this.name,
    required this.isSelected,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 25,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(30),
        color: Color(0xffF4F5F7),
        border:isSelected
            ? Border.all(
          width: 1,
          color:  ProjectColors.ThemeColor
        )
            :null,
      ),

      child: Center(
        child: Text(
          '$name',
          style: TextStyle(
            color: isSelected ? ProjectColors.ThemeColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}
