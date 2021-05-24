import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Common/Text/GrayText.dart';
import 'package:chfrestaurant/Common/Text/MyPassFormField.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/Common/Text/SignInUpText.dart';
import 'package:chfrestaurant/Common/Text/TitleText.dart';
import 'package:chfrestaurant/Common/Text/WhiteText.dart';
import 'package:chfrestaurant/Screens/RestaurantProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantSignInScreen extends StatefulWidget {
  @override
  _RestaurantSignInScreenState createState() => _RestaurantSignInScreenState();
}

class _RestaurantSignInScreenState extends State<RestaurantSignInScreen> {
  var key1 = GlobalKey<FormState>();

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
                  regex: 'PNSignIn',
                ),
                Padding(padding: EdgeInsets.all(10)),
                MyPassFormField(
                  'Password',
                  regex: 'PassSignIn',
                  hint: 'Your password',
                ),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(248, 95, 106, 1)),
                  onPressed: () {
                    if (key1.currentState.validate()) {
                      key1.currentState.save();
                      print("done");
                      print('index: ');
                      print(Accounts.currentAccount);
                      print("Welcome to Chamir food");
                      Navigator.pushNamed(context, '/MainMenuScreen');
                    }
                  },
                  child: WhiteText('Sign In'),
                ),
                Padding(padding: EdgeInsets.all(20)),
                GestureDetector(
                  onTap: () {
                    // print("tap");
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
//hint signup yekish bozorge yekish koochik
// porrang tar boodan bordere errorStyle password az baqie border errorStyle ha
//ezafe kardan hint(hadaqal 6 char) be password sign in va tafkik error haye password
//age aval pop kone bad push mishe safhe haye qabl ro pak kard joori ke emkan back nabashe(dar SignIn va SignUp)?
//ja be ja kardan tartib field password va phoneNumber
//virayesh menu be soorat rowi az chip ha bashad dar oaiin ya balaye safhe ba entekhab chand daste az menu tedad azaye an daste namayesh dade shavad
