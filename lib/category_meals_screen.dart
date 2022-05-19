import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoriesMeals extends StatelessWidget {
  static const String routeName = 'CategoriesMeals';

  // passing data by the material push nav
  // final String categoryTitle;
  // final String categoryId;
  // CategoriesMeals({required this.categoryTitle, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    // pass the data in push named way and i use map to loop throw the string i have
    final routeArge =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArge['title'];
    final categotyId = routeArge['id'];
    final categoriesMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(categotyId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
            itemCount: categoriesMeals
                .length, // should added to view more than one item
            itemBuilder: (context, index) {
              return Text(categoriesMeals[index].title);
            }));
  }
}
