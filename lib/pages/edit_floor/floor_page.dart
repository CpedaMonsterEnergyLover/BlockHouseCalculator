
import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloorPage extends StatelessWidget {
  const FloorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Настройка этажа"),
          leading:  IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
            Navigator.pop(context);
            },
          ),
        ),
        body: ListView( children :[
          Container(child: const SizedBox(width: 300, height:300,
              child: Align(alignment : Alignment.center,
                  child: Text('Здесь будет рисовалка надеюсь мы ее сможем сделать', style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
              )
          ),
              decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          GeneralButton(
            text: "Добавить Стену", callback: () {

            },
          ),
          GeneralButton(
            text: "Добавить Дверь",
            callback: () {

            },
          ),
          GeneralButton(
            text: "Добавить Окно",
            callback: () {

            },
          ),]
    ),
    );

  }

}