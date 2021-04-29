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

class foodTile extends StatefulWidget {
  @override
  _foodTileState createState() => _foodTileState();
}

class _foodTileState extends State<foodTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () {
          print(MediaQuery.of(context).size.width);
          print(MediaQuery.of(context).size.height);
        },
        child: Container(
          color: Colors.red,
          height: 200,
          width: 80000,
        ),
      ),
    ));
  }
}
