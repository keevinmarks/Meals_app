import 'package:flutter/material.dart';
import 'package:meals_app/components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  Function(Settings) onSettingsChanged;
  final Settings settings;

  SettingsScreen(this.settings, this.onSettingsChanged);
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings = Settings();
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
      activeColor: Colors.green,
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações")),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Configurações",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  "Sem Glutém",
                  "Só exbibe refeições sem glutém",
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  "Sem Lactose",
                  "Só exibe refeições sem lactose",
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  "Veganas",
                  "Só exibe refeições são veganas",
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  "Vegetariana",
                  "Só exibe refeições são vegetarianas",
                  settings.isVegantarian,
                  (value) => setState(() => settings.isVegantarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
