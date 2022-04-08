import 'package:block_house_calculator/pages/about_page/about_page.dart';
import 'package:block_house_calculator/pages/edit_house/house_page.dart';
import 'package:block_house_calculator/pages/elements/dialog.dart';
import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/objects/house.dart';
import 'package:block_house_calculator/pages/settings/settings.dart';
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

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BlockHouseCalculator"),
        ),
        endDrawer: Drawer(
          child: Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/planks.jpg"),
                          fit: BoxFit.cover)),
                  child: SizedBox(width: 1, height: 1),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                  child: const Text("Настройки"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutPage()));
                  },
                  child: const Text("О приложении"),
                ),
              ],
            ),
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
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  children: [
                    ...houses.map((e) => GeneralButton(
                          text: e.name,
                          callback: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HousePage(
                                      house: e, notifyParent: refresh)),
                            )
                          },
                          longPressCallback: () {
                            AbcDialog.buildConfirmDialog(
                                context,
                                "Удаление дома",
                                "Вы уверены что хотите удалить дом?",
                                "Да",
                                "Нет", () {
                              setState(() {
                                houses.removeAt(houses.indexOf(e));
                              });
                            });
                          },
                        ))
                  ],
                ),
              ),
            ),
            GeneralButton(
              text: "Добавить дом",
              callback: () async {
                House house = House();
                var newValue = await AbcDialog.inputDialog(
                    context, house, "Название дома");
                setState(() {
                  house.name = newValue;
                  houses.add(house);
                });
              },
              longPressCallback: () {},
            ),
            GeneralButton(
              text: "Пример",
              callback: () {},
              longPressCallback: () {},
            )
          ],
        ));
  }
}
