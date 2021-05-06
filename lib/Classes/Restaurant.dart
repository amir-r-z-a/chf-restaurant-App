import 'package:chfrestaurant/Classes/ClientComment.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Order.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Screens/DetailsFoodTile.dart';
import 'package:flutter/cupertino.dart';

class Restaurant {
  String _name;
  String _phoneNumber;
  String _password;
  String _address;
  RestaurantTypes _type;
  Map _tabBarView = {0: []};
  Map _tabBarTitle = {0: 'All'};
  double _workingRadius = 10;
  double _point;
  String email;
  List<Order> _orderHistory;
  List<ClientComment> _restaurantComments;
  Image _profileImage;

  Restaurant(
      this._name, this._phoneNumber, this._password, this._address, this._type);

  // Location _location;

  int getTabBarTitleLength() {
    return tabBarTitle.length;
  }

  int getAllFoodsLength() {
    int counter = 0;
    for (int i = 0; i < getTabBarTitleLength(); i++) {
      counter += tabBarView[i].length;
    }
    return counter;
  }

  bool validFood(String input) {
      for (int j = 0; j < tabBarView[0].length; j++) {
        if (tabBarView[0][j].name == input && DetailsFoodTile.name != input) {
          return true;
        }
      }
    return false;
  }

  void addTabBarViewElements(FoodTile food, int i) {
    tabBarView[0].add(food);
    tabBarView[i].add(food);
  }

  void addTabBarTitle(String title, FoodTile food) {
    int len = getTabBarTitleLength();
    tabBarTitle[len] = title;
    tabBarView[len] = [];
    addTabBarViewElements(food, len);
  }

  void createAll() {
    tabBarView[0] = [];
    //  baqie tabBar ha ro add kone

    //  method haii ke tabBarView va tabBarTitle ro peymayesh mikardan bayad az index 1 shoro konan
  }

  bool validCategory(String input) {
    if (input == 'All' || input == 'all') {
      return true;
    }
    return false;
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

  Map get tabBarView => _tabBarView;

  set tabBarView(Map value) {
    _tabBarView = value;
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

  List<Order> get orderHistory => _orderHistory;

  set orderHistory(List<Order> value) {
    _orderHistory = value;
  }

  Map get tabBarTitle => _tabBarTitle;

  set tabBarTitle(Map value) {
    _tabBarTitle = value;
  }

  List<ClientComment> get restaurantComments => _restaurantComments;

  set restaurantComments(List<ClientComment> value) {
    _restaurantComments = value;
  }
}
