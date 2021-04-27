import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Common/Text/GrayText.dart';
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
  bool _isObscure = true;

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
                      TextFormField(
                        onSaved: (String value) {
                          MyTextFormField.password = value;
                        },
                        validator: (String value) {
                          if (value.isEmpty || value == null) {
                            return "Please enter something";
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          focusedBorder:OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromRGBO(248, 95, 106, 1), width: 2.0)
                          ),
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
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
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
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      MyTextFormField(
                        "Phone number",
                        index: 2,
                        hint: "Your Phone number",
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      MyTextFormField(
                        "Address",
                        hint: "Your Address",
                        index: 3,
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 166, 0),
                          child: TitleText(
                            "Select your restaurant type : ",
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.only(right: 10)),
                            Text("Fast Food"),
                            Padding(padding: EdgeInsets.only(right: 10)),
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
                                Text("Iranian Food"),
                                // Padding(padding: EdgeInsets.all(10)),
                                Radio(
                                  value: 3,
                                  groupValue: selectedRadio,
                                  activeColor: Colors.pink,
                                  onChanged: (val) {
                                    print("Radio $val");
                                    setSelectedRadio(val);
                                  },
                                )
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
                            Padding(padding: EdgeInsets.only(right: 10)),
                            Text("Cafe"),
                            Padding(padding: EdgeInsets.only(right: 25)),
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
                                Text("Other"),
                                Padding(padding: EdgeInsets.only(right: 0)),
                                // Padding(padding: EdgeInsets.all(10)),
                                Radio(
                                  value: 0,
                                  groupValue: selectedRadio,
                                  activeColor: Colors.pink,
                                  onChanged: (val) {
                                    print("Radio $val");
                                    setSelectedRadio(val);
                                  },
                                )
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
                        print("sign in taped");
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
                  constraints: BoxConstraints.tightFor(width: 200, height: 50),
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
                          print("saved");
                          // print(selectedRadio) ;
                          print(Accounts.getLength());
                          print(Accounts.accounts[2].name);
                          print(Accounts.accounts[2].phoneNumber);
                          print(Accounts.accounts[2].password);
                          print(Accounts.accounts[2].address);
                          print(Accounts.accounts[2].type);
                          //null kardan oona
                          //navigate kardan
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
