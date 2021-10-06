import 'package:flutter/material.dart';
import './category_meals_screen.dart';
import './categories_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          )
        ),
      ),
      home: CategoriesScreen(), // Starting app with different screen
      routes: {
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(), //giving named route
      }, 
    );
  }
}
