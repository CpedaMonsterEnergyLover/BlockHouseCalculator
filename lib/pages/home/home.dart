import 'package:block_house_calculator/pages/edit_house/house_page.dart';
import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BlockHouseCalculator"),
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
          const Center(child: Text("Тут будет список домов")),
          GeneralButton(
            text: "Добавить дом",
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HousePage()),
              );
            },
          ),
          GeneralButton(
            text: "Пример",
            callback: () {  },)
        ],
      )

    );
  }
  
  
  
}