import 'package:chfrestaurant/Classes/Comment.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Classes/RestaurantOrderTile.dart';
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
  List<RestaurantOrderTile> _orderHistory;
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
    listOfFood[0]
        .add(Food(food.name, food.price, food.foodStatus, desc: food.desc));
    listOfFood[i]
        .add(Food(food.name, food.price, food.foodStatus, desc: food.desc));
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

  void addComments(CommentTile comment, int i) {
    restaurantComments[0].add(comment);
    restaurantComments[i].add(comment);
  }

  //order history majmooe sefareshat active va qeir active ast behtar ast do fiel shavad
  int getOrderHistoryLength() {
    return orderHistory.length;
  }

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

  List<RestaurantOrderTile> get orderHistory => _orderHistory;

  set orderHistory(List<RestaurantOrderTile> value) {
    _orderHistory = value;
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
}
