import 'package:chfrestaurant/screens/signupScreen.dart';
import 'package:chfrestaurant/screens/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
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
      home:SignUpScreen() ,
    );
  }
}
