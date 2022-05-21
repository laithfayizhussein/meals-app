// import 'package:flutter/material.dart';
// import './categories_screen.dart';
// import './favorites_screen.dart';
//
// class TabsScreen extends StatefulWidget {
//   static const String routeName = 'TabsScreen';
//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }
//
// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('meals'),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'category',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'favorites',
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
