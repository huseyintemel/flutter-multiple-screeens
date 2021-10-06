import 'package:flutter/material.dart';
import 'package:flutter_multiple_screens/models/category.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : const EdgeInsets.all(16),
      child: Text(title,style: Theme.of(context).textTheme.headline1,),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.7) ,color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}