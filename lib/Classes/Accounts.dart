import 'package:chfrestaurant/Classes/Restaurant.dart';

class Accounts {
  List<Restaurant> _accounts;

  void addAccount(Restaurant restaurant) {
    _accounts.add(restaurant);
  }

  List<Restaurant> get accounts => _accounts;

  set accounts(List<Restaurant> value) {
    _accounts = value;
  }
}
