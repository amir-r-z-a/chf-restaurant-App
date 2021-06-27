import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Request.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Screens/RestaurantSignUpScreen.dart';
import 'package:flutter/material.dart';

// class MyTextFormField extends StatelessWidget {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }

class MyTextFormField extends StatefulWidget {
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
  static double radiusOfWork;

  static String open;
  static String close;

  static bool flags;

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
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  // Future<String> listener(String write) async {
  //   // Request.writer('RestaurantSignUp-alreadyPhoneNumber-' + value);
  //   String listen = "";
  //   await Socket.connect('192.168.1.7', 2442).then((serverSocket) {
  //     print('connected writer');
  //     write = (write.length + 11).toString() + ',Restaurant-' + write;
  //     serverSocket.write(write);
  //     serverSocket.flush();
  //     print('write: ' + write);
  //     print('connected listen');
  //     serverSocket.listen((socket) {
  //       listen = String.fromCharCodes(socket).trim().substring(2);
  //       print("listen: " + listen);
  //       return listen;
  //       // e = listen == 'invalid';
  //       // print('e: ' + e.toString());
  //       //  socket.close();
  //     });
  //     // serverSocket.close();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onFieldSubmitted: (value) {
      //   if (index == 10) {
      //
      //   }
      // },
      initialValue: widget.initial,
      cursorColor: Color.fromRGBO(248, 95, 106, 1),
      onSaved: (String value) {
        if (widget.index == 1) {
          widget.addToAccounts
              ? Accounts.accounts[Accounts.currentAccount].name = value
              : MyTextFormField.name = value;
        } else if (widget.index == 2) {
          widget.addToAccounts
              ? Accounts.accounts[Accounts.currentAccount].phoneNumber = value
              : MyTextFormField.phoneNumber = value;
        } else if (widget.index == 3) {
          widget.addToAccounts
              ? Accounts.accounts[Accounts.currentAccount].address = value
              : MyTextFormField.address = value;
        } else if (widget.index == 4) {
          MyTextFormField.foodCategory = value;
        } else if (widget.index == 5) {
          MyTextFormField.foodName = value;
        } else if (widget.index == 6) {
          MyTextFormField.foodPrice = value;
        } else if (widget.index == 7) {
          MyTextFormField.foodDesc = value;
        } else if (widget.index == 8) {
          widget.addToAccounts
              ? Accounts.accounts[Accounts.currentAccount].email = value
              : MyTextFormField.email = value;
        } else if (widget.index == 9) {
          MyTextFormField.reply = value;
        } else if (widget.index == 10) {
          MyTextFormField.radiusOfWork = double.parse(value);
        }
      },
      validator: (String value) {
        // print(value);
        if ((widget.index != 7 && widget.index != 8 && widget.index != 9) &&
            (value == null || value.isEmpty)) {
          return "Please enter something"; /*"You must fill this box"*/
        }
        /*else if (widget.regex == 'PNSignIn' &&
            Accounts.foundPhoneNumber(value)) {
          return "Your phone number is not found";
        } else*/
        if (widget.regex == 'PNSignUp') {
          if (Accounts.validPhoneNumber(value)) {
            return 'Your phone number is not valid';
          }
          /*else if (Accounts.alreadyPhoneNumber(value)) {
            return 'Your phone number is already registered';
          }*/
        } else if (widget.regex == 'PNEdit') {
          if (Accounts.validPhoneNumber(value)) {
            return 'Your phone number is not valid';
          } else if (Accounts.editAlreadyPhoneNumber(value, widget.initial)) {
            return 'Your phone number is already registered';
          }
        } else if (widget.regex == 'Category' &&
            Accounts.accounts[Accounts.currentAccount].validCategory(value)) {
          return 'Your category could not be All';
        } else if (widget.regex == 'Price' && Restaurant.validPrice(value)) {
          return 'Your price is not valid';
        } else if (widget.regex == 'FoodName' &&
            Accounts.accounts[Accounts.currentAccount].validFood(value)) {
          return 'Your food was already added in one of category';
        } else if (widget.regex == 'Email' &&
            value != '' &&
            value != null &&
            Accounts.validEmail(value)) {
          return 'Your email is not valid';
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Color.fromRGBO(248, 95, 106, 1),
        ),
        labelText: widget.label,
        labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(248, 95, 106, 1)),
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(209, 214, 219, 1),
        ),
      ),
    );
  }
}
