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

  HousePage({Key? key, required this.house, required this.notifyParent})
      : super(key: key);

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  bool floorBlock = true;
  double kubometriDosok = 0;
  late House house;

  @override
  void initState() {
    house = widget.house;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.house.name),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              var newValue = await AbcDialog.inputDialog(
                  context, widget.house, "Изменить название");
              setState(() {
                house.name = newValue;
              });
              widget.notifyParent();
            },
          ),
        ],
      ),
      body: ListView(children: [
        GeneralButton(
          text: "Добавить этаж",
          callback: () {
            if (!floorBlock) return;
            setState(() {
              floorBlock = widget.house.addFloor(widget.house.settings);
            });
          },
          longPressCallback: () {},
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              children: [
                ...widget.house.floors.map((e) => GeneralButton(
                    text: e.getName(),
                    callback: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FloorPage(floor: e)),
                          )
                        },
                    longPressCallback: () {
                      AbcDialog.buildConfirmDialog(
                          context,
                          "Удаление этажа",
                          "Вы уверены что хотите удалить этаж?",
                          "Да",
                          "Нет", () {
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              children: [
                GeneralButton(
                  text: "Рассчитать",
                  callback: () {
                    setState(() {
                      kubometriDosok = widget.house.calculate();
                    });
                  },
                  longPressCallback: () {},
                ),
                Text("Всего вам нужно " +
                    kubometriDosok.toString() +
                    " кубометров досок"),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              IntegerInputField(
                labelText: 'Длина дома',
                hintText: widget.house.settings.houseLength.toString(),
                callback: (value) {
                  setState(() {
                    widget.house.settings.houseLength = value;
                  });
                },
              ),
              IntegerInputField(
                labelText: 'Ширина дома',
                hintText: widget.house.settings.houseWidth.toString(),
                callback: (value) {
                  setState(() {
                    widget.house.settings.houseWidth = value;
                  });
                },
              ),
              IntegerInputField(
                labelText: 'Высота этажей',
                hintText: widget.house.settings.floorHeight.toString(),
                callback: (value) {
                  setState(() {
                    widget.house.settings.floorHeight = value;
                  });
                },
              ),
              IntegerInputField(
                labelText: 'Высота дверных проемов',
                hintText: widget.house.settings.doorHeight.toString(),
                callback: (value) {
                  setState(() {
                    widget.house.settings.doorHeight = value;
                  });
                },
              ),
              IntegerInputField(
                labelText: 'Высота оконных проемов',
                hintText: widget.house.settings.windowHeight.toString(),
                callback: (value) {
                  setState(() {
                    widget.house.settings.windowHeight = value;
                  });
                },
              ),
              IntegerInputField(
                labelText: 'Высота оплётки',
                hintText: widget.house.settings.opletkaHeight.toString(),
                callback: (value) {
                  setState(() {
                    widget.house.settings.opletkaHeight = value;
                  });
                },
              )
            ],
          ),
        ),
      ]),
    );
  }
}
