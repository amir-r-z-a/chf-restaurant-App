import 'package:chfrestaurant/Classes/Accounts.dart';
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
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key1,
        child: Container(
          child: ListView(
              padding: EdgeInsets.fromLTRB(50, 175, 50, 100),
              children: [
                SignInUpText("Sign In"),
                Padding(padding: EdgeInsets.all(10)),
                GrayText("Hi there! Nice to see you again.", 0xff989eb1, 16),
                Padding(padding: EdgeInsets.all(10)),
                MyTextFormField(
                  "Phone number",
                  hint: "example: 0912XXXXXXX",
                  regex: 'PN',
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty || value == null) {
                      return "Please enter something";
                    } else if (Accounts.foundPassword(value)) {
                      return "Your password is not correct";
                    }
                    return null;
                  },
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      color: Color.fromRGBO(248, 95, 106, 1),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(248, 95, 106, 1)),
                    hintText: "Your password ",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(209, 214, 219, 1),
                    ),
                    errorStyle:
                        TextStyle(color: Color.fromRGBO(248, 95, 106, 1)),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(248, 95, 106, 1)),
                  onPressed: () {
                    if (key1.currentState.validate()) {
                      key1.currentState.save();
                      print("done");
                      print(Accounts.currentAccount);
                      print(MyTextFormField.name);
                      print(MyTextFormField.password);
                      print("Welcome to Chamir food");
                    }
                  },
                  child: WhiteText('Sign In'),
                ),
                Padding(padding: EdgeInsets.all(20)),
                GestureDetector(
                  onTap: () {
                    print("tap");
                    Navigator.pushNamed(context, '/SignUpScreen');
                  },
                  child: Center(
                      child: TitleText(
                    'Sign Up',
                    fontSize: 18,
                  )),
                ),
              ]),
        ),
      ),
    );
  }
}
