import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(title: Text(category.title), centerTitle: true),
      body: Center(child: Text("Receitas por Categoria")),
    );
  }
}
