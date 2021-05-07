import 'package:chfrestaurant/Classes/Comment.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/ClientOrderTile.dart';

class Client {
  String _nam;
  String _lastName;
  String _phoneNumber;

  // Location _location;
  String _password;
  String _email;
  List<ClientOrderTile> _clientOrders;
  List<Restaurant> _favRestaurants;
  List<CommentTile> _clientComments;
  double _wallet;

  String get nam => _nam;

  set nam(String value) {
    _nam = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  // Location get location => _location;
  //
  // set location(Location value) {
  //   _location = value;
  // }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  List<ClientOrderTile> get clientOrders => _clientOrders;

  set clientOrders(List<ClientOrderTile> value) {
    _clientOrders = value;
  }

  List<Restaurant> get favRestaurant => _favRestaurants;

  set favRestaurant(List<Restaurant> value) {
    _favRestaurants = value;
  }

  List<CommentTile> get clientComments => _clientComments;

  set clientComments(List<CommentTile> value) {
    _clientComments = value;
  }

  double get wallet => _wallet;

  set wallet(double value) {
    _wallet = value;
  }
}
