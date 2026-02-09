import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/utils/app_routers.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem({required this.meal});

  void _selectedMeal(BuildContext context) {
    //O .then desse pushNamed é chamado qaundo a tela para qual ele enviou é excluida, ou seja quando é feito o pop nela
    Navigator.of(context).pushNamed(AppRouters.MEAL_DETAIL, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      //Permite quebra de linha
                      softWrap: true,

                      //Transaforma o texto que passa em transparente
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(meal.complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(meal.costText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
