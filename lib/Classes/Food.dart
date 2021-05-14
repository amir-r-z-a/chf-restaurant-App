import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Food {
  String _name;
  String _price;
  String desc;
  bool _foodStatus;
  Image _foodImage;
  String _category;
  int orderCount = 0;

  Food(this._name, this._price, this._foodStatus, this._category,
      {this.desc, this.orderCount});

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  String get price => _price;

  set price(String value) {
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
