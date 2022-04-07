import 'package:block_house_calculator/pages/objects/wall.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'double_input_field.dart';

class FloorElementWall extends StatelessWidget {
  final String text;
  final Wall wall;
  final Function callback;
  Function deleteCallback;
  Color color;
  final int index;

  FloorElementWall(
      {Key? key,
      required this.index,
      required this.text,
      required this.wall,
      required this.callback,
      this.color = const Color(0xFFCFFAFF),
      required this.deleteCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var integerInputField = IntegerInputField(
        callback: callback,
        hintText: wall.length.toString(),
        labelText: text);



    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child:integerInputField)),
            IconButton(
                onPressed: () {
                  deleteCallback();
                  // integerInputField.clear();
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
