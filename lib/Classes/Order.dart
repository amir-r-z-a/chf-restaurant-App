import 'package:chfrestaurant/Common/Common%20Classes/Date.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';

class Order {
  List _foods;
  List _numberOfFoods;
  Date _orderDate;
  bool _orderStatus;
  String _clientPhoneNumber;
  String _clientAddress;
  String _clientName;
  String _clientLastName;
  String _id;
  double _sumPrice;
  int _sumNumberOfFoods;
  bool _onlinePayment;

  Order(
      this._foods,
      this._numberOfFoods,
      this._orderDate,
      this._clientPhoneNumber,
      this._clientAddress,
      this._clientName,
      this._clientLastName,
      this._id,
      this._sumPrice,
      this._onlinePayment,
      this._sumNumberOfFoods);

  List get foods => _foods;

  set foods(List value) {
    _foods = value;
  }

  // Restaurant _destinationRestaurant;

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

  String get clientLastName => _clientLastName;

  set clientLastName(String value) {
    _clientLastName = value;
  }

  String get clientName => _clientName;

  set clientName(String value) {
    _clientName = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }


  List get numberOfFoods => _numberOfFoods;

  set numberOfFoods(List value) {
    _numberOfFoods = value;
  }

  double get sumPrice => _sumPrice;

  set sumPrice(double value) {
    _sumPrice = value;
  }

  bool get onlinePayment => _onlinePayment;

  set onlinePayment(bool value) {
    _onlinePayment = value;
  }

  int get sumNumberOfFoods => _sumNumberOfFoods;

  set sumNumberOfFoods(int value) {
    _sumNumberOfFoods = value;
  }
}
