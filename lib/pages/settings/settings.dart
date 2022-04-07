import 'package:block_house_calculator/pages/objects/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:block_house_calculator/pages/elements/double_input_field.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void refresh () { setState(() {});}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Настройки"),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Настройки'),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            const Text("Стандартное значение: 6000"),
            IntegerInputField(labelText: "Ширина лагов", callback: (value) {
          setState((){Constants.lagWidth = value;});
        }, hintText: Constants.lagWidth.toString()),
            const Text("Стандартное значение: 25"),
            IntegerInputField(labelText: "Ширина профиля", callback: (value) {
              setState((){Constants.plankWidth = value;});
            }, hintText: Constants.plankWidth.toString()),
            const Text("Стандартное значение: 100"),
            IntegerInputField(labelText: "Высота профиля", callback: (value) {
              setState((){Constants.plankHeight = value;});
            }, hintText: Constants.plankHeight.toString()),


                  ],
                ),

    );
  }
}