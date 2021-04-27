// import 'dart:html';

import 'package:chfrestaurant/Classes/ClientComment.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Order.dart';
// import 'package:flutter/cupertino.dart';

class Restaurant {
  String _name;
  String _phoneNumber;
  String _password;
  String _address;
  String _type;
  List<Food> _foods;
  double _workingRadius = 10;
  double _point;
  List<Order> _orderHistory;
  List<ClientComment> _restaurantComments;

  Restaurant(
      this._name, this._phoneNumber, this._password, this._address, this._type);

  // Image _profileImage;

  // Location _location;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  List<Food> get foods => _foods;

  set foods(List<Food> value) {
    _foods = value;
  }

  double get workingRadius => _workingRadius;

  set workingRadius(double value) {
    _workingRadius = value;
  }

// Image get profileImage => _profileImage;
//
// set profileImage(Image value) {
//   _profileImage = value;
// }
//
// Location get location => _location;
//
// set location(Location value) {
//   _location = value;
// }

  double get point => _point;

  set point(double value) {
    _point = value;
  }

  List<Order> get orderHistory => _orderHistory;

  set orderHistory(List<Order> value) {
    _orderHistory = value;
  }

  List<ClientComment> get restaurantComments => _restaurantComments;

  set restaurantComments(List<ClientComment> value) {
    _restaurantComments = value;
  }
}
