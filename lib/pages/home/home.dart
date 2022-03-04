import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          GeneralButton(text: "Добавить дом"),
          GeneralButton(text: "Список домов"),
          GeneralButton(text: "Пример")
        ],
      )

    );
  }
  
  
  
}