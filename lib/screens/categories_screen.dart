// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class CategoriesScreenState extends State<CategoriesScreen> {

//    Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: Text("Categorias")));
//   }

// }

// class CategoriesScreen extends StatefulWidget {
//   @override
//   CategoriesScreenState createState() {
//     return CategoriesScreenState();
//   }
// }

import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryItem(cat, ValueKey(cat.id));
        }).toList(),
      ),
    );
  }
}
