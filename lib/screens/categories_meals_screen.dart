import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_item.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  CategoriesMealsScreen(this.meals);

  Widget build(BuildContext context) {
    //Recebendo a categoria através dos argumentos
    final Category category =
        ModalRoute.of(context)?.settings.arguments as Category;

    //Filtrando as refeições que contém essa categoria
    List<Meal> mealsOfThisCategory = meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title), centerTitle: true),
      body: ListView.builder(
        //scrollDirection: Axis.horizontal,

        //Agora é possível percorrer a lista que só contém as refeições dessa categoria
        itemCount: mealsOfThisCategory.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: mealsOfThisCategory[index]);
        },
      ),
    );
  }
}
