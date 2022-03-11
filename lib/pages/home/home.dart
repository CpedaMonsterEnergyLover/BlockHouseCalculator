import 'package:block_house_calculator/pages/edit_house/house_page.dart';
import 'package:block_house_calculator/pages/elements/dialog.dart';
import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/objects/house.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<House> houses = List.empty(growable: true);

  void refresh () { setState(() {});}

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
              child: Text('Настройки'),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Center(child: Text("Список домов")),
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
                  ...houses.map((e) => GeneralButton(text: e.name, callback: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HousePage(house: e, notifyParent: refresh)),
                  )
                  },
                    longPressCallback: () {
                      AbcDialog.buildConfirmDialog(
                          context, "Удаление дома", "Вы уверены что хотите удалить дом?",
                          "Да", "Нет", () {
                        setState(() {
                          houses.removeAt(houses.indexOf(e));
                        });
                      });
                    },))
                ],

              ),
            ),
          ),

          GeneralButton(
            text: "Добавить дом",
            callback: () {
            House house = House();
            setState(() {
              houses.add(house);
            });
          },
            longPressCallback: () {},),

          GeneralButton(
            text: "Пример",
            callback: () {  },
            longPressCallback: () {},)
        ],
      )

    );
  }
}