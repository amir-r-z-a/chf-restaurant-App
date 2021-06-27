import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Date.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantActiveOrderTile.dart';
import 'package:chfrestaurant/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantActiveOrderTile extends StatefulWidget {
  List _foods;
  List _numberOfFoods;
  Date _orderDate;
  String _orderStatus;
  double _sumPrice;
  int _sumNumberOfFoods;
  bool _onlinePayment;

  /*orderStatus enum shavad va dafe aval rooye dar hal amade sazi bashad*/
  String _clientPhoneNumber;
  String _clientAddress;
  String _clientName;

  // String _clientLastName;
  String _id;
  static Function function;

  RestaurantActiveOrderTile(
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
    this._sumNumberOfFoods,
  );

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

  String get orderStatus => _orderStatus;

  set orderStatus(String value) {
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

  @override
  _RestaurantActiveOrderTileState createState() =>
      _RestaurantActiveOrderTileState();
}

class _RestaurantActiveOrderTileState extends State<RestaurantActiveOrderTile> {
  List panelItems = ["In progress", "Delivery", "Finished"];

  void refreshPage() {
    setState(() {});
  }

  void finishedOrder() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Finished Order'),
          content: Container(
            height: 100,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(1)),
                    Text('Are you sure to finished this Order?'),
                  ],
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        Accounts.accounts[Accounts.currentAccount]
                            .inactiveOrder(widget.id);
                        String listen = '';
                        await Socket.connect(MyApp.ip, 2442)
                            .then((serverSocket) {
                          print('connected writer');
                          String write =
                              'RestaurantOrders-RestaurantFinishedOrders-' +
                                  MyApp.id +
                                  '-' +
                                  widget.id;
                          write = (write.length + 11).toString() +
                              ',Restaurant-' +
                              write;
                          serverSocket.write(write);
                          serverSocket.flush();
                          print('write: ' + write);
                          print('connected listen');
                          serverSocket.listen((socket) {
                            listen = String.fromCharCodes(socket)
                                .trim()
                                .substring(2);
                          }).onDone(() {
                            print("listen: " + listen);
                            RestaurantActiveOrderTile.function();
                            Navigator.pop(context);
                          });
                          // serverSocket.close();
                        });
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DetailsRestaurantActiveOrderTile.clientName = widget.clientName;
        // DetailsRestaurantActiveOrderTile.clientLastName = widget.clientLastName;
        DetailsRestaurantActiveOrderTile.clientAddress = widget.clientAddress;
        DetailsRestaurantActiveOrderTile.clientPhoneNumber =
            widget.clientPhoneNumber;
        DetailsRestaurantActiveOrderTile.foods = widget.foods;
        DetailsRestaurantActiveOrderTile.numberOfFoods = widget.numberOfFoods;
        DetailsRestaurantActiveOrderTile.id = widget.id;
        DetailsRestaurantActiveOrderTile.orderDate = widget.orderDate;
        DetailsRestaurantActiveOrderTile.sumPrice = widget.sumPrice;
        DetailsRestaurantActiveOrderTile.sumNumberOfFoods =
            widget.sumNumberOfFoods;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsRestaurantActiveOrderTile(
              function: refreshPage,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            margin: EdgeInsets.all(12),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,120,15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget
                                              .clientName /* +
                                              "  " +
                                              widget.clientLastName*/
                                          ,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.calendar_today),
                                        Text(' ' +
                                            widget.orderDate
                                                .dateFormatter()
                                                .substring(
                                                    0,
                                                    widget.orderDate
                                                        .dateFormatter()
                                                        .indexOf(','))),
                                        Icon(Icons.watch_later_outlined),
                                        Text(widget.orderDate
                                            .dateFormatter()
                                            .substring(widget.orderDate
                                                    .dateFormatter()
                                                    .indexOf(',') +
                                                1)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on),
                                        Text(widget.clientAddress),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 0),
                            padding: EdgeInsets.all(5),
                            child: DropdownButton(
                              hint: Text("Order Status"),
                              dropdownColor: Colors.grey,
                              icon: Icon(Icons.arrow_drop_down),
                              value: widget._orderStatus,
                              onChanged: (newValue) {
                                setState(() {
                                  String lastOrderStatus = widget.orderStatus;
                                  widget._orderStatus = newValue;
                                  if (widget.orderStatus == 'Finished') {
                                    finishedOrder();
                                    widget.orderStatus = lastOrderStatus;
                                  }
                                });
                              },
                              items: panelItems.map((valueitem) {
                                return DropdownMenuItem(
                                  value: valueitem,
                                  child: Text(valueitem),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
