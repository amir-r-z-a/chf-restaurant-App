import 'package:chfrestaurant/Classes/Restaurant.dart';

class Accounts {
  static List<Restaurant> _accounts = List.empty(growable: true);
  static int _currentAccount;

  static void addAccount(Restaurant restaurant) {
    _accounts.add(restaurant);
  }

  static int getLength() {
    return _accounts.length;
  }

  static bool foundPhoneNumber(String input) {
    for (int i = 0; i < getLength(); i++) {
      if (accounts[i].phoneNumber == input) {
        return false;
      }
    }
    return true;
  }

  static bool foundPassword(String input) {
    for (int i = 0; i < getLength(); i++) {
      if (accounts[i].password == input) {
        currentAccount = i;
        return false;
      }
    }
    return true;
  }

  static List<Restaurant> get accounts => _accounts;

  static set accounts(List<Restaurant> value) {
    _accounts = value;
  }

  static int get currentAccount => _currentAccount;

  static set currentAccount(int value) {
    _currentAccount = value;
  }
}
