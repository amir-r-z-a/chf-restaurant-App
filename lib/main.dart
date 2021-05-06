import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Screens/DetailsFoodTile.dart';
import 'package:chfrestaurant/Screens/MainMenuScreen.dart';
import 'package:chfrestaurant/Screens/OrdersMenu.dart';
import 'package:chfrestaurant/Screens/ProfileScreen.dart';
import 'package:chfrestaurant/Screens/SignInScreen.dart';
import 'package:chfrestaurant/Screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

void main() {
  Restaurant restaurant = Restaurant(
      'name1', '09198612878', 'password1', 'addres1', RestaurantTypes.Cafe);
  Accounts.addAccount(restaurant);
  restaurant.addTabBarTitle(
      'Cafe',
      FoodTile(
        'Tea',
        25,
        true,
        desc: 'desc',
      ));
  print(Accounts.currentAccount);
  print(Accounts.accounts.length);
  print(restaurant.tabBarTitle);
  print(restaurant.tabBarView);
  // Accounts.addAccount(Restaurant(
  //     'name2', 09121111111, 'password2', 'addres2', RestaurantTypes.Other));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "ChFood",
        theme: ThemeData(primaryColor: const Color.fromRGBO(248, 95, 106, 1)),
        routes: {
          '/SignInScreen': (context) => SignInScreen(),
          '/SignUpScreen': (context) => SignUpScreen(),
          '/DetailsFoodTile': (context) => DetailsFoodTile(),
          '/MainMenuScreen': (context) => MainMenuScreen(),
          '/ProfileScreen': (context) => ProfileScreen(),
        },
        home:
            SignInScreen() /*SignInScreen()*/ /*FoodTile(
          'Egg',
          28,
          true,
          desc: 'xx',
        )*/
        /*DetailsFoodTile(
        'Egg',
        28,
        desc: 'xx',
      ),*/
        );
  }
}
