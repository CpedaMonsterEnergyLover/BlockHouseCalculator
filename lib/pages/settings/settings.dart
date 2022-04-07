import 'package:block_house_calculator/pages/edit_house/house_page.dart';
import 'package:block_house_calculator/pages/elements/dialog.dart';
import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/objects/constants.dart';
import 'package:block_house_calculator/pages/objects/house.dart';
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
            IntegerInputField(labelText: "Ширина лагов", callback: (value) {
          setState((){Constants.lagWidth = int.parse(value);});
        }, hintText: Constants.lagWidth.toString()),
            IntegerInputField(labelText: "Ширина доски", callback: (value) {
              setState((){Constants.plankWidth = int.parse(value);});
            }, hintText: Constants.plankWidth.toString()),
            IntegerInputField(labelText: "Высота доски", callback: (value) {
              setState((){Constants.plankHeight = int.parse(value);});
            }, hintText: Constants.plankHeight.toString()),


                  ],
                ),

    );
  }
}