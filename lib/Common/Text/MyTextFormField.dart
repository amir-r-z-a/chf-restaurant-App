import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  static String name;
  static String password;
  static String phoneNumber;
  static String address;
  static RestaurantTypes type;
  static String email;

  static String foodCategory;
  static String foodName;
  static String foodDesc;
  static String foodPrice;

  static String reply;

  String label;
  String hint;
  String regex;
  int index;
  String initial;
  bool addToAccounts;

  MyTextFormField(this.label,
      {this.index,
      this.hint,
      this.regex,
      this.initial,
      this.addToAccounts = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initial,
      cursorColor: Color.fromRGBO(248, 95, 106, 1),
      onSaved: (String value) {
        if (index == 1) {
          addToAccounts
              ? Accounts.accounts[Accounts.currentAccount].name = value
              : name = value;
        } else if (index == 2) {
          addToAccounts
              ? Accounts.accounts[Accounts.currentAccount].phoneNumber = value
              : phoneNumber = value;
        } else if (index == 3) {
          addToAccounts
              ? Accounts.accounts[Accounts.currentAccount].address = value
              : address = value;
        } else if (index == 4) {
          foodCategory = value;
        } else if (index == 5) {
          foodName = value;
        } else if (index == 6) {
          foodPrice = value;
        } else if (index == 7) {
          addToAccounts
              ? Accounts.accounts[Accounts.currentAccount].email = value
              : email = value;
        } else if (index == 8) {
          reply = value;
        }
      },
      validator: (String value) {
        // print(value);
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
        } else if (regex == 'Category' &&
            Accounts.accounts[Accounts.currentAccount].validCategory(value)) {
          return 'Your category could not be All';
        } else if (regex == 'Price' && Restaurant.validPrice(value)) {
          return 'Your price is not valid';
        } else if (regex == 'FoodName' &&
            Accounts.accounts[Accounts.currentAccount].validFood(value)) {
          return 'Your food was already added in one of category';
        } else if (regex == 'Email' && Accounts.validEmail(value)) {
          return 'Your email is not valid';
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
