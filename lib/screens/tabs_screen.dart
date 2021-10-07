import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, Widget>> ?pages;
  int selectedPageIndex = 0;

  @override
  void initState() {
    pages = [
    {
      'page':CategoriesScreen(),
      'title': const Text('Meals'),
    },
    {
      'page':FavoritesScreen(widget.favoriteMeals),
      'title': const Text('Your Favorites'),
    }
  ];
    super.initState();
  }

  void selectPage(int index){
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:pages![selectedPageIndex]['title'],),
      body: pages![selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: selectPage,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
           icon: Icon(Icons.category),
           label: 'Categories',
          ),
          BottomNavigationBarItem(
           icon: Icon(Icons.favorite,),
           label: 'Favorites',
          ),
        ],
      )
    );
  }
}