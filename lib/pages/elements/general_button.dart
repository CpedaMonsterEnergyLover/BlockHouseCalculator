import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget{

  final String text;
  final VoidCallback callback;

  const GeneralButton({Key? key, required this.text, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      child: SizedBox(
        height: 30,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
            ],
          ),
        ),
      ),
    );
  }

}