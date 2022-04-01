
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

  @override
  Widget build(BuildContext context) {
    widget.floor.walls = [1, 2, 3];

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.floor.getName()),
          leading:  IconButton(
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
                    border: Border.all(
                        color: Colors.black12
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("Стены"),
                      ...widget.floor.walls.map((e) => SizeableFloorElement(
                          text: "Длина: ",
                          value: e,
                          callback: () => {

                          },
                          longPressCallback: () {},
                          color: const Color(0xFFE5FBFF)
                      )),
                      GeneralButton(
                        text: "Добавить Стену", callback: () {

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
                    border: Border.all(
                        color: Colors.black12
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("Двери"),
                      ...widget.floor.doors.map((e) => SizeableFloorElement(
                          text: "Ширина: ",
                          value: e,
                          callback: () => {

                          },
                          longPressCallback: () {},
                          color: const Color(0xFFE5FBFF)
                      )),
                      GeneralButton(
                        text: "Добавить Дверь",
                        callback: () {

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
                    border: Border.all(
                        color: Colors.black12
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("Окна"),
                      ...widget.floor.windows.map((e) => SizeableFloorElement(
                          text: "Ширина: ",
                          value: e,
                          callback: () => {

                          },
                          longPressCallback: () {

                          },
                          color: const Color(0xFFE5FBFF))),
                      GeneralButton(
                        text: "Добавить Окно",
                        callback: () {

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