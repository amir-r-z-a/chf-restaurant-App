import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/CommentTile.dart';
import 'package:chfrestaurant/Classes/Date.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/RestaurantActiveOrderTile.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Screens/ActiveOrdersScreen.dart';
import 'package:chfrestaurant/Screens/CalculatorScreen.dart';
import 'package:chfrestaurant/Screens/CommentsManagement.dart';
import 'package:chfrestaurant/Screens/DetailsCommentTile.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantActiveOrderTile.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantFoodTile.dart';
import 'package:chfrestaurant/Screens/MainMenuScreen.dart';
import 'package:chfrestaurant/Screens/OrdersHistoryScreen.dart';
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
      RestaurantFoodTile(
        'Tea',
        '25',
        true,
        'Cafe',
        desc: 'desc',
      ));
  restaurant.addTabBarTitle(
      'Fast Food',
      RestaurantFoodTile(
        'Hot Dog',
        '25',
        true,
        'Cafe',
        desc: 'desc',
      ));
  restaurant.addComments(
      CommentTile(
          'chera qazatoon inqad bade?',
          'Milk',
          Date('2021', '3', '5', '22', '12', '2'),
          '09121231212',
          '09198612878'),
      1);
  restaurant.addComments(
      CommentTile(
          'chera qazatoon inqad khoobe?',
          'Tea',
          Date('2021', '3', '7', '20', '20', '20'),
          '09121231212',
          '09198612878'),
      1);
  restaurant.addComments(
      CommentTile(
          'chera qazatoon inqad bade va khoobe?',
          'Hot Dog',
          Date('2021', '3', '11', '1', '28', '29'),
          '09121231212',
          '09198612878'),
      2);
  restaurant.addOrder(RestaurantActiveOrderTile([
    Food(
      'Tea',
      '25',
      true,
      'Cafe',
      desc: 'desc',
    ),
    Food(
      'pizza',
      '25',
      true,
      'FastFood',
      desc: 'desc',
    ),
    Food(
      'milk',
      '25',
      true,
      'Cafe',
      desc: 'desc',
    )
  ], [
    3,
    4,
    5
  ], Date('2021', '3', '7', '20', '20', '20'), "09185452060", "hamadan", "ghar",
      "alisadr"));

  restaurant.addOrder(RestaurantActiveOrderTile([
    Food(
      'arman',
      '25',
      true,
      'arman',
      desc: 'desc',
    ),
    Food(
      'amireza',
      '25',
      true,
      'amireza',
      desc: 'desc',
    ),
    Food(
      'armannnnnnn',
      '25',
      true,
      'armannnnnnn',
      desc: 'desc',
    )
  ], [
    6,
    9,
    8
  ], Date('2021', '3', '7', '20', '20', '20'), "09185452060", "hamadan",
      "arman", "shiraz"));
  // print(Accounts.accounts[Accounts.currentAccount].activeOrders[0].foods);
  // print(DetailsRestaurantOrderTile.foods.length);
  print(Accounts.currentAccount);
  print(Accounts.accounts.length);
  print(restaurant.tabBarTitle);
  print(restaurant.restaurantTabBarView);
  print(restaurant.listOfFood);
  print(restaurant.restaurantComments);
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
          '/DetailsFoodTile': (context) => DetailsRestaurantFoodTile(),
          '/MainMenuScreen': (context) => MainMenuScreen(),
          '/ProfileScreen': (context) => ProfileScreen(),
          '/OrdersMenu': (context) => OrdersMenu(),
          '/DetailsRestaurantActiveOrderTiles': (context) =>
              DetailsRestaurantActiveOrderTile(),
          '/OrdersHistoryScreen': (context) => OrdersHistoryScreen(),
          '/ActiveOrdersScreen': (context) => ActiveOrdersScreen(),
          '/CommentsManagements': (context) => CommentsManagement(),
          '/DetailsCommentTile': (context) => DetailsCommentTile(),
        },
        home: /*ActiveOrdersScreen()*/
            /*CalculatorScreen()*/ /*OrdersHistoryScreen()*/ /*CommentsManagement()*/
            MainMenuScreen() /*RestaurantActiveOrderTile([
          Food(
            'Tea',
            '25',
            true,
            desc: 'desc',
          ),
          Food(
            'pizza',
            '25',
            true,
            desc: 'desc',
          ),
          Food(
            'milk',
            '25',
            true,
            desc: 'desc',
          )
        ], [
          3,
          4,
          5
        ], Date('2021', '3', '7', '20', '20', '20'), "09185452060", "hamadan",
            "ghar", "alisadr", "#12345")*/
        // DetailsRestaurantOrderTile()
        // DetailsCommentTile()
        /*CommentsManagement()*/ /*OrdersMenu()*/ /*SignInScreen()*/ /*FoodTile(
          'Egg',
          28,
          true,
          desc: 'xx',
        )*/
        /*DetailsRestaurantFoodTile(
        'Egg',
        28,
        desc: 'xx',
      ),*/
        );
  }
}
