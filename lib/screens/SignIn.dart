import 'package:flutter/material.dart';
import 'package:chfrestaurant/Common/Text/TitleText.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [TitleText("Name", 14)],
        ),
      ),
    );
  }
}

//age Scaffold tooye MaterialApp bashe chi mishe?
