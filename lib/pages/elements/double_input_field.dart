import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntegerInputField extends StatefulWidget {

  final String labelText;
  final String hintText;
  final Function callback;



  const IntegerInputField({Key? key, required this.labelText, required this.callback, required this.hintText})
      : super(key: key);

  @override
  State<IntegerInputField> createState() => _IntegerInputFieldState();
}

class _IntegerInputFieldState extends State<IntegerInputField> {
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return           TextField(
      autofocus: false,
      keyboardType:  const TextInputType.numberWithOptions(signed: true, decimal: false),
      decoration: InputDecoration(
          labelText: widget.labelText + ": " + widget.hintText + "мм",
          hintText: widget.hintText,
       errorText: errorText == '' ? null : errorText),

      onChanged: (value) {
          int? intValue = int.tryParse(value);
          if (intValue != null) {
            widget.callback(intValue);
            setState(() {
              errorText = "";
            });}
        else
       {
            setState(() {
              errorText = "Неправильное значение";
            });
          }
      },
    );
  }
}