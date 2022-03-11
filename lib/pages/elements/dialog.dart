import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialog {
  void buildConfirmDialog(BuildContext context, String title, String subtitle,
      String textButton) {
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
                          child: Text(textButton,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.green))),
                    ),
                  ],
                ),
              ));
        });
  }
}