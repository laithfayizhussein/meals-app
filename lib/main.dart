import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/meal_details_screen.dart';
import './screens/bottom_nav_bar.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/settings_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((element) {
        if (filters['gluten']! && !element.isGlutenFree) {
          return false;
        }
        if (filters['lactose']! && !element.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !element.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !element.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

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
          onSurface: Colors.black54,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BottomNavBar(),
        CategoriesMeals.routeName: (context) => CategoriesMeals(availableMeals),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
        SettingsScreen.routeName: (context) =>
            SettingsScreen(filters, setFilters),
      },
    );
  }
}
