import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler){
    return ListTile(
      leading: Icon(icon,size:24),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:<Widget>[
          Container(
            color: Colors.amber,
            width: double.infinity,
            height: 60,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: const Text('Drawer menu',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28,color: Colors.white),),
          ),
          const SizedBox(height: 20,),
          buildListTile('Meals', Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.filter,(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
    
        ] 
      ),
    );  

  }
}