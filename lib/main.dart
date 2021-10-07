import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> availableMeals = dummyMeals;

  Map<String,bool> filters= {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false
  };

  void setFilters(Map<String, bool> filterData ){
    setState(() {
      filters = filterData;

      availableMeals = dummyMeals.where((meal){
        if(filters['gluten']! && !meal.isGlutenFree ){
          return false;
        }
        if(filters['lactose']! && !meal.isLactoseFree ){
          return false;
        }
        if(filters['vegan']! && !meal.isVegan ){
          return false;
        }
        if(filters['vegetarian']! && !meal.isVegetarian ){
          return false;
        }
        return true;
      }).toList();
    });
  }

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
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          )
        ),
      ),
      home: TabsScreen(), // Starting app with different screen
      routes: {
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(availableMeals), //giving named route
        MealDetailScreen.routeName : (context) => MealDetailScreen(),
        FiltersScreen.routeName : (context) => FiltersScreen(filters,setFilters),
      }, 
    );
  }
}
