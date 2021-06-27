import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Common/Text/GrayText.dart';
import 'package:chfrestaurant/Common/Text/MyPassFormField.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/Common/Text/SignInUpText.dart';
import 'package:chfrestaurant/Common/Text/TitleText.dart';
import 'package:chfrestaurant/Common/Text/WhiteText.dart';
import 'package:chfrestaurant/Screens/RestaurantProfileScreen.dart';
import 'package:chfrestaurant/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class RestaurantSignInScreen extends StatefulWidget {
  @override
  _RestaurantSignInScreenState createState() => _RestaurantSignInScreenState();
}

class _RestaurantSignInScreenState extends State<RestaurantSignInScreen> {
  var key1 = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  bool _isObscure = true;
  bool validate = false;
  bool validatePass = false;

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
                TextFormField(
                  onSaved: (newValue) {
                    MyApp.id = newValue;
                    MyApp.mode = 'LogIn';
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter something";
                    } else if (Accounts.validPhoneNumber(_controller.text)) {
                      return 'Your phone number is not valid';
                    } else if (validate) {
                      return "Your phone number is not found";
                    }
                    return null;
                  },
                  controller: _controller,
                  cursorColor: Color.fromRGBO(248, 95, 106, 1),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      color: Color.fromRGBO(248, 95, 106, 1),
                    ),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(248, 95, 106, 1)),
                    hintText: 'example: 0912XXXXXXX',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(209, 214, 219, 1),
                    ),
                  ),
                ),
                // MyTextFormField(
                //   "Phone number",
                //   hint: "example: 0912XXXXXXX",
                //   regex: 'PNSignIn',
                // ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "You must fill this box";
                    } else if (validatePass) {
                      return "Your password is not correct";
                    }
                    return null;
                  },
                  controller: _controllerPass,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(248, 95, 106, 1),
                            width: 2.0)),
                    errorStyle: TextStyle(
                      color: Color.fromRGBO(248, 95, 106, 1),
                    ),
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
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(248, 95, 106, 1)),
                    hintText: 'Your password',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(209, 214, 219, 1),
                    ),
                  ),
                ),
                // MyPassFormField(
                //   'Password',
                //   regex: 'PassSignIn',
                //   hint: 'Your password',
                // ),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(248, 95, 106, 1)),
                  onPressed: () => checker(),
                  child: WhiteText('Sign In'),
                ),
                Padding(padding: EdgeInsets.all(20)),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/SignUpScreen'),
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

  void checker() async {
    print("tap");
    if (key1.currentState.validate()) {
      String listen = '';
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        String phoneNumber = _controller.text;
        String write =
            'RestaurantSignIn-' + phoneNumber + '-' + _controllerPass.text;
        write = (write.length + 11).toString() + ',Restaurant-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() async {
          print("listen: " + listen);
          validate = listen == 'invalid';
          validatePass = listen == 'invalid-match';
          if (key1.currentState.validate()) {
            key1.currentState.save();
            // for (int i = 0; i < Accounts.getLength(); i++) {
            //   if (Accounts.accounts[i].phoneNumber == phoneNumber) {
            //     Accounts.currentAccount = i;
            //   }
            // }
            String listen = '';
            await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
              print('connected writer');
              String write = 'RestaurantGetData-account-' + MyApp.id;
              write = (write.length + 11).toString() + ',Restaurant-' + write;
              serverSocket.write(write);
              serverSocket.flush();
              print('write: ' + write);
              print('connected listen');
              serverSocket.listen((socket) {
                listen = String.fromCharCodes(socket).trim().substring(2);
              }).onDone(() {
                print("listen: " + listen);
                // Restaurant restaurant =start(listen) ;
                runMenu(start(listen));
                print("Welcome to Chamir food");
                print('A: ' + Accounts.accounts.toString());
                print('CA: ' + Accounts.currentAccount.toString());
                Navigator.pushNamed(context, '/MainMenuScreen');
              });
            });
          } else {
            validate = false;
            validatePass = false;
          }
        });
      });
    }
  }

  void runMenu(Restaurant restaurant) async {
    if (restaurant != null) {
      String listen = '';
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        String write = 'RestaurantGetData-categories-' + MyApp.id;
        write = (write.length + 11).toString() + ',Restaurant-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() async {
          print("listen: " + listen);
          if (listen != null && listen.isNotEmpty && listen != ' All') {
            List<String> split = listen.split(', ');
            for (int i = 1; i < split.length; i++) {
              restaurant.addTabBarTitle(split[i], null, addFood: false);
            }
            String listenFood = '';
            await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
              print('connected writer');
              String write = 'RestaurantGetData-menu-' + MyApp.id;
              write = (write.length + 11).toString() + ',Restaurant-' + write;
              serverSocket.write(write);
              serverSocket.flush();
              print('write: ' + write);
              print('connected listen');
              serverSocket.listen((socket) {
                listenFood = String.fromCharCodes(socket).trim().substring(2);
              }).onDone(() {
                print("listen: " + listenFood);
                if (listenFood != null && listenFood.isNotEmpty) {
                  List<String> menu = listenFood.split('\n');
                  for (int i = 0; i < menu.length; i++) {
                    List<String> strings = menu[i].split(', ');
                    List<String> firstString = strings[0].split(':');
                    if (firstString[1] != 'All') {
                      RestaurantFoodTile food = RestaurantFoodTile(
                        firstString[2],
                        strings[2],
                        strings[3] == 'true',
                        firstString[1],
                        desc: (strings[1] == 'null' ? '' : strings[1]),
                        orderCount: int.parse(strings[4]),
                      );
                      food.orderCount = int.parse(strings[4]);
                      restaurant.addTabBarViewElements(
                          food, split.indexOf(firstString[1]));
                    }
                  }
                }
              });
            });
          }
        });
      });
    }
  }

  Restaurant start(String ans) {
    if (ans != null && ans.isNotEmpty) {
      Accounts.key = true;
      List<String> strings = ans.split(', ');
      Accounts.accounts = [];
      Restaurant restaurant = Accounts.addAccount(
          strings[1],
          ans.substring(0, ans.indexOf(':')),
          strings[2],
          strings[3],
          strings[4],
          strings[5]);
      if (strings[6] != 'null') {
        restaurant.email = strings[6];
      }
      if (strings[7] != 'null') {
        restaurant.address = strings[7];
      }
      if (strings[8] != 'null') {
        String latitude = strings[8]
            .substring(strings[8].indexOf(':') + 1, strings[8].indexOf(':::'));
        String longitude = strings[8].substring(
            strings[8].lastIndexOf(':') + 1, strings[8].indexOf(')'));
        LatLng latLng = LatLng(double.parse(latitude), double.parse(longitude));
        restaurant.location = latLng;
        RestaurantProfileScreen.tappedPoints.add(latLng);
      }
      if (strings[9] != 'null') {
        restaurant.radiusOfWork = double.parse(strings[9]);
      }
      restaurant.point = double.parse(strings[10]);
      print('start');
      return restaurant;
    }
    return null;
  }
}
//hint signup yekish bozorge yekish koochik
// porrang tar boodan bordere errorStyle password az baqie border errorStyle ha
//ezafe kardan hint(hadaqal 6 char) be password sign in va tafkik error haye password
//age aval pop kone bad push mishe safhe haye qabl ro pak kard joori ke emkan back nabashe(dar SignIn va SignUp)?
//ja be ja kardan tartib field password va phoneNumber
//virayesh menu be soorat rowi az chip ha bashad dar oaiin ya balaye safhe ba entekhab chand daste az menu tedad azaye an daste namayesh dade shavad
