import 'package:chfrestaurant/Screens/DetailsFoodTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodTile extends StatefulWidget {
  String _name;
  double _price;
  String desc;
  bool _foodStatus;
  String _foodType;
  Image _foodImage;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  FoodTile(this._name, this._price, this._foodStatus, {this.desc});

  @override
  _FoodTileState createState() => _FoodTileState();

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  bool get foodStatus => _foodStatus;

  set foodStatus(bool value) {
    _foodStatus = value;
  }

  String get foodType => _foodType;

  set foodType(String value) {
    _foodType = value;
  }

  Image get foodImage => _foodImage;

  set foodImage(Image value) {
    _foodImage = value;
  }
}

class _FoodTileState extends State<FoodTile> {
  void refreshPage() {
    setState(() {
      widget.name = DetailsFoodTile.name;
      widget.desc = DetailsFoodTile.desc;
      widget.price = DetailsFoodTile.price;
      widget.foodStatus = DetailsFoodTile.foodStatus;
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
                      value: widget.foodStatus,
                      onChanged: (value) {
                        setState(() {
                          widget.foodStatus = !widget.foodStatus;
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
                    onTap: () {
                      DetailsFoodTile.name = widget.name;
                      DetailsFoodTile.desc =
                          widget.desc != null ? widget.desc : ' ';
                      DetailsFoodTile.price = widget.price;
                      DetailsFoodTile.foodStatus = widget.foodStatus;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsFoodTile(
                            function: refreshPage,
                          ),
                        ),
                      );
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
