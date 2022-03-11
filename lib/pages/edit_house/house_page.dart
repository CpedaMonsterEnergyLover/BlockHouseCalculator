import 'package:block_house_calculator/pages/edit_floor/floor_page.dart';
import 'package:block_house_calculator/pages/edit_roof/roof_page.dart';
import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/objects/house.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HousePage extends StatelessWidget {
  House house;

  HousePage({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройка дома"),
        leading:  IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  ListView(
        children: [
          const Text("Название дома"),
          const Text("Всего этажей: 0"),
          const Text("Тут будет список этажей"),
          GeneralButton(
            text: "Добавить этаж",
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FloorPage()),
              );
            },
          ),
          GeneralButton(
            text: "Настроить крышу",
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RoofPage()),
              );
            },
          ),
        ]
      ),
    );
  }

}