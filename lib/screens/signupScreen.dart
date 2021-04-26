import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                 margin: EdgeInsets.fromLTRB(25, 30, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Sign up",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.all(30),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      MyTextFormField("salam" , hint: "hi",)
                    ],
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
