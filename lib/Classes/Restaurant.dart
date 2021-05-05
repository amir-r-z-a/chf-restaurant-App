import 'package:chfrestaurant/Classes/ClientComment.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Order.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';

class Restaurant {
  String _name;
  String _phoneNumber;
  String _password;
  String _address;
  RestaurantTypes _type;
  Map _tabBarView = Map();
  Map _tabBarTitle = Map();
  double _workingRadius = 10;
  double _point;
  String email;
  List<Order> _orderHistory;
  List<ClientComment> _restaurantComments;

  Restaurant(
      this._name, this._phoneNumber, this._password, this._address, this._type);

  // Image _profileImage;

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
    for (int i = 0; i < getTabBarTitleLength(); i++) {
      for (int j = 0; j < tabBarView[i].length; j++) {
        if (tabBarView[i][j].name == input) {
          return true;
        }
      }
    }
    return false;
  }

  void addTabBarViewElements(FoodTile food, int i) {
    tabBarView[i].add(food);
  }

  void addTabBarTitle(String title, FoodTile food) {
    int len = getTabBarTitleLength();
    tabBarTitle[len] = title;
    tabBarView[len] = [];
    addTabBarViewElements(food, len);
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

// Image get profileImage => _profileImage;
//
// set profileImage(Image value) {
//   _profileImage = value;
// }
//
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
