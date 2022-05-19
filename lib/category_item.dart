import 'package:flutter/material.dart';
import './category_meals_screen.dart';

// in this page what the category should look like ,
class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem({required this.title, required this.color, required this.id});

  void selectCategore(BuildContext context) {
    Navigator.pushNamed(context, CategoriesMeals.routeName,
        arguments: {'id': id, 'title': title});

    // nav by material app and put the title of the app show in app bar as constructor
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return CategoriesMeals(
    //     categoryTitle: title,
    //     categoryId: id,
    //   );
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategore(
          context), //()=> Navigator.pushNamed(context , CategoriesMeals.id) by name of rout
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.45), color],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
