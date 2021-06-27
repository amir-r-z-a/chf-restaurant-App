import 'dart:math';

import 'package:chfrestaurant/Common/Common%20Classes/CommentTile.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Date.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Food.dart';
import 'package:chfrestaurant/Classes/Order.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Classes/RestaurantActiveOrderTile.dart';
import 'package:chfrestaurant/Classes/RestaurantInactiveOrderTile.dart';
import 'package:chfrestaurant/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Classes/TopTenFoodTile.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantFoodTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';

class Restaurant {
  String _name;
  String _phoneNumber;
  String _password;
  String _address;
  RestaurantTypes _type;
  Map _tabBarTitle = {0: 'All'};
  Map <int , List<RestaurantFoodTile>>_restaurantTabBarView = {0: []};
  Map _listOfFood = {0: []};
  double _radiusOfWork;
  double _point;
  String _email;
  List<RestaurantInactiveOrderTile> _ordersHistory = [];
  List<RestaurantActiveOrderTile> _activeOrders = [];
  Map _restaurantComments = {0: []};
  Image _profileImage;
  double _sumSell;
  double _onlineSell;
  double _cashSell;
  int _sumNumberOfFoods;
  int _sumOnlineNumberOfFoods;
  int _sumCashNumberOfFoods;
  Map discountCode = {5: [], 10: [], 25: [], 50: [], 100: []};
  List<TopTenFoodTile> topTenFoods = [];
  LatLng _location;
  String open;
  String close;

  Restaurant(this._name, this._phoneNumber, this._password, this.open,
      this.close, this._type);

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
    Food food2 = Food(
      food.name,
      food.price,
      food.foodStatus,
      food.category,
      desc: food.desc,
    );
    listOfFood[0].add(food2);
    listOfFood[i].add(food2);
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

  void addTabBarTitle(String title, RestaurantFoodTile food,
      {bool addFood = true}) {
    int len = getTabBarTitleLength();
    tabBarTitle[len] = title;
    listOfFood[len] = [];
    restaurantTabBarView[len] = List<RestaurantFoodTile>();
    restaurantComments[len] = [];
    if (addFood) {
      addTabBarViewElements(food, len);
    }
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
    // comment.id = commentsIDGenerator(comment);
    restaurantComments[0].add(comment);
    restaurantComments[i].add(comment);
  }

  List getIndexOfComment(String input) {
    for (int i = 0; i < getTabBarTitleLength(); i++) {
      for (int j = 0; j < restaurantComments[i].length; j++) {
        if (restaurantComments[i][j].id == input) {
          return [i, j];
        }
      }
    }
    return [-1, -1];
  }

  void editCommentsAnswer(String id, String reply) {
    restaurantComments[getIndexOfComment(id)[0]][getIndexOfComment(id)[1]]
        .answer = reply;
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

  int getTopTenFoodsLength() {
    return topTenFoods.length;
  }

  void addOrder(RestaurantActiveOrderTile restaurantActiveOrderTile) {
    // restaurantActiveOrderTile.sumPrice =
    //     sumPriceCalculator(restaurantActiveOrderTile);
    // restaurantActiveOrderTile.sumNumberOfFoods =
    //     sumNumberOfFoodsCalculator(restaurantActiveOrderTile);
    // restaurantActiveOrderTile.id = ordersIDGenerator(restaurantActiveOrderTile);
    activeOrders.add(restaurantActiveOrderTile);
    topTenCalculator(restaurantActiveOrderTile);
  }

  void inactiveOrder(String input) {
    for (int i = 0; i < getActiveOrdersLength(); i++) {
      if (activeOrders[i].id == input) {
        // ordersHistory.add(RestaurantInactiveOrderTile(
        //     activeOrders[i].foods,
        //     activeOrders[i].numberOfFoods,
        //     activeOrders[i].orderDate,
        //     activeOrders[i].clientPhoneNumber,
        //     activeOrders[i].clientAddress,
        //     activeOrders[i].clientName,
        //     // activeOrders[i].clientLastName,
        //     activeOrders[i].id,
        //     activeOrders[i].sumPrice,
        //     activeOrders[i].onlinePayment,
        //     activeOrders[i].sumNumberOfFoods));
        activeOrders.removeAt(i);
      }
    }
  }

  // double sumPriceCalculator(
  //     RestaurantActiveOrderTile restaurantActiveOrderTile) {
  //   double sum = 0;
  //   for (int i = 0; i < restaurantActiveOrderTile.foods.length; i++) {
  //     sum += double.parse(restaurantActiveOrderTile.foods[i].price) *
  //         restaurantActiveOrderTile.numberOfFoods[i];
  //   }
  //   return sum;
  // }
  //
  // int sumNumberOfFoodsCalculator(
  //     RestaurantActiveOrderTile restaurantActiveOrderTile) {
  //   int sum = 0;
  //   for (int i = 0; i < restaurantActiveOrderTile.numberOfFoods.length; i++) {
  //     sum += restaurantActiveOrderTile.numberOfFoods[i];
  //   }
  //   return sum;
  // }

  // String ordersIDGenerator(
  //     RestaurantActiveOrderTile restaurantActiveOrderTile) {
  //   bool flag;
  //   String randomID;
  //   do {
  //     flag = false;
  //     randomID = '#' +
  //         String.fromCharCode(
  //             restaurantActiveOrderTile.clientName.codeUnitAt(0)) +
  //         String.fromCharCode(
  //             restaurantActiveOrderTile.clientLastName.codeUnitAt(0)) +
  //         restaurantActiveOrderTile.clientPhoneNumber.substring(
  //             restaurantActiveOrderTile.clientPhoneNumber.length - 4) +
  //         '-' +
  //         (Random().nextInt(8999) + 1000).toString();
  //     for (int i = 0; i < getActiveOrdersLength(); i++) {
  //       if (activeOrders[i].id == randomID) {
  //         flag = true;
  //         break;
  //       }
  //     }
  //   } while (flag);
  //   return randomID;
  // }

  // String commentsIDGenerator(CommentTile commentTile) {
  //   bool flag;
  //   String randomID;
  //   do {
  //     flag = false;
  //     bool key = false;
  //     randomID = '#' +
  //         String.fromCharCode(commentTile.foodName.codeUnitAt(0)) +
  //         commentTile.clientPhoneNumber
  //             .substring(commentTile.clientPhoneNumber.length - 4) +
  //         '-' +
  //         (Random().nextInt(89) + 10).toString();
  //     for (int i = 0; i < getRestaurantCommentsLength(); i++) {
  //       for (int j = 0; j < restaurantComments[i].length; j++) {
  //         if (restaurantComments[i][j].id == randomID) {
  //           flag = true;
  //           key = true;
  //           break;
  //         }
  //         if (key) {
  //           break;
  //         }
  //       }
  //     }
  //   } while (flag);
  //   return randomID;
  // }

  void calculator({int input = 0}) {
    onlineSell = 0;
    cashSell = 0;
    for (int i = 0; i < getOrdersHistoryLength(); i++) {
      if (input == 1 &&
          ordersHistory[i]
              .orderDate
              .validDate(Date(), 1)) {
        if (ordersHistory[i].onlinePayment) {
          onlineSell += ordersHistory[i].sumPrice;
        } else {
          cashSell += ordersHistory[i].sumPrice;
        }
      } else if (input == 7 &&
          ordersHistory[i]
              .orderDate
              .validDate(Date(), 7)) {
        if (ordersHistory[i].onlinePayment) {
          onlineSell += ordersHistory[i].sumPrice;
        } else {
          cashSell += ordersHistory[i].sumPrice;
        }
      } else if (input == 30 &&
          ordersHistory[i]
              .orderDate
              .validDate(Date(), 30)) {
        if (ordersHistory[i].onlinePayment) {
          onlineSell += ordersHistory[i].sumPrice;
        } else {
          cashSell += ordersHistory[i].sumPrice;
        }
      } else if (input == 0) {
        if (ordersHistory[i].onlinePayment) {
          onlineSell += ordersHistory[i].sumPrice;
        } else {
          cashSell += ordersHistory[i].sumPrice;
        }
      }
    }
    sumSell = cashSell + onlineSell;
  }

  void sumNumberCalculator({int input = 0}) {
    sumOnlineNumberOfFoods = 0;
    sumCashNumberOfFoods = 0;
    for (int i = 0; i < getOrdersHistoryLength(); i++) {
      if (input == 1 &&
          ordersHistory[i]
              .orderDate
              .validDate(Date(), 1)) {
        if (ordersHistory[i].onlinePayment) {
          sumOnlineNumberOfFoods += ordersHistory[i].sumNumberOfFoods;
        } else {
          sumCashNumberOfFoods += ordersHistory[i].sumNumberOfFoods;
        }
      } else if (input == 7 &&
          ordersHistory[i]
              .orderDate
              .validDate(Date(), 7)) {
        if (ordersHistory[i].onlinePayment) {
          sumOnlineNumberOfFoods += ordersHistory[i].sumNumberOfFoods;
        } else {
          sumCashNumberOfFoods += ordersHistory[i].sumNumberOfFoods;
        }
      } else if (input == 30 &&
          ordersHistory[i]
              .orderDate
              .validDate(Date(), 30)) {
        if (ordersHistory[i].onlinePayment) {
          sumOnlineNumberOfFoods += ordersHistory[i].sumNumberOfFoods;
        } else {
          sumCashNumberOfFoods += ordersHistory[i].sumNumberOfFoods;
        }
      } else if (input == 0) {
        if (ordersHistory[i].onlinePayment) {
          sumOnlineNumberOfFoods += ordersHistory[i].sumNumberOfFoods;
        } else {
          sumCashNumberOfFoods += ordersHistory[i].sumNumberOfFoods;
        }
      }
    }
    sumNumberOfFoods = sumCashNumberOfFoods + sumOnlineNumberOfFoods;
  }

  String discountCodeCalculator(int discount) {
    String tag;
    if (discount == 5) {
      tag = 'F';
    } else if (discount == 10) {
      tag = 'T';
    } else if (discount == 25) {
      tag = 'Q';
    } else if (discount == 50) {
      tag = 'H';
    } else if (discount == 100) {
      tag = 'X';
    } else {
      return 'Invalid';
    }
    bool flag;
    String randomCode;
    do {
      flag = false;
      String rand = '';
      for (int i = 0; i < 6; i++) {
        rand += String.fromCharCode(Random().nextInt(25) + 65);
      }
      randomCode = '#' +
          tag +
          name.substring(0, 1) +
          rand +
          type.toString().substring(type.toString().indexOf('.') + 1,
              type.toString().indexOf('.') + 2);
      for (int i = 0; i < discountCode[discount].length; i++) {
        if (discountCode[discount][i] == randomCode) {
          flag = true;
          break;
        }
      }
    } while (flag);
    discountCode[discount].add(randomCode);
    return randomCode;
  }

  void topTenCalculator(RestaurantActiveOrderTile restaurantActiveOrderTile) {
    topTenFoods = [];
    for (int k = 0; k < restaurantActiveOrderTile.foods.length; k++) {
      for (int j = 0;
          j < restaurantTabBarView[0].length && j < listOfFood[0].length;
          j++) {
        if (restaurantTabBarView[0][j].name ==
                restaurantActiveOrderTile.foods[k].name &&
            listOfFood[0][j].name == restaurantActiveOrderTile.foods[k].name) {
          restaurantTabBarView[0][j].orderCount +=
              restaurantActiveOrderTile.numberOfFoods[k];
        }
      }
    }
    List<RestaurantFoodTile> arr = [];
    for (int i = 0; i < restaurantTabBarView[0].length; i++) {
      arr.add(RestaurantFoodTile(
        restaurantTabBarView[0][i].name,
        restaurantTabBarView[0][i].price,
        restaurantTabBarView[0][i].foodStatus,
        restaurantTabBarView[0][i].category,
        desc: restaurantTabBarView[0][i].desc,
        orderCount: restaurantTabBarView[0][i].orderCount,
      ));
    }
    int n = arr.length;
    for (int i = 0; i < n - 1; i++)
      for (int j = 0; j < n - i - 1; j++)
        if (arr[j].orderCount < arr[j + 1].orderCount) {
          RestaurantFoodTile temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
    int len;
    if (n < 10) {
      len = n;
    } else {
      len = 10;
    }
    for (int i = 0; i < len; i++) {
      topTenFoods.add(TopTenFoodTile(
        arr[i].name,
        arr[i].price,
        arr[i].foodStatus,
        arr[i].category,
        i + 1,
        desc: arr[i].desc,
        orderCount: arr[i].orderCount,
      ));
    }
  }

  void deleteTopTenFoodsElements(String input) {
    for (int i = 0; i < getTopTenFoodsLength(); i++) {
      if (topTenFoods[i].name == input) {
        topTenFoods.removeAt(i);
        for (int j = i; j < getTopTenFoodsLength(); j++) {
          topTenFoods[j].rank--;
        }
        return;
      }
    }
  }

  void topTenFoodsSwitch(String input) {
    for (int i = 0; i < getTopTenFoodsLength(); i++) {
      if (topTenFoods[i].name == input) {
        topTenFoods[i].foodStatus = !topTenFoods[i].foodStatus;
      }
    }
  }

  void editTopTenFoodsElements(
      String oldName, String name, String desc, String price) {
    for (int i = 0; i < getTopTenFoodsLength(); i++) {
      if (topTenFoods[i].name == oldName) {
        topTenFoods[i].name = name;
        topTenFoods[i].desc = desc;
        topTenFoods[i].price = price;
        return;
      }
    }
  }

  void addNewTopTenFoodsElements(RestaurantFoodTile food) {
    int len = getTopTenFoodsLength();
    if (len < 10) {
      topTenFoods.add(TopTenFoodTile(
        food.name,
        food.price,
        food.foodStatus,
        food.category,
        len + 1,
        desc: food.desc,
        orderCount: food.orderCount,
      ));
    }
  }

  void editCommentsName(String oldName, String name) {
    for (int i = 0; i < restaurantComments[0].length; i++) {
      if (restaurantComments[0][i].foodName == oldName) {
        restaurantComments[0][i].foodName = name;
      }
    }
  }

  void editActiveOrdersName(String oldName, String name) {
    for (int i = 0; i < getActiveOrdersLength(); i++) {
      for (int j = 0; j < activeOrders[i].foods.length; j++) {
        if (activeOrders[i].foods[j].name == oldName) {
          activeOrders[i].foods[j].name = name;
        }
      }
    }
  }

  //String ordersIDGenerator(
  //       RestaurantActiveOrderTile restaurantActiveOrderTile) {
  //     bool flag;
  //     String randomID;
  //     do {
  //       flag = false;
  //       randomID = '#' +
  //           String.fromCharCode(
  //               restaurantActiveOrderTile.clientName.codeUnitAt(0)) +
  //           String.fromCharCode(
  //               restaurantActiveOrderTile.clientLastName.codeUnitAt(0)) +
  //           restaurantActiveOrderTile.clientPhoneNumber.substring(
  //               restaurantActiveOrderTile.clientPhoneNumber.length - 4) +
  //           '-' +
  //           (Random().nextInt(8999) + 1000).toString();
  //       for (int i = 0; i < getActiveOrdersLength(); i++) {
  //         if (activeOrders[i].id == randomID) {
  //           flag = true;
  //           break;
  //         }
  //       }
  //     } while (flag);
  //     return randomID;
  //   }

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

  double get radiusOfWork => _radiusOfWork;

  set radiusOfWork(double value) {
    _radiusOfWork = value;
  }

  Image get profileImage => _profileImage;

  set profileImage(Image value) {
    _profileImage = value;
  }

  LatLng get location => _location;

  set location(LatLng value) {
    _location = value;
  }

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

  List<RestaurantActiveOrderTile> get activeOrders => _activeOrders;

  set activeOrders(List<RestaurantActiveOrderTile> value) {
    _activeOrders = value;
  }

  List<RestaurantInactiveOrderTile> get ordersHistory => _ordersHistory;

  set ordersHistory(List<RestaurantInactiveOrderTile> value) {
    _ordersHistory = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  Map get listOfFood => _listOfFood;

  set listOfFood(Map value) {
    _listOfFood = value;
  }

  double get cashSell => _cashSell;

  set cashSell(double value) {
    _cashSell = value;
  }

  double get onlineSell => _onlineSell;

  set onlineSell(double value) {
    _onlineSell = value;
  }

  double get sumSell => _sumSell;

  set sumSell(double value) {
    _sumSell = value;
  }

  int get sumCashNumberOfFoods => _sumCashNumberOfFoods;

  set sumCashNumberOfFoods(int value) {
    _sumCashNumberOfFoods = value;
  }

  int get sumOnlineNumberOfFoods => _sumOnlineNumberOfFoods;

  set sumOnlineNumberOfFoods(int value) {
    _sumOnlineNumberOfFoods = value;
  }

  int get sumNumberOfFoods => _sumNumberOfFoods;

  set sumNumberOfFoods(int value) {
    _sumNumberOfFoods = value;
  }
}
