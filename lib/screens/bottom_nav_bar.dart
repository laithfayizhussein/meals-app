import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = 'BottomNavBar';
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Map<String, dynamic>> _page = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'MY Favorites'},
  ];

  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_page[selectedPageIndex]['title']),
      ),
      body: _page[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors
            .white, // to work right need to add color to selected item color
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        currentIndex: selectedPageIndex, // tell  it what the select icon
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'my favorites')
        ],
      ),
    );
  }
}
