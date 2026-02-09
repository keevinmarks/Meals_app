import 'package:flutter/material.dart';
import 'package:meals_app/components/main_drawer.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  //Definindo um Map com String e object para melhor utilização das informações:
  List<Map<String, Object>> _screen = [];

  //Altera o valor de _selectedScreenIndex, passando o novo index com base no botão clicado
  void _selectedSreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    //Setando os valores inicias com o initState
    setState(() {
      _screen = [
        {"title": "Lista de categorias", "screen": CategoriesScreen()},
        {
          "title": "Lista de favoritos",
          //Passando as refeições favoritas para a tela FavoriteScreen
          "screen": FavoriteScreen(widget.favoriteMeals),
        },
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   //Index da página que vai ser aberta quando o app for aberto, nesse caso a página de categorias
    //   initialIndex: 0,
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Vamos cozinhar"),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(icon: Icon(Icons.category), text: "Categorias"),
    //           Tab(icon: Icon(Icons.favorite), text: "Favoritos"),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(children: [CategoriesScreen(), FavoriteScreen()]),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_screen[_selectedScreenIndex]["title"] as String),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedSreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,

        //Define em qual tab está atualmente, no caso, no mesmo index da página
        currentIndex: _selectedScreenIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categorias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favoritos",
          ),
        ],
      ),
      //Definindo qual página deverar mostrar agora com base no _selectedScreenIndex, o cast deve ser feito porque no Map o Widget está como Object
      body: _screen[_selectedScreenIndex]["screen"] as Widget,
    );
  }
}
