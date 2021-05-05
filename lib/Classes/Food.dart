import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Screens/DetailsFoodTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Food {
  String _name;
  String _foodType;
  double _price;
  bool _foodStatus;
  Image _foodImage;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get label => _foodType;

  set label(String value) {
    _foodType = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  bool get foodStatus => _foodStatus;

  set foodStatus(bool value) {
    _foodStatus = value;
  }

  Image get foodImage => _foodImage;

  set foodImage(Image value) {
    _foodImage = value;
  }
}

class FoodTile extends StatefulWidget {
  String name;
  double price;
  String desc;
  bool status;

  FoodTile(this.name, this.price, this.status, {this.desc});

  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  void refreshPage() {
    setState(() {
      for (int i = 0;
          i < Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength();
          i++) {
        for (int j = 0;
            j < Accounts.accounts[Accounts.currentAccount].tabBarView[i].length;
            j++) {
          if (Accounts.accounts[Accounts.currentAccount].tabBarView[i][j] ==
              DetailsFoodTile.name) {
            Accounts.accounts[Accounts.currentAccount].tabBarView[i][j].name =
                DetailsFoodTile.name;
            Accounts.accounts[Accounts.currentAccount].tabBarView[i][j].name =
                DetailsFoodTile.desc;
            Accounts.accounts[Accounts.currentAccount].tabBarView[i][j].name =
                DetailsFoodTile.price;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(widget.name),
                Padding(padding: EdgeInsets.all(3)),
                Text(widget.desc == null ? ' ' : widget.desc),
                Padding(padding: EdgeInsets.all(13)),
                Text('Price: ' + widget.price.toString() + '\$'),
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
                      value: widget.status,
                      onChanged: (value) {
                        setState(() {
                          widget.status = !widget.status;
                        });
                      },
                    ),
                  ),
                  Text(
                    widget.status ? 'Active' : 'Inactive',
                    style: TextStyle(
                        color: widget.status ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // DetailsFoodTile(
                      //   name: widget.name,
                      //   desc: widget.desc,
                      //   price: widget.price,
                      //   status: widget.status,
                      // );

                      DetailsFoodTile.name = widget.name;
                      DetailsFoodTile.desc =
                          widget.desc != null ? widget.desc : ' ';
                      DetailsFoodTile.price = widget.price;
                      DetailsFoodTile.status = widget.status;
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsFoodTile()),
                      ).then((res) => refreshPage());
                      // Navigator.pushNamed(context, '/DetailsFoodTile');
                      setState(() {});
                    },
                    child: Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: 0.7, color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          'Details',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
