import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoubleInputField extends StatelessWidget {

  final String labelText;
  final String hintText;
  final Function callback;

  const DoubleInputField({Key? key, required this.labelText, required this.callback, required this.hintText})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return           TextField(
      autofocus: false,
      keyboardType:  const TextInputType.numberWithOptions(signed: true, decimal: true),
      decoration: InputDecoration(labelText: labelText + ": " + hintText, hintText: hintText),
      onSubmitted: (value) {
        callback(value);
      },
    );
  }



}