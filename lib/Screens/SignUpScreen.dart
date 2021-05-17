import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Common/Text/GrayText.dart';
import 'package:chfrestaurant/Common/Text/MyPassFormField.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/Common/Text/TitleText.dart';
import 'package:chfrestaurant/Common/Text/WhiteText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _formkey = GlobalKey<FormState>();
  int selectedRadio;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(25, 30, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                        hint: "Your name",
                        index: 1,
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      MyTextFormField(
                        "Phone number",
                        index: 2,
                        hint: "Your Phone number",
                        regex: 'PNSignUp',
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      MyPassFormField(
                        'Password',
                        regex: 'PassSignUp',
                        hint: 'Your password',
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      MyTextFormField(
                        "Address",
                        hint: "Your Address",
                        index: 3,
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      MyTextFormField('Radius of works'),
                      // Padding(padding: EdgeInsets.all(15)),
                      //TimePicker for open and close
                      Padding(padding: EdgeInsets.all(10)),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 166, 0),
                        child: TitleText(
                          "Select your restaurant type : ",
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonBar(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: selectedRadio,
                                  activeColor: Colors.pink,
                                  onChanged: (val) {
                                    print("Radio $val");
                                    setSelectedRadio(val);
                                  },
                                ),
                                Text("Fast Food"),
                                Radio(
                                  value: 3,
                                  groupValue: selectedRadio,
                                  activeColor: Colors.pink,
                                  onChanged: (val) {
                                    print("Radio $val");
                                    setSelectedRadio(val);
                                  },
                                ),
                                Text("Iranian Food"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonBar(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: selectedRadio,
                                  activeColor: Colors.pink,
                                  onChanged: (val) {
                                    print("Radio $val");
                                    setSelectedRadio(val);
                                  },
                                ),
                                Text("Cafe"),
                                Padding(padding: EdgeInsets.only(left: 25)),
                                Radio(
                                  value: 0,
                                  groupValue: selectedRadio,
                                  activeColor: Colors.pink,
                                  onChanged: (val) {
                                    print("Radio $val");
                                    setSelectedRadio(val);
                                  },
                                ),
                                Text("Other"),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GrayText("Have an Account ?", 0xff989eb1, 16),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/SignInScreen");
                      },
                      child: TitleText(
                        'Sign In',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 320, height: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(248, 95, 106, 1),
                    ),
                    child: WhiteText("Continue"),
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        setState(() {
                          _formkey.currentState.save();
                          if (selectedRadio == 0) {
                            MyTextFormField.type = RestaurantTypes.Other;
                          } else if (selectedRadio == 1) {
                            MyTextFormField.type = RestaurantTypes.Cafe;
                          } else if (selectedRadio == 2) {
                            MyTextFormField.type = RestaurantTypes.FastFood;
                          } else if (selectedRadio == 3) {
                            MyTextFormField.type =
                                RestaurantTypes.IranianRestaurant;
                          }
                          Accounts.addAccount(Restaurant(
                              MyTextFormField.name,
                              MyTextFormField.phoneNumber,
                              MyTextFormField.password,
                              MyTextFormField.address,
                              MyTextFormField.type));
                          Navigator.pushNamed(context, "/SignInScreen");
                          // print(selectedRadio) ;
                          print('-------------------------');
                          print("saved");
                          print('Your len is:');
                          print(Accounts.getLength());
                          print('-------------------------');
                          for (int i = 0; i < Accounts.getLength(); i++) {
                            print('index: ');
                            print(i);
                            print(Accounts.accounts[i].name);
                            print(Accounts.accounts[i].phoneNumber);
                            print(Accounts.accounts[i].password);
                            print(Accounts.accounts[i].address);
                            print(Accounts.accounts[i].type);
                            print('-------------------------');
                          }
                          //zadan class text baraye type
                          //border ha
                        });
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
