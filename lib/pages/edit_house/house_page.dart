import 'package:block_house_calculator/pages/edit_floor/floor_page.dart';
import 'package:block_house_calculator/pages/edit_roof/roof_page.dart';
import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/elements/dialog.dart';
import 'package:block_house_calculator/pages/objects/house.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HousePage extends StatefulWidget {
  House house;
  final Function() notifyParent;

  HousePage({Key? key, required this.house, required this.notifyParent}) : super(key: key);

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  bool floorBlock = true;

  late House house;


  @override
  void initState() {
    house = widget.house;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.house.name),
        leading:  IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [IconButton(
          icon: const Icon(Icons.edit_outlined),
          onPressed: () async {
            var newValue = await AbcDialog.inputDialog(context, widget.house, "Изменить название");
            setState(() {
              house.name = newValue;
            });
            widget.notifyParent();
          },
        ),],
      ),
      body:  ListView(
        children: [
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
                         "Да","Нет", () {
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
            text: "Настроить крышу",
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RoofPage()),
              );
            },
            longPressCallback: () {},
          ),
          Expanded(
              child: TextField(
                autofocus: false,
                keyboardType:  const TextInputType.numberWithOptions(signed: true, decimal: true),
                decoration: InputDecoration(labelText: 'Длина дома', hintText: house.houseLength.toString()),
                onSubmitted: (value) {
                  house.houseLength = value as double;
                },
              )),
          Expanded(
              child: TextField(
                autofocus: false,
                keyboardType:  const TextInputType.numberWithOptions(signed: true, decimal: true),
                decoration: InputDecoration(labelText: 'Ширина дома', hintText: house.houseWidth.toString()),
                onSubmitted: (value) {
                  house.houseWidth = value as double;
                },
              )),
          Expanded(
              child: TextField(
                autofocus: false,
                keyboardType:  const TextInputType.numberWithOptions(signed: true, decimal: true),
                decoration: InputDecoration(labelText: 'Высота этажей', hintText: house.floorHeight.toString()),
                onSubmitted: (value) {
                  house.floorHeight = value as double;
                },
              )),
          Expanded(
              child: TextField(
                autofocus: false,
                keyboardType:  const TextInputType.numberWithOptions(signed: true, decimal: true),
                decoration: InputDecoration(labelText: 'Высота дверных проемов', hintText: house.doorHeight.toString()),
                onSubmitted: (value) {
                  house.doorHeight = value as double;
                },
              )),
          Expanded(
              child: TextField(
                autofocus: false,
                keyboardType:  const TextInputType.numberWithOptions(signed: true, decimal: true),
                decoration: InputDecoration(labelText: 'Высота оконных проемов', hintText: house.windowHeight.toString()),
                onSubmitted: (value) {
                  house.windowHeight = value as double;
                },
              )),
          Expanded(
              child: TextField(
                autofocus: false,
                keyboardType:  const TextInputType.numberWithOptions(signed: true, decimal: true),
                decoration: InputDecoration(labelText: 'Высота оплётки', hintText: house.opletkaHeight.toString()),
                onSubmitted: (value) {
                  house.opletkaHeight = value as double;
                },
              )),
        ]
      ),
    );
  }
}