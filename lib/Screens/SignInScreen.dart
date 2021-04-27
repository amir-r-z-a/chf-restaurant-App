import 'package:chfrestaurant/Common/Text/GrayText.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/Common/Text/SignInUpText.dart';
import 'package:chfrestaurant/Common/Text/TitleText.dart';
import 'package:chfrestaurant/Common/Text/WhiteText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key1,
        child: Container(
          child: ListView(
              padding: EdgeInsets.fromLTRB(50, 180, 50, 100),
              children: [
                SignInUpText("Sign In"),
                Padding(padding: EdgeInsets.all(10)),
                GrayText("Hi there! Nice to see you again.", 0xff989eb1, 16),
                Padding(padding: EdgeInsets.all(10)),
                MyTextFormField(
                  "Phone number",
                  hint: "example: 0912XXXXXXX",
                  regex: 'N',
                ),
                Padding(padding: EdgeInsets.all(10)),
                MyTextFormField(
                  "Password",
                  regex: 'P',
                ),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(248, 95, 106, 1)),
                    onPressed: () {
                      if (key1.currentState.validate()) {
                        key1.currentState.save();
                        print("done");
                        print(MyTextFormField.name);
                        print(MyTextFormField.password);
                        print("Welcome to Chamir food");
                      }
                    },
                    child: WhiteText('Sign In')),
                Padding(padding: EdgeInsets.all(20)),
                GestureDetector(
                  onTap: () {
                    print("tap");
                  },
                  child: Center(child: TitleText('Sign Up')),
                ),
              ]),
        ),
      ),
    );
  }
}
