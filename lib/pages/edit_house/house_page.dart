import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HousePage extends StatelessWidget {
  const HousePage({Key? key}) : super(key: key);

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
      body: const Text("Написать страницу"),
    );
  }

}