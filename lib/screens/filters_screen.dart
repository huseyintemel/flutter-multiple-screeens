import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFree = false;
  var lactoseFree = false;
  var isVegan = false;
  var isVegetarian = false;

  @override
  initState(){
    glutenFree = widget.currentFilters['gluten'] as bool;
    lactoseFree = widget.currentFilters['lactose'] as bool;
    isVegan= widget.currentFilters['vegan'] as bool;
    isVegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget buildSwitchListTile(String title,String subtitle,bool currentValue,Function updateValue){
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: (value){
        updateValue(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: (){
              final selectedFilters ={
                'gluten' : glutenFree,
                'lactose' : lactoseFree,
                'vegan' : isVegan,
                'vegetarian' : isVegetarian
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text('Please select filters',style: Theme.of(context).textTheme.headline1,),
        ),
        Expanded(
          child: ListView(
            children: [
              buildSwitchListTile('Gluten-free','Only include gluten-free meals.',glutenFree,(value){
                setState(() {
                  glutenFree = value;
                });
              }),
               buildSwitchListTile('Lactose-free','Only include lactose-free meals.',lactoseFree,(value){
                setState(() {
                  lactoseFree = value;
                });
              }),
               buildSwitchListTile('Vegan','Only include vegan meals.',isVegan,(value){
                setState(() {
                  isVegan = value;
                });
              }),
               buildSwitchListTile('Vegetarian','Only include vegetarian meals.',isVegetarian,(value){
                setState(() {
                  isVegetarian = value;
                });
              }),
            ],
          ),
        )
      ],)
    ); 
  }
}