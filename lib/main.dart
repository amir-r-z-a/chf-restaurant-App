import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Screens/SignInScreen.dart';
import 'package:chfrestaurant/Screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

void main() {
  Accounts.addAccount(Restaurant(
      'name1', 'phoneNumber1', 'password1', 'addres1', RestaurantTypes.Cafe));
  Accounts.addAccount(Restaurant(
      'name2', 'phoneNumber2', 'password2', 'addres2', RestaurantTypes.Other));
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
      home: SignUpScreen(),
    );
  }
}
