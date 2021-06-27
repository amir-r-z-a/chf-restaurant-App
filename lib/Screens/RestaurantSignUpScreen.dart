import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Request.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Common/Text/GrayText.dart';
import 'package:chfrestaurant/Common/Text/MyPassFormField.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/Common/Text/TitleText.dart';
import 'package:chfrestaurant/Common/Text/WhiteText.dart';
import 'package:chfrestaurant/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class RestaurantSignUpScreen extends StatefulWidget {
  @override
  _RestaurantSignUpScreenState createState() => _RestaurantSignUpScreenState();
}

class _RestaurantSignUpScreenState extends State<RestaurantSignUpScreen> {
  var _formkey = GlobalKey<FormState>();
  var _formkey2 = GlobalKey<FormState>();
  int selectedRadio;
  TextEditingController _controller = TextEditingController();
  bool validate = false;
  bool validate2 = false;

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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Form(
                      key: _formkey2,
                      child: TextFormField(
                        cursorColor: Color.fromRGBO(248, 95, 106, 1),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter something";
                          } else if (validate2) {
                            return 'Your phone number is not valid';
                          } else if (validate) {
                            return 'Your phone number is already registered';
                          }
                          return null;
                        },
                        controller: _controller,
                        onSaved: (newValue) =>
                            MyTextFormField.phoneNumber = newValue,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            color: Color.fromRGBO(248, 95, 106, 1),
                          ),
                          labelText: 'PhoneNumber',
                          labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(248, 95, 106, 1)),
                          hintText: 'Your Phone Number',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(209, 214, 219, 1),
                          ),
                        ),
                      ),
                      // MyTextFormField(
                      //   "Phone number",
                      //   index: 2,
                      //   hint: "Your Phone number",
                      //   regex: 'PNSignUp',
                      // ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          MyTextFormField(
                            "Name",
                            hint: "Your name",
                            index: 1,
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          MyPassFormField(
                            'Password',
                            regex: 'PassSignUp',
                            hint: 'Your password',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: DateTimePicker(
                                    style: TextStyle(
                                      color: Color.fromRGBO(248, 95, 106, 1),
                                    ),
                                    type: DateTimePickerType.time,
                                    icon: Icon(Icons.watch_later_outlined),
                                    timeLabelText: "Hour",
                                    decoration: InputDecoration(
                                      labelText: " Entrance Time",
                                      counterStyle: TextStyle(
                                        color: Color.fromRGBO(248, 95, 106, 1),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Color.fromRGBO(248, 95, 106, 1),
                                      ),
                                      icon: Icon(Icons.watch_later_outlined),
                                      hoverColor:
                                          Color.fromRGBO(248, 95, 106, 1),
                                      focusColor:
                                          Color.fromRGBO(248, 95, 106, 1),
                                      fillColor:
                                          Color.fromRGBO(248, 95, 106, 1),
                                    ),
                                    cursorColor:
                                        Color.fromRGBO(248, 95, 106, 1),
                                    selectableDayPredicate: (date) {
                                      // Disable weekend days to select from the calendar
                                      if (date.weekday == 6 ||
                                          date.weekday == 7) {
                                        return false;
                                      }
                                      return true;
                                    },
                                    onChanged: (val) {
                                      MyTextFormField.open = val;
                                      print('changed1: ' + val);
                                    },
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return "Please enter this field";
                                      }
                                      if (!Accounts.validOpenClose(
                                          MyTextFormField.open,
                                          MyTextFormField.close)) {
                                        return "Opening time is after closing";
                                      }
                                      print('val1: ' + val);
                                      return null;
                                    },
                                    onSaved: (val) {
                                      print('saved1: ' + val);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: DateTimePicker(
                                    style: TextStyle(
                                      color: Color.fromRGBO(248, 95, 106, 1),
                                    ),
                                    type: DateTimePickerType.time,
                                    icon: Icon(Icons.watch_later_outlined),
                                    timeLabelText: "Hour",
                                    decoration: InputDecoration(
                                      labelText: " leaving hour ",
                                      counterStyle: TextStyle(
                                        color: Color.fromRGBO(248, 95, 106, 1),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Color.fromRGBO(248, 95, 106, 1),
                                      ),
                                      icon: Icon(Icons.watch_later),
                                      hoverColor:
                                          Color.fromRGBO(248, 95, 106, 1),
                                      focusColor:
                                          Color.fromRGBO(248, 95, 106, 1),
                                      fillColor:
                                          Color.fromRGBO(248, 95, 106, 1),
                                    ),
                                    cursorColor:
                                        Color.fromRGBO(248, 95, 106, 1),
                                    selectableDayPredicate: (date) {
                                      print('date: ' + date.toString());
                                      // Disable weekend days to select from the calendar
                                      if (date.weekday == 6 ||
                                          date.weekday == 7) {
                                        return false;
                                      }
                                      return true;
                                    },
                                    onChanged: (val) {
                                      MyTextFormField.close = val;
                                      print('changed2: ' + val);
                                    },
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return "Please enter this field";
                                      }
                                      if (!Accounts.validOpenClose(
                                          MyTextFormField.open,
                                          MyTextFormField.close)) {
                                        return "Opening time is after closing";
                                      }
                                      print('val2: ' + val);
                                      return null;
                                    },
                                    onSaved: (val) {
                                      print('saved2: ' + val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Padding(padding: EdgeInsets.all(15)),
                    // MyTextFormField(
                    //   "Address",
                    //   hint: "Your Address",
                    //   index: 3,
                    // ),

                    // Padding(padding: EdgeInsets.all(15)),
                    // MyTextFormField('Radius of works'),

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
                    onPressed: () => checker(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void checker() async {
    print('starttt');
    bool validAll = _formkey.currentState.validate();
    if (Accounts.validPhoneNumber(_controller.text)) {
      setState(() {
        validate2 = true;
        _formkey2.currentState.validate();
      });
    } else {
      validate2 = false;
      String listen = '';
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        String write =
            'RestaurantSignUp-alreadyPhoneNumber-' + _controller.text;
        write = (write.length + 11).toString() + ',Restaurant-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() {
          print("listen: " + listen);
          bool flag = listen != 'invalid';
          // print('one: ' + flag.toString());
          if (flag) {
            // setState(() {
            validate = true;
            _formkey2.currentState.validate();
            // });
          } else {
            validate = false;
            _formkey2.currentState.validate();
          }
          // print('two: ' + flag.toString());
          if (validAll && !flag) {
            // setState(() {
            _formkey.currentState.save();
            _formkey2.currentState.save();
            if (selectedRadio == 0) {
              MyTextFormField.type = RestaurantTypes.Other;
            } else if (selectedRadio == 1) {
              MyTextFormField.type = RestaurantTypes.Cafe;
            } else if (selectedRadio == 2) {
              MyTextFormField.type = RestaurantTypes.FastFood;
            } else if (selectedRadio == 3) {
              MyTextFormField.type = RestaurantTypes.IranianRestaurant;
            }
            Accounts.addAccount(
                MyTextFormField.name,
                MyTextFormField.phoneNumber,
                MyTextFormField.password,
                MyTextFormField.open,
                MyTextFormField.close,
                MyTextFormField.type.toString());
            print('add account');
            Navigator.pushNamed(context, "/SignInScreen");
            // print(selectedRadio) ;
            // print('-------------------------');
            // print("saved");
            // print('Your len is:');
            // print(Accounts.getLength());
            // print('-------------------------');
            // for (int i = 0; i < Accounts.getLength(); i++) {
            //   print('index: ');
            //   print(i);
            //   print(Accounts.accounts[i].name);
            //   print(Accounts.accounts[i].phoneNumber);
            //   print(Accounts.accounts[i].password);
            //   print(Accounts.accounts[i].address);
            //   print(Accounts.accounts[i].type);
            //   print('-------------------------');
            // }

            //zadan class text baraye type
            //border ha
            // });
          }
        });
        // serverSocket.close();
      });
    }
  }
}

// DateTimePicker(
//   initialValue: '',
//   firstDate: DateTime(2000),
//   lastDate: DateTime(2100),
//   dateLabelText: 'Date',
//   onChanged: (val) => print(val),
//   validator: (val) {
//     print(val);
//     return null;
//   },
//   onSaved: (val) => print(val),
// ),

// TextButton(
//   onPressed: () {
//     DatePicker.showDatePicker(context,
//         showTitleActions: true,
//         minTime: DateTime(2018, 3, 5),
//         maxTime: DateTime(2019, 6, 7), onChanged: (date) {
//       print('change $date');
//     }, onConfirm: (date) {
//       print('confirm $date');
//     },
//         currentTime: DateTime.now(),
//         locale: LocaleType.zh);
//   },
//   child: Text(
//     'show date time picker (Chinese)',
//     style: TextStyle(color: Colors.blue),
//   ),
// ),

// DateTimePicker(
//   type: DateTimePickerType.dateTimeSeparate,
//   dateMask: 'd MMM, yyyy',
//   initialValue: DateTime.now().toString(),
//   firstDate: DateTime(2000),
//   lastDate: DateTime(2100),
//   icon: Icon(Icons.event),
//   dateLabelText: 'Date',
//   timeLabelText: "Hour",
//   selectableDayPredicate: (date) {
//     // Disable weekend days to select from the calendar
//     if (date.weekday == 6 || date.weekday == 7) {
//       return false;
//     }
//
//     return true;
//   },
//   onChanged: (val) => print(val),
//   validator: (val) {
//     print(val);
//     return null;
//   },
//   onSaved: (val) => print(val),
// ),

// Padding(padding: EdgeInsets.all(15)),
//TimePicker for open and close
