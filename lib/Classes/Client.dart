import 'dart:html';

import 'package:chfrestaurant/Classes/ClientComment.dart';
import 'package:chfrestaurant/Classes/Order.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';

class Client {
  String _nam;
  String _lastName;
  String _phoneNumber;
  Location _location;
  String _password;
  String _email;
  List<Order> _clientOrders;
  List<Restaurant> _favRestaurants;
  List<ClientComment> _clientComments;
  double _wallet;

  String get nam => _nam;

  set nam(String value) {
    _nam = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  Location get location => _location;

  set location(Location value) {
    _location = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  List<Order> get clientOrders => _clientOrders;

  set clientOrders(List<Order> value) {
    _clientOrders = value;
  }

  List<Restaurant> get favRestaurant => _favRestaurants;

  set favRestaurant(List<Restaurant> value) {
    _favRestaurants = value;
  }

  List<ClientComment> get clientComments => _clientComments;

  set clientComments(List<ClientComment> value) {
    _clientComments = value;
  }

  double get wallet => _wallet;

  set wallet(double value) {
    _wallet = value;
  }
}
