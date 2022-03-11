import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:block_house_calculator/pages/objects/house.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AbcDialog {
  static Future inputDialog(BuildContext context, House house) async {
    String teamName = 'SewerIT';
    return showDialog(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Изменить название'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                    autofocus: true,
                    decoration: new InputDecoration(labelText: 'Название дома', hintText: house.name),
                    onChanged: (value) {
                      house.name = value;
                    },
                  ))
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Подтвердить'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void buildConfirmDialog(BuildContext context, String title, String subtitle,
      String textButton, String textButton1 , VoidCallback callback) {
    showDialog(
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
                          child: Text(title,
                              style: const TextStyle(
                                  fontSize: 18.0, color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                          child: Text(subtitle,
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                          child: GeneralButton(
                              text: textButton,
                              callback: () {
                                callback();
                                Navigator.pop(context);
                              },
                              longPressCallback: () {},
                          color: Colors.green),
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                        child: GeneralButton(
                            text: textButton1,
                            callback: () {
                              Navigator.pop(context);
                            },
                            longPressCallback: () {},
                        color: Colors.red),
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}