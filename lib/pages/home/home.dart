import 'package:block_house_calculator/pages/edit_house/house_page.dart';
import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/objects/House.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<House> houses = [House(), House(), House()];

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
          ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: houses.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Дом "),
                      ],
                    )
                );
              }
          ),
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