import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final bool isSelected;

  CategoryWidget({
    this.name,
    this.isSelected,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 25,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: isSelected ? Colors.green : Colors.grey,
        )
      ),

      child: Center(
        child: Text(
          '$name',
          style: TextStyle(
            color: isSelected ? Colors.green : Colors.grey,
          ),
        ),
      ),
    );
  }
}
