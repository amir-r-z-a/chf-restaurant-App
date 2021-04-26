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
                margin: EdgeInsets.fromLTRB(25, 50, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.all(30),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    MyTextFormField(
                      "Name",
                      hint: "your name",
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(248, 95, 106, 1)),
                        hintText: "your password ",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(209, 214, 219, 1),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    MyTextFormField(
                      "Phone number",
                      hint: "your Phone number",
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    MyTextFormField(
                      "Address",
                      hint: "your Address",
                    )
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
