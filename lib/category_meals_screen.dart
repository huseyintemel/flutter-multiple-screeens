import 'dart:io';

import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>; // using values as Map of with String keys and String objects

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];    

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle as String),),
      body: Container(
        child: const Center(child: Text('Meals Screen',)),
      )
    );
  }
}