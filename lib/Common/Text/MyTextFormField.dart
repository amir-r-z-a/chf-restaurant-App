import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  static String name;
  static String password;
  static String phoneNumber;
  static String address;
  String label;
  String hint;
  String valid;
  int index;

  MyTextFormField(this.index, this.label, {this.hint, this.valid});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: ,
      cursorColor: Color.fromRGBO(248, 95, 106, 1),
      onSaved: (String value) {
        if (index == 1) {
          name = value;
        } else if (index == 2) {
          password = value;
        } else if (index == 3) {
          phoneNumber = value;
        } else {
          address = value;
        }
      },
      validator: (String value) {
        if (valid == null && (value == null || value.isEmpty)) {
          return "Please enter something";
        } else if (false /*value != valid*/) {
          return "Your enter is incorrect";
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Color.fromRGBO(248, 95, 106, 1)),
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
