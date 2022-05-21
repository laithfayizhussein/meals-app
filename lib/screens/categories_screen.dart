import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = 'CategoriesScreen';

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(15),
        // DUMMY_CATEGORIES its a list of data in dummy_categories page
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(
                  title: e.title,
                  color: e.color,
                  id: e.id,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ));
  }
}
