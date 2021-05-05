import 'package:chfrestaurant/Classes/Date.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';

class Order {
  List<FoodTile> _foods;
  Restaurant _destinationRestaurant;
  Date _orderDate;
  bool _orderStatus;

  List<FoodTile> get foods => _foods;

  set foods(List<FoodTile> value) {
    _foods = value;
  }

  Restaurant get destinationRestaurant => _destinationRestaurant;

  set destinationRestaurant(Restaurant value) {
    _destinationRestaurant = value;
  }

  Date get orderDate => _orderDate;

  set orderDate(Date value) {
    _orderDate = value;
  }

  bool get orderStatus => _orderStatus;

  set orderStatus(bool value) {
    _orderStatus = value;
  }
}
