import 'package:chfrestaurant/Classes/Date.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantActiveOrderTile.dart';
import 'package:flutter/material.dart';

class RestaurantInactiveOrderTile extends StatelessWidget {
  List _foods;
  List _numberOfFood;
  Date _orderDate;
  String _orderStatus = 'Finished';
  String _clientPhoneNumber;
  String _clientAddress;
  String _clientName;
  String _clientLastName;
  String _id;
  int sumPrice;

  // Restaurant _destinationRestaurant;

  RestaurantInactiveOrderTile(
      this._foods,
      this._numberOfFood,
      this._orderDate,
      this._clientPhoneNumber,
      this._clientAddress,
      this._clientName,
      this._clientLastName,
      this._id,
      this.sumPrice);

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

  String get clientLastName => _clientLastName;

  set clientLastName(String value) {
    _clientLastName = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  List get numberOfFood => _numberOfFood;

  set numberOfFood(List value) {
    _numberOfFood = value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DetailsRestaurantActiveOrderTile.clientName = clientName;
        DetailsRestaurantActiveOrderTile.clientLastName = clientLastName;
        DetailsRestaurantActiveOrderTile.clientAddress = clientAddress;
        DetailsRestaurantActiveOrderTile.clientPhoneNumber = clientPhoneNumber;
        DetailsRestaurantActiveOrderTile.foods = foods;
        DetailsRestaurantActiveOrderTile.numberOfFood = numberOfFood;
        DetailsRestaurantActiveOrderTile.id = id;
        DetailsRestaurantActiveOrderTile.orderDate = orderDate;
        Navigator.pushNamed(context, '/DetailsRestaurantActiveOrderTiles');
      },
      child: SizedBox(
        height: 200,
        child: Card(
          child: ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(clientName + "  " + clientLastName),
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
