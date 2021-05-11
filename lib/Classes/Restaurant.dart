import 'dart:math';

import 'package:chfrestaurant/Classes/CommentTile.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Order.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Classes/RestaurantActiveOrderTile.dart';
import 'package:chfrestaurant/Classes/RestaurantInactiveOrderTile.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantFoodTile.dart';
import 'package:flutter/cupertino.dart';

class Restaurant {
  String _name;
  String _phoneNumber;
  String _password;
  String _address;
  RestaurantTypes _type;
  Map _tabBarTitle = {0: 'All'};
  Map _restaurantTabBarView = {0: []};
  Map listOfFood = {0: []};
  Map _clientTabBarView = {0: []};
  double _workingRadius = 10;
  double _point;
  String email;
  List<RestaurantInactiveOrderTile> _ordersHistory = [];
  List<RestaurantActiveOrderTile> _activeOrders = [];
  Map _restaurantComments = {0: []};
  Image _profileImage;

  // Location _location;

  Restaurant(
      this._name, this._phoneNumber, this._password, this._address, this._type);

  int getTabBarTitleLength() {
    return tabBarTitle.length;
  }

  int getAllFoodsLength() {
    return restaurantTabBarView[0].length;
  }

  bool validFood(String input) {
    for (int j = 0; j < restaurantTabBarView[0].length; j++) {
      if (restaurantTabBarView[0][j].name == input &&
          DetailsRestaurantFoodTile.name != input) {
        return true;
      }
    }
    return false;
  }

  void addTabBarViewElements(RestaurantFoodTile food, int i) {
    listOfFood[0].add(Food(
        food.name, food.price, food.foodStatus, food.category,
        desc: food.desc));
    listOfFood[i].add(Food(
        food.name, food.price, food.foodStatus, food.category,
        desc: food.desc));
    restaurantTabBarView[0].add(food);
    restaurantTabBarView[i].add(food);
  }

  void deleteTabBarViewElements(String input) {
    for (int i = 0; i < getAllFoodsLength(); i++) {
      if (restaurantTabBarView[0][i].name == input) {
        restaurantTabBarView[0].removeAt(i);
        break;
      }
    }
    for (int i = 0; i < getTabBarTitleLength(); i++) {
      for (int j = 0; j < restaurantTabBarView[i].length; j++) {
        if (restaurantTabBarView[i][j].name == input) {
          restaurantTabBarView[i].removeAt(j);
        }
      }
    }
  }

  void addTabBarTitle(String title, RestaurantFoodTile food) {
    int len = getTabBarTitleLength();
    tabBarTitle[len] = title;
    listOfFood[len] = [];
    restaurantTabBarView[len] = [];
    restaurantComments[len] = [];
    addTabBarViewElements(food, len);
  }

  bool validCategory(String input) {
    if (input == 'All' || input == 'all') {
      return true;
    }
    return false;
  }

  static bool validPrice(String input) {
    //^([1-9][0-9]*)|([1-9][0-9]*\\.[0-9]+)$
    RegExp regPrice = new RegExp(
        r'^((\d{1,3}|\s*){1})((\,\d{3}|\d)*)(\s*|\.(\d{2}))$',
        caseSensitive: false,
        multiLine: false);
    if (!regPrice.hasMatch(input)) {
      return true;
    }
    return false;
  }

  String findCategory(String input) {
    for (int i = 1; i < getTabBarTitleLength(); i++) {
      for (int j = 0; j < restaurantTabBarView[i].length; j++) {
        if (restaurantTabBarView[i][j].name == input) {
          return tabBarTitle[i];
        }
      }
    }
    return '-1';
  }

  int getIndexOfCategory(String input) {
    for (int i = 0; i < getTabBarTitleLength(); i++) {
      if (tabBarTitle[i] == input) {
        return i;
      }
    }
    return -1;
  }

  void addComments(CommentTile comment, int i) {
    comment.id = commentsIDGenerator(comment);
    restaurantComments[0].add(comment);
    restaurantComments[i].add(comment);
  }

  int getIndexOfComment(String input) {
    for (int i = 0; i < getTabBarTitleLength(); i++) {
      for (int j = 0; j < restaurantComments[i].length; j++) {
        if (restaurantComments[i][j].id == input) {
          return j;
        }
      }
    }
    return -1;
  }

  int getOrdersHistoryLength() {
    return ordersHistory.length;
  }

  int getActiveOrdersLength() {
    return activeOrders.length;
  }

  int getRestaurantCommentsLength() {
    return restaurantComments.length;
  }

  void addOrder(RestaurantActiveOrderTile restaurantActiveOrderTile) {
    restaurantActiveOrderTile.id = ordersIDGenerator(restaurantActiveOrderTile);
    activeOrders.add(restaurantActiveOrderTile);
  }

  void inactiveOrder(String input) {
    for (int i = 0; i < getActiveOrdersLength(); i++) {
      if (activeOrders[i].id == input) {
        ordersHistory.add(RestaurantInactiveOrderTile(
            activeOrders[i].foods,
            activeOrders[i].numberOfFood,
            activeOrders[i].orderDate,
            activeOrders[i].clientPhoneNumber,
            activeOrders[i].clientAddress,
            activeOrders[i].clientName,
            activeOrders[i].clientLastName,
            activeOrders[i].id,
            activeOrders[i].sumPrice,
            activeOrders[i].onlinePayment));
        activeOrders.removeAt(i);
      }
    }
  }

  String ordersIDGenerator(
      RestaurantActiveOrderTile restaurantActiveOrderTile) {
    bool flag;
    String randomID;
    do {
      flag = false;
      randomID = '#' +
          String.fromCharCode(
              restaurantActiveOrderTile.clientName.codeUnitAt(0)) +
          String.fromCharCode(
              restaurantActiveOrderTile.clientLastName.codeUnitAt(0)) +
          restaurantActiveOrderTile.clientPhoneNumber.substring(
              restaurantActiveOrderTile.clientPhoneNumber.length - 4) +
          '-' +
          (Random().nextInt(8999) + 1000).toString();
      for (int i = 0; i < getActiveOrdersLength(); i++) {
        if (activeOrders[i].id == randomID) {
          flag = true;
          break;
        }
      }
    } while (flag);
    return randomID;
  }

  String commentsIDGenerator(CommentTile commentTile) {
    bool flag;
    String randomID;
    do {
      flag = false;
      bool key = false;
      randomID = '#' +
          String.fromCharCode(commentTile.foodName.codeUnitAt(0)) +
          commentTile.clientPhoneNumber
              .substring(commentTile.clientPhoneNumber.length - 4) +
          '-' +
          (Random().nextInt(89) + 10).toString();
      for (int i = 0; i < getRestaurantCommentsLength(); i++) {
        for (int j = 0; j < restaurantComments[i].length; j++) {
          if (restaurantComments[i][j].id == randomID) {
            flag = true;
            key = true;
            break;
          }
          if (key) {
            break;
          }
        }
      }
    } while (flag);
    return randomID;
  }

  // static int getNumberOfOrderFood(Map input) {
  //   String str = json.encode(input);
  //   return int.parse(String.fromCharCode(str.codeUnitAt(1)));
  // }
  //
  // static String getNameOfOrderFood(Map input){
  //   return input[Restaurant.getNumberOfOrderFood(input)];
  // }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  RestaurantTypes get type => _type;

  set type(RestaurantTypes value) {
    _type = value;
  }

  Map get restaurantTabBarView => _restaurantTabBarView;

  set restaurantTabBarView(Map value) {
    _restaurantTabBarView = value;
  }

  double get workingRadius => _workingRadius;

  set workingRadius(double value) {
    _workingRadius = value;
  }

  Image get profileImage => _profileImage;

  set profileImage(Image value) {
    _profileImage = value;
  }

// Location get location => _location;
//
// set location(Location value) {
//   _location = value;
// }

  double get point => _point;

  set point(double value) {
    _point = value;
  }

  Map get tabBarTitle => _tabBarTitle;

  set tabBarTitle(Map value) {
    _tabBarTitle = value;
  }

  Map get restaurantComments => _restaurantComments;

  set restaurantComments(Map value) {
    _restaurantComments = value;
  }

  Map get clientTabBarView => _clientTabBarView;

  set clientTabBarView(Map value) {
    _clientTabBarView = value;
  }

  List<RestaurantActiveOrderTile> get activeOrders => _activeOrders;

  set activeOrders(List<RestaurantActiveOrderTile> value) {
    _activeOrders = value;
  }

  List<RestaurantInactiveOrderTile> get ordersHistory => _ordersHistory;

  set ordersHistory(List<RestaurantInactiveOrderTile> value) {
    _ordersHistory = value;
  }
}
