import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantFoodTile.dart';
import 'package:chfrestaurant/main.dart';
import 'package:flutter/material.dart';

class RestaurantFoodTile extends StatefulWidget {
  String _name;
  String _category;
  String _price;
  String desc;
  bool _foodStatus;
  Image _foodImage;
  int orderCount;
  static Function function;
  static Function topTenFoods;

  RestaurantFoodTile(this._name, this._price, this._foodStatus, this._category,
      {this.desc, this.orderCount = 0});

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  bool get foodStatus => _foodStatus;

  set foodStatus(bool value) {
    _foodStatus = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  Image get foodImage => _foodImage;

  set foodImage(Image value) {
    _foodImage = value;
  }

  @override
  _RestaurantFoodTileState createState() => _RestaurantFoodTileState();
}

class _RestaurantFoodTileState extends State<RestaurantFoodTile> {
  void refreshPage() {
    setState(() {
      widget.name = DetailsRestaurantFoodTile.name;
      widget.desc = DetailsRestaurantFoodTile.desc;
      widget.price = DetailsRestaurantFoodTile.price;
      widget.foodStatus = DetailsRestaurantFoodTile.foodStatus;
    });
  }

  void deleteFunc(bool flag) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Food'),
          content: Container(
            height: 120,
            child: Column(children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child: Text('Are you sure to delete ' +
                        widget.name +
                        ' in ' +
                        Accounts.accounts[Accounts.currentAccount]
                            .findCategory(widget.name) +
                        '?'),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      Accounts.accounts[Accounts.currentAccount]
                          .deleteTabBarViewElements(widget.name);
                      Accounts.accounts[Accounts.currentAccount]
                          .deleteTopTenFoodsElements(widget.name);
                      if (RestaurantFoodTile.topTenFoods != null) {
                        RestaurantFoodTile.topTenFoods();
                      }
                      String listen = '';
                      RestaurantFoodTile.function();
                      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
                        print('connected writer');
                        String write = 'RestaurantMenuEdition-deleteFood-' +
                            MyApp.id +
                            '-' +
                            widget.category +
                            '-' +
                            widget.name;
                        write = (write.length + 11).toString() +
                            ',Restaurant-' +
                            write;
                        serverSocket.write(write);
                        serverSocket.flush();
                        print('write: ' + write);
                        print('connected listen');
                        serverSocket.listen((socket) {
                          listen =
                              String.fromCharCodes(socket).trim().substring(2);
                        }).onDone(() {
                          print("listen: " + listen);
                          Navigator.pop(context);
                          if (flag) {
                            Navigator.pop(context);
                          }
                        });
                        // serverSocket.close();
                      });
                    },
                    child: Text(
                      'Delete',
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
            ]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DetailsRestaurantFoodTile.deleteFunction = deleteFunc;
        DetailsRestaurantFoodTile.category = widget.category;
        DetailsRestaurantFoodTile.name = widget.name;
        DetailsRestaurantFoodTile.desc =
            widget.desc != null ? widget.desc : ' ';
        DetailsRestaurantFoodTile.price = widget.price;
        DetailsRestaurantFoodTile.foodStatus = widget.foodStatus;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsRestaurantFoodTile(
              function: refreshPage,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Color(0xffDCDCDC), width: 1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 3)),
            Row(children: [
              Padding(padding: EdgeInsets.all(7)),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                height: 95,
                width: 95,
              ),
              Padding(padding: EdgeInsets.all(5)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Accounts.digester(widget.name,
                      MediaQuery.of(context).size.width.floor() - 372)),
                  Padding(padding: EdgeInsets.all(3)),
                  Text(Accounts.digester(
                      widget.desc == null ? ' ' : widget.desc,
                      MediaQuery.of(context).size.width.floor() - 372)),
                  Padding(padding: EdgeInsets.all(13)),
                  Text(Accounts.digester(
                      'Price: ' + '\$' + widget.price.toString(),
                      MediaQuery.of(context).size.width.floor() - 372)),
                ],
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(3)),
                    SizedBox(
                      // height: 10,
                      // width: 100,
                      child: Switch(
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.red,
                        activeTrackColor: Color.fromRGBO(0, 181, 0, 1),
                        activeColor: Color.fromRGBO(0, 181, 0, 1),
                        value: widget.foodStatus,
                        onChanged: (value) async {
                          setState(() {
                            Accounts.accounts[Accounts.currentAccount]
                                .topTenFoodsSwitch(widget.name);
                            widget.foodStatus = !widget.foodStatus;
                          });
                          String listen = '';
                          await Socket.connect(MyApp.ip, 2442)
                              .then((serverSocket) {
                            print('connected writer');
                            String write = 'RestaurantMenuEdition-editStatus-' +
                                MyApp.id +
                                '-' +
                                widget.category +
                                '-' +
                                widget.name +
                                '-' +
                                widget.foodStatus.toString();
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
                            });
                            // serverSocket.close();
                          });
                        },
                      ),
                    ),
                    Text(
                      widget.foodStatus ? 'Active' : 'Inactive',
                      style: TextStyle(
                          color: widget.foodStatus ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => deleteFunc(false),
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(width: 0.7, color: Colors.black),
                        ),
                        child: Center(
                          child: Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                  ],
                ),
              ],
            ),
          ],
        ),
        // color: Colors.green,
        height: 190,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
