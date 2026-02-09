import 'package:flutter/material.dart';
import 'package:meals_app/models/settings.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/settings_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import './utils/app_routers.dart';
import './data/dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availabMeals = DUMMY_MEALS;
  Settings settings = Settings();
  List<Meal> _favoritesMeals = [];
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availabMeals = DUMMY_MEALS.where((meal) {
        bool gluten = !meal.isGlutenFree && settings.isGlutenFree;
        bool lactose = !meal.isLactoseFree && settings.isLactoseFree;
        bool vegan = !meal.isVegan && settings.isVegan;
        bool vegetarian = !meal.isVegetarian && settings.isVegantarian;

        return !gluten && !lactose && !vegan && !vegetarian;
      }).toList();
    });
  }

  void _toggleFavoriteMeal(Meal meal) {
    //print(meal.title);
    setState(() {
      _favoritesMeals.contains(meal)
          ? _favoritesMeals.remove(meal)
          : _favoritesMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoritesMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amber.shade50,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.amber.shade100),
        canvasColor: const Color.fromARGB(255, 42, 153, 201),
        primarySwatch: Colors.blue,
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed"),
          titleMedium: TextStyle(
            fontSize: 18,
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //Primeira a tentativa vai ser pelo routers
      routes: {
        AppRouters.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availabMeals),
        AppRouters.HOME: (ctx) => TabsScreen(_favoritesMeals),
        AppRouters.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavoriteMeal, _isFavorite),
        AppRouters.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      //Se não for encontrado a rota no routers, ele vai entrar no onGenerateRoute, que gera a rota de forma dinãmica
      // onGenerateRoute: (settings) {
      //   if (settings.name == "/alguma-coise") {
      //     return null;
      //   } else if (settings.name == "/outra-coisa") {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(builder: (_) => CategoriesScreen());
      //   }
      // },
      //Ou então ele vai entrar no onUnknowRoute
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}
