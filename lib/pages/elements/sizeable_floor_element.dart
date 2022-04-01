import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeableFloorElement extends StatelessWidget{

  final String text;
  final double value;
  final VoidCallback callback;
  final VoidCallback longPressCallback;
  Color color;

  SizeableFloorElement({Key? key, required this.text, required this.value, required this.callback, required this.longPressCallback,
    this.color = const Color(0xFFCFFAFF)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      onLongPress: longPressCallback,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        child: SizedBox(
          height: 50,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text + value.toString() + "мм", style: const TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}