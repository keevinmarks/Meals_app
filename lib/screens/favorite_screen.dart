import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  //Recebendo as refeições favoritas via construtor
  List<Meal> meals;
  FavoriteScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty ? Center(child: Text("Nenhuma refeição marcada como favorita"),) : ListView.builder(
      itemCount: meals.length,
      //Utilizando o ListView.builder para percorrer a lista de refeições favoritas se ela existir
      itemBuilder: (ctx, index) {
        return MealItem(meal: meals[index]);
      },
    );
  }
}
