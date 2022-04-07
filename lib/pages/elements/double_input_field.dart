import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntegerInputField extends StatelessWidget {

  final String labelText;
  final String hintText;
  final Function callback;

  const IntegerInputField({Key? key, required this.labelText, required this.callback, required this.hintText})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return           TextField(
      autofocus: false,
      keyboardType:  const TextInputType.numberWithOptions(signed: false, decimal: true),
      decoration: InputDecoration(labelText: labelText + ": " + hintText + "мм", hintText: hintText),
      onSubmitted: (value) {
        callback(value);
      },
    );
  }



}