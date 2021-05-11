import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Date.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantActiveOrderTile.dart';
import 'package:flutter/material.dart';

class RestaurantActiveOrderTile extends StatefulWidget {
  List _foods;
  List _numberOfFood;
  Date _orderDate;
  String _orderStatus;
  int _sumPrice;
  bool _onlinePayment;

  /*orderStatus enum shavad va dafe aval rooye dar hal amade sazi bashad*/
  String _clientPhoneNumber;
  String _clientAddress;
  String _clientName;
  String _clientLastName;
  String _id;
  static Function function;

  RestaurantActiveOrderTile(
      this._foods,
      this._numberOfFood,
      this._orderDate,
      this._clientPhoneNumber,
      this._clientAddress,
      this._clientName,
      this._clientLastName,
      this._onlinePayment);

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

  int get sumPrice => _sumPrice;

  set sumPrice(int value) {
    _sumPrice = value;
  }

  bool get onlinePayment => _onlinePayment;

  set onlinePayment(bool value) {
    _onlinePayment = value;
  }

  @override
  _RestaurantActiveOrderTileState createState() =>
      _RestaurantActiveOrderTileState();
}

class _RestaurantActiveOrderTileState extends State<RestaurantActiveOrderTile> {
  List panelItems = ["active", "unActive", "finished"];

  void refreshPage() {
    setState(() {});
  }

  int sumPriceCalculator() {
    int sum = 0;
    for (int i = 0; i < widget.foods.length; i++) {
      sum += widget.foods[i].price * widget.numberOfFood[i];
    }
    return sum;
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
                      onPressed: () {
                        Accounts.accounts[Accounts.currentAccount]
                            .inactiveOrder(widget.id);
                        RestaurantActiveOrderTile.function();
                        Navigator.pop(context);
                        // if (flag) {
                        //   Navigator.pop(context);
                        // }
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
        DetailsRestaurantActiveOrderTile.clientLastName = widget.clientLastName;
        DetailsRestaurantActiveOrderTile.clientAddress = widget.clientAddress;
        DetailsRestaurantActiveOrderTile.clientPhoneNumber =
            widget.clientPhoneNumber;
        DetailsRestaurantActiveOrderTile.foods = widget.foods;
        DetailsRestaurantActiveOrderTile.numberOfFood = widget.numberOfFood;
        DetailsRestaurantActiveOrderTile.id = widget.id;
        DetailsRestaurantActiveOrderTile.orderDate = widget.orderDate;
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
        height: 200,
        child: Card(
          child: ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.clientName + "  " + widget.clientLastName),
                  Text(widget.clientPhoneNumber),
                ]),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(widget.id),
                  ],
                ),
                Column(
                  children: [
                    Text(widget.orderDate.dateFormatter()),
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton(
                        hint: Text("Order Status"),
                        dropdownColor: Colors.grey,
                        icon: Icon(Icons.arrow_drop_down),
                        value: widget._orderStatus,
                        onChanged: (newValue) {
                          setState(() {
                            widget._orderStatus = newValue;
                            if (widget.orderStatus == 'finished') {
                              return finishedOrder();
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
