import 'package:chfrestaurant/Classes/Date.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantInactiveOrderTile extends StatelessWidget {
  List<Food> _foods;
  Date _orderDate;
  String _orderStatus = 'Finished';
  String _clientPhoneNumber;
  String _clientAddress;
  String _clientName;
  String _clientLastName;
  String _id;

  // Restaurant _destinationRestaurant;

  RestaurantInactiveOrderTile(
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

  String get orderStatus => _orderStatus;

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
  Widget build(BuildContext context) {
    return Container();
  }
}
