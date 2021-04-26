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
                margin: EdgeInsets.fromLTRB(30, 50, 0, 0),
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField()
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
