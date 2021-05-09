import 'package:chfrestaurant/Classes/Date.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantActiveOrderTile extends StatefulWidget {
  List<Food> _foods;
  Date _orderDate;
  bool _orderStatus;

  /*orderStatus enum shavad va dafe aval rooye dar hal amade sazi bashad*/
  String _clientPhoneNumber;
  String _clientAddress;
  String _clientName;
  String _clientLastName;
  String _id;

  // Restaurant _destinationRestaurant;

  RestaurantActiveOrderTile(
      this._foods,
      this._orderDate,
      this._clientPhoneNumber,
      this._clientAddress,
      this._clientName,
      this._clientLastName,
      this._id);

  List<Food> get foods => _foods;

  set foods(List<Food> value) {
    _foods = value;
  }

  // Restaurant get destinationRestaurant => _destinationRestaurant;
  //
  // set destinationRestaurant(Restaurant value) {
  //   _destinationRestaurant = value;
  // }

  Date get orderDate => _orderDate;

  set orderDate(Date value) {
    _orderDate = value;
  }

  bool get orderStatus => _orderStatus;

  set orderStatus(bool value) {
    _orderStatus = value;
  }

  String get clientPhoneNumber => _clientPhoneNumber;

  set clientPhoneNumber(String value) {
    _clientPhoneNumber = value;
  }

  String get clientAddress => _clientAddress;

  set clientAddress(String value) {
    _clientAddress = value;
  }

  String get clientName => _clientName;

  set clientName(String value) {
    _clientName = value;
  }

  String get clientLastName => _clientLastName;

  set clientLastName(String value) {
    _clientLastName = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  @override
  _RestaurantActiveOrderTileState createState() =>
      _RestaurantActiveOrderTileState();
}

class _RestaurantActiveOrderTileState extends State<RestaurantActiveOrderTile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
