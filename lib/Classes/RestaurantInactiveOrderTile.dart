import 'package:chfrestaurant/Common/Common%20Classes/Date.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantActiveOrderTile.dart';
import 'package:flutter/material.dart';

class RestaurantInactiveOrderTile extends StatelessWidget {
  List _foods;
  List _numberOfFoods;
  Date _orderDate;
  String _orderStatus = 'Finished';
  String _clientPhoneNumber;
  String _clientAddress;
  String _clientName;

  // String _clientLastName;
  String _id;
  double _sumPrice;
  int _sumNumberOfFoods;
  bool _onlinePayment;

  // Restaurant _destinationRestaurant;

  RestaurantInactiveOrderTile(
      this._foods,
      this._numberOfFoods,
      this._orderDate,
      this._clientPhoneNumber,
      this._clientAddress,
      this._clientName,
      // this._clientLastName,
      this._id,
      this._sumPrice,
      this._onlinePayment,
      this._sumNumberOfFoods);

  List get foods => _foods;

  set foods(List value) {
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

  // String get clientLastName => _clientLastName;
  //
  // set clientLastName(String value) {
  //   _clientLastName = value;
  // }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  List get numberOfFoods => _numberOfFoods;

  set numberOfFoods(List value) {
    _numberOfFoods = value;
  }

  bool get onlinePayment => _onlinePayment;

  set onlinePayment(bool value) {
    _onlinePayment = value;
  }

  double get sumPrice => _sumPrice;

  set sumPrice(double value) {
    _sumPrice = value;
  }

  int get sumNumberOfFoods => _sumNumberOfFoods;

  set sumNumberOfFoods(int value) {
    _sumNumberOfFoods = value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DetailsRestaurantActiveOrderTile.clientName = clientName;
        // DetailsRestaurantActiveOrderTile.clientLastName = clientLastName;
        DetailsRestaurantActiveOrderTile.clientAddress = clientAddress;
        DetailsRestaurantActiveOrderTile.clientPhoneNumber = clientPhoneNumber;
        DetailsRestaurantActiveOrderTile.foods = foods;
        DetailsRestaurantActiveOrderTile.numberOfFoods = numberOfFoods;
        DetailsRestaurantActiveOrderTile.id = id;
        DetailsRestaurantActiveOrderTile.orderDate = orderDate;
        DetailsRestaurantActiveOrderTile.sumPrice = sumPrice;
        DetailsRestaurantActiveOrderTile.sumNumberOfFoods = sumNumberOfFoods;
        Navigator.pushNamed(context, '/DetailsRestaurantActiveOrderTiles');
      },
      child: SizedBox(
        height: 200,
        child: Card(
          child: ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(clientName /* + "  " + clientLastName*/),
                  Text(clientPhoneNumber),
                ]),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(id),
                  ],
                ),
                Column(
                  children: [
                    Text(orderDate.dateFormatter()),
                    Container(
                        margin: EdgeInsets.only(top: 70),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(orderStatus))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
