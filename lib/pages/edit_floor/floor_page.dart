import 'dart:developer';

import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/elements/sizeable_floor_element.dart';
import 'package:block_house_calculator/pages/objects/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloorPage extends StatefulWidget {
  final Floor floor;

  FloorPage({Key? key, required this.floor}) : super(key: key);

  @override
  State<FloorPage> createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage> {
  late Floor floor;

  @override
  void initState() {
    floor = widget.floor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.floor.getName()),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  children: [
                    Text("Стены"),
                    ...floor.walls
                        .asMap()
                        .map((index, e) => MapEntry(
                            index,
                            SizeableFloorElement(
                              index: index,
                              text: "Длина",
                              value: e,
                              color: const Color(0xFFE5FBFF),
                              callback: (value) {
                                setState( () {
                                  floor.walls[index] = value;
                                  e = value;
                                });
                              },
                              deleteCallback: () {
                                log('$index ${floor.walls[index]}', name: 'deleteCallback');
                                setState(
                                  () {
                                    floor.walls.removeAt(index);
                                  },
                                );
                              },
                            )))
                        .values,
                    GeneralButton(
                      text: "Добавить Стену",
                      callback: () {
                        // log('test');
                        // log('${floor.walls}');
                        setState(() {
                          floor.addWall(3);
                        });
                      },
                      longPressCallback: () {},
                    ),
                  ],
                ),
              ),
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
                    Text("Двери"),
                    ...floor.doors.map((e) => SizeableFloorElement(
                          index: floor.doors.length,
                          text: "Ширина",
                          value: e,
                          color: const Color(0xFFE5FBFF),
                          callback: (value) {},
                          deleteCallback: (value) {},
                        )),
                    GeneralButton(
                      text: "Добавить Дверь",
                      callback: () {},
                      longPressCallback: () {},
                    ),
                  ],
                ),
              ),
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
                    Text("Окна"),
                    ...floor.windows.map((e) => SizeableFloorElement(
                          index: floor.windows.length,
                          text: "Ширина",
                          value: e,
                          color: const Color(0xFFE5FBFF),
                          callback: (value) {},
                          deleteCallback: (value) {},
                        )),
                    GeneralButton(
                      text: "Добавить Окно",
                      callback: () {},
                      longPressCallback: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
