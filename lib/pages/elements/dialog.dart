import 'package:block_house_calculator/pages/elements/general_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AbcDialog {
  static void buildConfirmDialog(BuildContext context, String title, String subtitle,
      String textButton, VoidCallback callback) {
    showDialog(
        context: context,
        builder: (context) {
          return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
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
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                          child: Text(subtitle,
                              style: TextStyle(
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
                              longPressCallback: () {} )),
                    ),
                  ],
                ),
              ));
        });
  }
}