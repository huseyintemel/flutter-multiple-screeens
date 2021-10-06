import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>; // using values as Map of with String keys and String objects

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];    
    final categoryMeals = dummyMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle as String),),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          complexity: categoryMeals[index].complexity,
          affordability: categoryMeals[index].affordability,
        );
      },
      itemCount: categoryMeals.length,
      )
    );
  }
}