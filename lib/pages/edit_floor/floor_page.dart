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
  double kubometriDosok = 0;

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
            GeneralButton(
              text: "Рассчитать",
              callback: () {
                setState((){
                  kubometriDosok = widget.floor.calculate();
                });
              },
              longPressCallback: () {},
            ),
            Text("Всего вам нужно " + kubometriDosok.toString() + " кубометров досок на этот этаж"),
            // Стены
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
                            FloorElementWall(
                              key: ValueKey(e),
                              index: index,
                              text: "Длина",
                              wall: e,
                              color: const Color(0xFFE5FBFF),
                              callback: (value) {
                                setState( () {
                                  e.length = value;
                                  // value = e;
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
            // Двери
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
                    ...floor.doors
                        .asMap()
                        .map((index, e) => MapEntry(
                        index,
                        FloorElementWall(
                          key: ValueKey(e),
                          index: index,
                          text: "Ширина проема",
                          wall: e,
                          color: const Color(0xFFE5FBFF),
                          callback: (value) {
                            setState( () {
                              e.length = value;
                              // value = e;
                            });
                          },
                          deleteCallback: () {
                            log('$index ${floor.doors[index]}', name: 'deleteCallback');

                            setState(
                                  () {
                                floor.doors.removeAt(index);
                              },
                            );
                          },
                        )))
                        .values,
                    GeneralButton(
                      text: "Добавить двееерь",
                      callback: () {
                        setState(() {
                          floor.addDoor(3);
                        });
                      },
                      longPressCallback: () {},
                    ),
                  ],
                ),
              ),
            ),
            //Окна
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
                    ...floor.windows
                        .asMap()
                        .map((index, e) => MapEntry(
                        index,
                        FloorElementWall(
                          key: ValueKey(e),
                          index: index,
                          text: "Ширина",
                          wall: e,
                          color: const Color(0xFFE5FBFF),
                          callback: (value) {
                            setState( () {
                              e.length = value;
                              // value = e;
                            });
                          },
                          deleteCallback: () {
                            log('$index ${floor.windows[index]}', name: 'deleteCallback');

                            setState(
                                  () {
                                floor.windows.removeAt(index);
                              },
                            );
                          },
                        )))
                        .values,
                    GeneralButton(
                      text: "Добавить окно",
                      callback: () {
                        setState(() {
                          floor.addWindow(3);
                        });
                      },
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
