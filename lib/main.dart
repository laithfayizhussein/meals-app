import 'package:flutter/material.dart';
import './category_meals_screen.dart';
import './categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1), // for background on app
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
                fontSize: 20,
                fontFamily: 'Robotocondensed',
                fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme(
          primary: Colors.pink,
          onPrimary: Colors.white,
          secondaryContainer: Colors.amber,
          background: Colors.red,
          onBackground: Colors.black,
          secondary: Colors.red,
          onSecondary: Colors.white,
          error: Colors.black,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
          brightness: Brightness.light,
        ),
      ),
      home: CategoriesScreen(),
      initialRoute: CategoriesScreen.routeName,
      routes: {
        CategoriesMeals.routeName: (context) => CategoriesMeals(),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
      },
    );
  }
}
