import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  String str;
  String label;
  String hint;

  MyTextFormField(this.label, {this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color.fromRGBO(248, 95, 106, 1),
      onSaved: (String value) {
        this.str = value;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(248, 95, 106, 1)),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(209, 214, 219, 1),
        ),
      ),
    );
  }
}
