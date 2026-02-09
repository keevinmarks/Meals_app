import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> meals;
  FavoriteScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty ? Center(child: Text("Nenhuma refeição marcada como favorita"),) : ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(meal: meals[index]);
      },
    );
  }
}
