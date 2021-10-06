import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals'),),
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          ...dummyCategories
              .map((category) => CategoryItem(category.id,category.title, category.color))
              .toList()
        ],
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        )
      ),
    );
  }
}
