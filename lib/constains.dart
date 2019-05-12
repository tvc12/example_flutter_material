import 'package:flutter/material.dart';

final borderInput = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: BorderSide(color: Colors.blue),
);

final enabledBorderInput = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.blue),
);

final errorBorderInput = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.red),
);

final textFieldColor = Colors.white54;

InputDecoration getInputDecoration(String text, IconData icon, bool valiate) {
  return InputDecoration(
    filled: true,
    labelText: text,
    fillColor: textFieldColor,
    border: borderInput,
    enabledBorder: enabledBorderInput,
    errorBorder: errorBorderInput,
    suffixIcon: Icon(icon), 
    counterText: '',
    errorText: valiate ? null : ''
  );
}
