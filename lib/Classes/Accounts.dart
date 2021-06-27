import 'dart:io';

import 'package:chfrestaurant/Classes/Request.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/main.dart';

class Accounts {
  static List<Restaurant> _accounts = List.empty(growable: true);
  static int _currentAccount = 0;

  static bool key = false;

  //edit

  static List<Restaurant> get accounts => _accounts;

  static set accounts(List<Restaurant> value) {
    _accounts = value;
  }

  static int get currentAccount => _currentAccount;

  static set currentAccount(int value) {
    _currentAccount = value;
  }

  static Restaurant addAccount(String name, String phoneNumber, String password,
      String open, String close, String restaurantType) {
    if (!key) {
      Request.writerListener('RestaurantSignUp-' +
          name +
          '-' +
          phoneNumber +
          '-' +
          password +
          '-' +
          open +
          '-' +
          close +
          '-' +
          restaurantType.substring(restaurantType.indexOf('.') + 1));
    }
    Restaurant restaurant;
    if (key) {
      RestaurantTypes restaurantTypes;
      if (RestaurantTypes.FastFood.toString() == restaurantType) {
        restaurantTypes = RestaurantTypes.FastFood;
      } else if (RestaurantTypes.Cafe.toString() == restaurantType) {
        restaurantTypes = RestaurantTypes.Cafe;
      } else if (RestaurantTypes.IranianRestaurant.toString() ==
          restaurantType) {
        restaurantTypes = RestaurantTypes.IranianRestaurant;
      } else {
        restaurantTypes = RestaurantTypes.Other;
      }
      restaurant =
          Restaurant(name, phoneNumber, password, open, close, restaurantTypes);
      _accounts.add(restaurant);
    }
    print("A: " + accounts.toString());
    return restaurant;
  }

  static int getLength() {
    return _accounts.length;
  }

  static bool foundPhoneNumber(String input) {
    for (int i = 0; i < getLength(); i++) {
      if (accounts[i].phoneNumber == input) {
        currentAccount = i;
        return false;
      }
    }
    return true;
  }

  static bool validPhoneNumber(String input) {
    RegExp regPhoneNumber = new RegExp(r'^09[0|1|2|3][0-9]{8}$',
        caseSensitive: false, multiLine: false);
    if (input.length != 11 || !regPhoneNumber.hasMatch(input)) {
      return true;
    }
    return false;
  }

  // static bool alreadyPhoneNumber(String input) {
  // for (int i = 0; i < getLength(); i++) {
  //   if (accounts[i].phoneNumber == input) {
  //     return true;
  //   }
  // }
  // return false;
  // }

  static bool editAlreadyPhoneNumber(String input, String oldPhoneNumber) {
    if (oldPhoneNumber == input) {
      return false;
    }
    for (int i = 0; i < getLength(); i++) {
      if (accounts[i].phoneNumber == input) {
        return true;
      }
    }
    accounts[currentAccount].phoneNumber = input;
    return false;
  }

  // static bool foundPassword(String input) {
  // if (accounts[currentAccount].password == input) {
  //   return false;
  // }
  // currentAccount = null;
  // return true;
  // }

  static bool validEmail(String input) {
    RegExp regEmail = new RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
        multiLine: false, caseSensitive: false);
    if (!regEmail.hasMatch(input)) {
      return true;
    }
    return false;
  }

  static String digester(String str, int capacity) {
    if (str.length < capacity) {
      return str;
    }
    return str.substring(0, capacity - 3) + '...';
  }

  static bool validPassword(
    String input,
    /*{bool confirmPassword = false}*/
  ) {
    RegExp regPassword =
        new RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$", multiLine: false);
    // if (regPassword.hasMatch(input) && confirmPassword) {
    //   MyTextFormField.password = input;
    // }
    return !(regPassword.hasMatch(input));
  }

  static bool oldPassword(String input) {
    return !(accounts[currentAccount].password == input);
  }

  static bool confirmPassword(String input) {
    bool flag = MyTextFormField.password == input;
    if (flag) {
      accounts[currentAccount].password = input;
    }
    return !flag;
  }

  static bool validOpenClose(String open, String close) {
    int sumOfOpen =
        int.parse(open.substring(0, 2)) * 60 + int.parse(open.substring(3));
    int sumOfClose =
        int.parse(close.substring(0, 2)) * 60 + int.parse(close.substring(3));
    return sumOfClose > sumOfOpen;
  }
}
