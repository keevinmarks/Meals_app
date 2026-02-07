import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'screens/categories_screen.dart';
import './utils/app_routers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromARGB(255, 42, 153, 201),
        primarySwatch: Colors.blue,
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed"),
        ),
      ),
      routes: {AppRouters.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
      AppRouters.HOME: (ctx) => CategoriesScreen()},
    );
  }
}
