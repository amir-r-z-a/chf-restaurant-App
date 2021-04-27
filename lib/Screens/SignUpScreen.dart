import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/Common/Text/TitleText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  var _formkey = GlobalKey<FormState>();
  int selectedRadio;
  bool _isObscure = true ;
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
                  margin: EdgeInsets.fromLTRB(25, 50, 0, 0),
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
                        hint: "your name",
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      TextFormField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed:() {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                          ),
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
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20,166, 0),
                          child: TitleText("Select your restaurant type : ",)
                      ),
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
                                Text("Other Types"),
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
              ElevatedButton(
                  child: Text(""),
                onPressed: (){
                    if(_formkey.currentState.validate()){
                      setState(() {
                        _formkey.currentState.save();
                      });
                    }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
