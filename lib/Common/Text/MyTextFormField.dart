import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  static String name;
  static String password;
  static String phoneNumber;
  static String address;
  String label;
  String hint;
  String regex;
  int indexAccount;
  int index;

  MyTextFormField(this.label, {this.index, this.hint, this.regex});

  bool foundName(String input) {
    for (int i = 0; i < Accounts.getLength(); i++) {
      if (Accounts.accounts[i].name == input) {
        indexAccount = i;
        return false;
      }
    }
    return true;
  }

  bool foundPassword(String input) {
    for (int i = 0; i < Accounts.getLength(); i++) {
      if (Accounts.accounts[i].password == input) {
        return false;
      }
    }
    return true;
  }

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
        print(value);
        print(foundName(value));
        if (value == null || value.isEmpty) {
          return "Please enter something";
        } else if (regex == 'N' && foundName(value)) {
          return "Your name is not found";
        } else if (regex == 'P' && foundPassword(value)) {
          return "Your password is not correct";
        } else if (false /*regex != null*/) {
          return "Your enter is not correct";
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
