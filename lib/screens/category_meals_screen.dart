import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoriesMeals extends StatefulWidget {
  static const String routeName = 'CategoriesMeals';
  final List<Meal> availableMeals;
  CategoriesMeals(this.availableMeals);

  @override
  State<CategoriesMeals> createState() => _CategoriesMealsState();
}

class _CategoriesMealsState extends State<CategoriesMeals> {
  late String? categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArge =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArge['title'];
      final categotyId = routeArge['id'];
      displayedMeals = widget
          .availableMeals // change it from dummy list to available from the main to con  trol the filtering
          .where((element) => element.categories.contains(categotyId))
          .toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeFunction(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  // passing data by the material push nav
  @override
  Widget build(BuildContext context) {
    // pass the data in push named way and i use map to loop throw the string i have

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
            itemCount: displayedMeals
                .length, // should added to view more than one item
            itemBuilder: (context, index) {
              return MealItem(
                title: displayedMeals[index].title,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                imageUrl: displayedMeals[index].imageUrl,
                affordability: displayedMeals[index].affordability,
                id: displayedMeals[index].id,
                removeItem: _removeFunction,
              );
            }));
  }
}
