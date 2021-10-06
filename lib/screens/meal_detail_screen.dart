import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/male-detail';
  
  Widget buildSectionTitle(BuildContext context,String title){
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(title,style: Theme.of(context).textTheme.headline1,),
    );
  }

  Widget buildContainer(Widget child){
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),            
      ),
      height: 150,
      width: 300,
      child: child,
    );

  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal){
      return meal.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title),),
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer( 
              ListView.builder(itemBuilder: (ctx,index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                  color: Colors.amber,
                );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(itemBuilder: (ctx,index){
                return Column(children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(child: Text('# ${(index+1)}'),),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  const Divider(),
                ],);
              }),
            ),
          ],
        ),
      ), 
    );
  }
}