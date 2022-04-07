import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'double_input_field.dart';

class SizeableFloorElement extends StatelessWidget {
  final String text;
  final int value;
  final Function callback;
  Function deleteCallback;
  Color color;
  final int index;

  SizeableFloorElement(
      {Key? key,
      required this.index,
      required this.text,
      required this.value,
      required this.callback,
      this.color = const Color(0xFFCFFAFF),
      required this.deleteCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: IntegerInputField(
                  callback: callback,
                  hintText: value.toString(),
                  labelText: text),
            )),
            IconButton(
                onPressed: () {
                  deleteCallback();
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
