import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Comment.dart';
import 'package:chfrestaurant/Classes/Date.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Screens/CommentsManagement.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantFoodTile.dart';
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
      RestaurantFoodTile(
        'Tea',
        '25',
        true,
        desc: 'desc',
      ));
  restaurant.addTabBarTitle(
      'Fast Food',
      RestaurantFoodTile(
        'Hot Dog',
        '25',
        true,
        desc: 'desc',
      ));
  restaurant.addComments(
      CommentTile(
          'chera qazatoon inqad bade?',
          'Milk',
          Date('1970', '12', '3', '22', '12', '2'),
          '09121231212',
          '09198612878'),
      1);
  restaurant.addComments(
      CommentTile(
          'chera qazatoon inqad khoobe?',
          'Tea',
          Date('1975', '1', '30', '2', '2', '12'),
          '09121231212',
          '09198612878'),
      1);
  restaurant.addComments(
      CommentTile(
          'chera qazatoon inqad bade va khoobe?',
          'Hot Dog',
          Date('2220', '12', '13', '14', '12', '29'),
          '09121231212',
          '09198612878'),
      2);
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
        },
        home:
            /*CommentsManagement() */ /*OrdersMenu()*/ SignInScreen() /*FoodTile(
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
