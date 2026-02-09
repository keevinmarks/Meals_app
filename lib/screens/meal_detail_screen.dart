import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal meal) selectedFavorite;
  final bool Function(Meal meal) isFavoriteMeal;

  MealDetailScreen(this.selectedFavorite, this.isFavoriteMeal);

  //Função para criar um widget de título personalizado
  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  //Função para criar um Widget Container personalizado, onde vai conter um ListView
  Widget _createSectionContainer(BuildContext context, ListView child) {
    return Container(
      height: 300,
      width: 350,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Container da imagem da refeição
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            //Utilizando o container criado anteriomente para exibir o título dessa parte:
            _createSectionTitle(context, "Ingredientes"),

            //Utilizando o container criado anteriomente para exibir o ListView dos ingredientes
            _createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  // return Text(meal.ingredients[index], style: Theme.of(context).textTheme.titleMedium,);
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            //Aqui é feito a mesmo coisa de anteriomente, so que personalizado para o passo a passo
            _createSectionTitle(context, "Passos"),
            _createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text("${index + 1}")),
                        title: Text(meal.steps[index]),
                      ),
                      //Colocar uma listra para dividir os item
                      Divider(
                        height: 5,
                        color: Colors.grey.shade600,
                        thickness: 0.5,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Mudando o formato do Icon de acordo com o retorno da função que verifica se essa refeição está contida nos favoritos la no main.dart
        child: Icon(isFavoriteMeal(meal) ? Icons.star : Icons.star_border),
        //.pop() deleta essa tela da pilha e volta para anterior, no seus parâmetros é possível mandar um Objeto
        onPressed: () {
          //Navigator.of(context).pop(meal);
          //Chamando a função que adiciona ou remove uma refeição dos favoritos lá do main.dart
          selectedFavorite(meal);
        },
      ),
    );
  }
}
