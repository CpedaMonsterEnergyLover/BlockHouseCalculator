import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/objects/house.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AbcDialog {
  static Future<String> inputDialog(
      BuildContext context, House house, String title) async {
    String newName = house.name;
    newName = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Название дома', hintText: house.name),
                onChanged: (value) {
                  newName = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Подтвердить'),
              onPressed: () {
                Navigator.of(context).pop(newName);
              },
            ),
          ],
        );
      },
    );
    return newName;
  }

  static void buildConfirmDialog(
      BuildContext context,
      String title,
      String subtitle,
      String textButton,
      String textButton1,
      VoidCallback callback) {
    showDialog(
        useSafeArea: false,
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                          color: Colors.white,
                          child: Text(title,
                              style: const TextStyle(
                                  fontSize: 18.0, color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                          color: Colors.white,
                          child: Text(subtitle,
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Material(
                        color: Colors.white,
                        child: GeneralButton(
                            text: textButton,
                            callback: () {
                              callback();
                              Navigator.pop(context);
                            },
                            longPressCallback: () {},
                            color: Colors.green.shade400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Material(
                        color: Colors.white,
                        child: GeneralButton(
                            text: textButton1,
                            callback: () {
                              Navigator.pop(context);
                            },
                            longPressCallback: () {},
                            color: Colors.red.shade400),
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
