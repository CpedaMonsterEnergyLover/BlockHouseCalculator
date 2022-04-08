import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoofPage extends StatelessWidget {
  const RoofPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройка крыши"),
        leading: IconButton(
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
