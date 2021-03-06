import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntegerInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Function callback;
  String unit;

  IntegerInputField(
      {Key? key,
      required this.labelText,
      required this.callback,
      required this.hintText,
      this.unit = "мм"})
      : super(key: key);

  @override
  State<IntegerInputField> createState() => _IntegerInputFieldState();
}

class _IntegerInputFieldState extends State<IntegerInputField> {
  final TextEditingController _controller = TextEditingController();
  String errorText = '';

  void clear() => _controller.clear();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSubmit(String value) {
    int? intValue = int.tryParse(value);
    if (intValue != null) {
      widget.callback(intValue);
      setState(() {
        errorText = "";
      });
    } else {
      setState(() {
        errorText = "Неправильное значение";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
      child: TextField(
        controller: _controller,
        autofocus: false,
        // focusNode: _focusNode,

        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: false),
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), gapPadding: 5),
            labelText: widget.labelText + ": " + widget.hintText + widget.unit,
            hintText: widget.hintText,
            errorText: errorText == '' ? null : errorText),

        onChanged: (value) {
          onSubmit(value);
        },
        onSubmitted: (value) {
          onSubmit(value);
          _controller.clear();
        },
      ),
    );
  }
}
