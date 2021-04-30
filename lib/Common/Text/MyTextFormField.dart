import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  static String name;
  static String password;
  static String phoneNumber;
  static String address;
  static RestaurantTypes type;

  String label;
  String hint;
  String regex;
  int index;

  MyTextFormField(this.label, {this.index, this.hint, this.regex});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color.fromRGBO(248, 95, 106, 1),
      onSaved: (String value) {
        if (index == 1) {
          name = value;
        } else if (index == 2) {
          phoneNumber = value;
        } else
        /*if(index==3)*/ {
          address = value;
        }
        //else print(no)
      },
      validator: (String value) {
        // print(value);
        // print(Accounts.foundPhoneNumber(value));
        if (value == null || value.isEmpty) {
          return "Please enter something";
        } else if (regex == 'PNSignIn' && Accounts.foundPhoneNumber(value)) {
          return "Your phone number is not found";
        } else if (regex == 'PNSignUp') {
          if (Accounts.validPhoneNumber(value)) {
            return 'Your phone number is not valid';
          } else if (Accounts.alreadyPhoneNumber(value)) {
            return 'Your phone number is already registered';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Color.fromRGBO(248, 95, 106, 1),
        ),
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
