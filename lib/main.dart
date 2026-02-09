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

  //Função que faz a filtragem com base nos filtros
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availabMeals = DUMMY_MEALS.where((meal) {
        bool gluten = !meal.isGlutenFree && settings.isGlutenFree;
        bool lactose = !meal.isLactoseFree && settings.isLactoseFree;
        bool vegan = !meal.isVegan && settings.isVegan;
        bool vegetarian = !meal.isVegetarian && settings.isVegantarian;

        //Se a refeição passou em todos em filtros então retorna true
        return !gluten && !lactose && !vegan && !vegetarian;
      }).toList();
    });
  }

  //Função para adicionar ou remover uma refeição da lista de favoritos 
  void _toggleFavoriteMeal(Meal meal) {
    //print(meal.title);
    setState(() {
      _favoritesMeals.contains(meal)
          ? _favoritesMeals.remove(meal)
          : _favoritesMeals.add(meal);
    });
  }

  //Verificando se uma refeição está contida na lista de refeições favoritas
  bool _isFavorite(Meal meal) {
    return _favoritesMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Titulo do aplicativo:
      title: 'DeliMeals',

      //Definindo temas para serem usados no aplicativo:
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
      //Mostrando as telas por meio de rotas e não mais pelo home
      //Primeira a tentativa vai ser pelo routers, onde vai entrar primeiro em HOME, que está como /
      routes: {
        AppRouters.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availabMeals),
        
        //Passando as refeições favoritas para a tela de TabScreen, para pode ela passar para a tela de refeições favoritas
        AppRouters.HOME: (ctx) => TabsScreen(_favoritesMeals),

        //Rota de detalhe da refeição: passando a função de adicionar ou remover refeição da lista de favoritos e a função de verificar se uma refeição está contida na lista de favoritos
        AppRouters.MEAL_DETAIL: (ctx) =>
            MealDetailScreen(_toggleFavoriteMeal, _isFavorite),
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
