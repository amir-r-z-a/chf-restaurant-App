import 'package:chfrestaurant/Classes/Date.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantOrderTile.dart';
import 'package:flutter/material.dart';

class RestaurantActiveOrderTile extends StatefulWidget {
  Map _foods;
  Date _orderDate;
  String _orderStatus;

  /*orderStatus enum shavad va dafe aval rooye dar hal amade sazi bashad*/
  String _clientPhoneNumber;
  String _clientAddress;
  String _clientName;
  String _clientLastName;
  String _id;

  Map get foods => _foods;

  set foods(Map value) {
    _foods = value;
  }

  // Restaurant _destinationRestaurant;

  RestaurantActiveOrderTile(
      this._foods,
      this._orderDate,
      this._clientPhoneNumber,
      this._clientAddress,
      this._clientName,
      this._clientLastName,
      this._id);

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

  @override
  _RestaurantActiveOrderTileState createState() =>
      _RestaurantActiveOrderTileState();
}

class _RestaurantActiveOrderTileState extends State<RestaurantActiveOrderTile> {
  List panelItems = ["active", "unActive", "finished"];
  void refreshPage (){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            DetailsRestaurantOrderTile.clientName = widget.clientName ;
            DetailsRestaurantOrderTile.clientLastName = widget.clientLastName;
            DetailsRestaurantOrderTile.clientAddress = widget.clientAddress;
            DetailsRestaurantOrderTile.clientPhoneNumber = widget.clientPhoneNumber;
            DetailsRestaurantOrderTile.foods = widget.foods;
            DetailsRestaurantOrderTile.id = widget.id;
            DetailsRestaurantOrderTile.orderDate= widget.orderDate;
            DetailsRestaurantOrderTile.orderDate= widget.orderDate;
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                DetailsRestaurantOrderTile(function : refreshPage)
            ));
          },
          child: SizedBox(
            height: 200,
            child: Card(
              child: ListTile(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.clientName+ "  "+ widget.clientLastName),
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
                              hint: Text("Order Status "),
                              dropdownColor: Colors.grey,
                              icon: Icon(Icons.arrow_drop_down),
                              value: widget._orderStatus,
                              onChanged: (newValue) {
                                setState(() {
                                  widget._orderStatus = newValue;
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
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
