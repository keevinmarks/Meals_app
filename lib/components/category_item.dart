import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import '../utils/app_routers.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category, Key key) : super(key: key);

  void _selectedCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoriesMealsScreen();
    //     },
    //   ),
    // );

    //Navegando para a tela onde mostra as refeições dessa categoria, passando a categoria como argumento
    Navigator.of(
      context,
    ).pushNamed(AppRouters.CATEGORIES_MEALS, arguments: category);
  }

  Widget build(BuildContext context) {
    //InkWell: Widget clicável
    return InkWell(
      onTap: () {
        _selectedCategory(context);
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.5), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
