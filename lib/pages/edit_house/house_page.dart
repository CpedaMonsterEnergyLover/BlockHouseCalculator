import 'package:block_house_calculator/pages/edit_floor/floor_page.dart';
import 'package:block_house_calculator/pages/edit_roof/roof_page.dart';
import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/elements/dialog.dart';
import 'package:block_house_calculator/pages/objects/house.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HousePage extends StatefulWidget {
  House house;

  HousePage({Key? key, required this.house}) : super(key: key);

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  bool floorBlock = true;

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
          Text(widget.house.name),
          const Text("Всего этажей: 0"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Colors.black12
                ),
              ),
              child: Column(
                children: [
                  ...widget.house.floors.map((e) => GeneralButton(text: e.getName(),
                    callback: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FloorPage(floor: e)),
                      )
                    },
                   longPressCallback: () {
                     AbcDialog.buildConfirmDialog(
                         context, "Удаление этажа", "Вы уверены что хотите удалить этаж?",
                         "Да", () {
                          setState(() {

                            widget.house.removeFloor(e.index);
                          });
                     });
                   }))
                  //  },))
                ],
              ),
            ),
          ),
          GeneralButton(
            text: "Добавить этаж",
            callback: () {
              if(!floorBlock) return;
              setState(() {
                floorBlock = widget.house.addFloor();
              });
            },
            longPressCallback: () {},
          ),
          GeneralButton(
            text: "Настроить крышу",
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RoofPage()),
              );
            },
            longPressCallback: () {},
          ),
        ]
      ),
    );
  }
}