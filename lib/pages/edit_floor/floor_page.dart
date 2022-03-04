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
        body: const Text("Написать страницу"),
    );
  }

}