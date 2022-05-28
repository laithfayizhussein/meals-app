import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = 'SettingsScreen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  SettingsScreen(this.currentFilters, this.saveFilters);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  initState() {
    glutenFree = widget.currentFilters['gluten']!;
    vegetarian = widget.currentFilters['vegetarian']!;
    vegan = widget.currentFilters['vegan']!;
    lactoseFree = widget.currentFilters['lactoseFree']!;
    super.initState();
  }

  Widget switchListWidget(Function(bool) updateValue, bool currentVal,
      String description, String title) {
    return SwitchListTile(
        title: Text(title),
        value: currentVal,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': glutenFree,
                  'lactose': lactoseFree,
                  'vegan': vegan,
                  'vegetarian': vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
          title: Text('Settings'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('theres your meal selection'),
            ),
            Expanded(
                child: ListView(
              children: [
                switchListWidget(
                  (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                  glutenFree,
                  'Only include vegetarian-free meals',
                  'vegetarian-free',
                ),
                switchListWidget(
                  (newValue) {
                    setState(() {
                      vegetarian = newValue;
                      print(newValue);
                      print('asdasdsadsadsadsa');
                    });
                  },
                  vegetarian,
                  'Only include lactonse-free meals',
                  'lactonse-free',
                ),
                switchListWidget(
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                  lactoseFree,
                  'Only include gluten-free meals',
                  'Gluten-free',
                ),
                switchListWidget(
                  (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                  vegan,
                  'Only include _vegan-free meals',
                  '_vegan-free',
                ),
              ],
            ))
          ],
        ));
  }
}
