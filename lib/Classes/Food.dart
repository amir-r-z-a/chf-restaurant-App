import 'package:flutter/cupertino.dart';

class Food {
  String _name;
  String _label;
  double _price;
  bool _foodStatus;
  Image _foodImage;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get label => _label;

  set label(String value) {
    _label = value;
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
