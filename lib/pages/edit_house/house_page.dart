import 'package:block_house_calculator/pages/edit_floor/floor_page.dart';
import 'package:block_house_calculator/pages/edit_roof/roof_page.dart';
import 'package:block_house_calculator/pages/elements/double_input_field.dart';
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
          IntegerInputField(
            labelText: 'Длина дома',
            hintText: widget.house.houseLength.toString(),
            callback: (value) {
              setState((){widget.house.houseLength = int.parse(value);});
            },
          ),
          IntegerInputField(
            labelText: 'Ширина дома',
            hintText: widget.house.houseWidth.toString(),
            callback: (value) {
              setState((){widget.house.houseWidth = int.parse(value);});
            },
          ),
          IntegerInputField(
            labelText: 'Высота этажей',
            hintText: widget.house.floorHeight.toString(),
            callback: (value) {
              setState((){widget.house.floorHeight = int.parse(value);});
            },
          ),
          IntegerInputField(
            labelText: 'Высота дверных проемов',
            hintText: widget.house.doorHeight.toString(),
            callback: (value) {
              setState((){widget.house.doorHeight = int.parse(value);});
            },
          ),
          IntegerInputField(
            labelText: 'Высота оконных проемов',
            hintText: widget.house.windowHeight.toString(),
            callback: (value) {
              setState((){widget.house.windowHeight = int.parse(value);});
            },
          ),
          IntegerInputField(
            labelText: 'Высота оплётки',
            hintText: widget.house.opletkaHeight.toString(),
            callback: (value) {
              setState((){widget.house.opletkaHeight = int.parse(value);});
            },
          )
        ]
      ),
    );
  }
}