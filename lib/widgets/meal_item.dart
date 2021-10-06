import 'package:flutter/material.dart';
import 'package:flutter_multiple_screens/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({required this.title, required this.imageUrl, required this.duration, required this.complexity, required this.affordability});

  String? get complexityText{
    if(complexity == Complexity.simple){
      return 'Simple';
    }
    else if(complexity == Complexity.challenging){
      return 'Challenging';
    }
    else if(complexity == Complexity.hard){
      return 'Hard';
    }
  }

  String? get affordabilityText{
    if(affordability == Affordability.affordable){
      return 'Affordable';
    }
    else if(affordability == Affordability.pricey){
      return 'Pricey';
    }
    else if(affordability == Affordability.luxurious){
      return 'Luxurious';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        margin: const EdgeInsets.all(12),
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.network(imageUrl,height: 250, width: double.infinity, fit: BoxFit.cover,)
              ),
              Positioned(
                bottom: 20,
                left: 40,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: const EdgeInsets.all(10),
                  child: Text(title,style: const TextStyle(fontSize:24,color: Colors.white),softWrap: true,overflow: TextOverflow.fade,)
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(Icons.schedule),
                    const SizedBox(width:6),
                    Text('$duration min'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.work),
                    const SizedBox(width:6), 
                    Text(complexityText!),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.attach_money),
                    const SizedBox(width:6),
                    Text(affordabilityText!),
                  ],
                ),
              ],
            ),
          ),
        ],),
      ),  
      
    );
  }
}