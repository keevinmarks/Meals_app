import 'package:flutter/material.dart';
import 'package:meals_app/utils/app_routers.dart';

class MainDrawer extends StatelessWidget {
  Widget _createitem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //width: 200,
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              "Vamos cozinhar",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          _createitem(Icons.restaurant, "Refeições", () => Navigator.of(context).pushReplacementNamed(AppRouters.HOME)),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
            height: 0,
          ),
          _createitem(Icons.settings, "Configurações", () => Navigator.of(context).pushReplacementNamed(AppRouters.SETTINGS))
        ],
      ),
    );
  }
}
