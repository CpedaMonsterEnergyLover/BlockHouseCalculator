
import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/objects/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloorPage extends StatelessWidget {
  final Floor floor;

  FloorPage({Key? key, required this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(floor.getName()),
          leading:  IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
            Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(width: 300, height:300,
                child: Container(
                color: const Color.fromARGB(1, 213, 213, 213),
                child: const Text("я гей"),
                ),
              ),
            GeneralButton(
              text: "Добавить Стену", callback: () {

              },
              longPressCallback: () {},
            ),
            GeneralButton(
              text: "Добавить Дверь",
              callback: () {

              },
              longPressCallback: () {},
            ),
            GeneralButton(
              text: "Добавить Окно",
              callback: () {

              },
              longPressCallback: () {},
            ),
          ],
        ),
    );

  }

}