import 'package:chfrestaurant/Classes/Restaurant.dart';

class Accounts {
  static List<Restaurant> _accounts = List.empty(growable: true);

  static void addAccount(Restaurant restaurant) {
    _accounts.add(restaurant);
  }

  static int getLength() {
    return _accounts.length;
  }

  static List<Restaurant> get accounts => _accounts;

  static set accounts(List<Restaurant> value) {
    _accounts = value;
  }
}
