import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isObscure = true;
  RegExp regPassword =
  new RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$", multiLine: false);
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  TextEditingController _editingController;
  String initialText = Accounts.accounts[Accounts.currentAccount].name;
  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }@override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              margin:EdgeInsets.fromLTRB(50, 0, 50, 50),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink),
                 borderRadius: BorderRadius.circular(100),
              ),
            ),
            ElevatedButton(onPressed:(){
              getImage() ;
            },
                child: Text ("pick image")),
            Container(
              height: 50,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name : "),
                      Text(Accounts.accounts[Accounts.currentAccount].name),
                      SingleChildScrollView(
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context:context,
                                builder: (context){
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                                    child: Form(
                                      key: _formkey,
                                      child: ListView(
                                        children: [
                                          MyTextFormField(
                                            "Edit" ,
                                            index: 1,
                                            addToAccounts: true,
                                            initial: Accounts.accounts[Accounts.currentAccount].name,
                                          ),
                                          ElevatedButton(onPressed: (){
                                            if(_formkey.currentState.validate()){
                                              setState(() {
                                                _formkey.currentState.save();
                                                print(Accounts.accounts[Accounts.currentAccount].name);
                                              }
                                              );
                                            }

                                          },
                                              child: Text("Save"
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          child: Icon(
                            Icons.edit_rounded,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Phone Number : "),
                      Text(Accounts.accounts[Accounts.currentAccount].phoneNumber),
                      SingleChildScrollView(
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context:context,
                                builder: (context){
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                                    child: Form(
                                      key: _formkey,
                                      child: ListView(
                                        children: [
                                          MyTextFormField(
                                            "Edit" ,
                                            index: 2,
                                            addToAccounts: true,
                                            initial: Accounts.accounts[Accounts.currentAccount].phoneNumber,
                                          ),
                                          ElevatedButton(onPressed: (){
                                            if(_formkey.currentState.validate()){
                                              setState(() {
                                                _formkey.currentState.save();
                                                print(Accounts.accounts[Accounts.currentAccount].phoneNumber);
                                              }
                                              );
                                            }
                                          },
                                              child: Text("Save"
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          child: Icon(
                            Icons.edit_rounded,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Password : "),
                      // Text(Accounts.accounts[Accounts.currentAccount].password),
                      SingleChildScrollView(
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context:context,
                                builder: (context){
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                                    child: Form(
                                      key: _formkey,
                                      child: ListView(
                                        children: [
                                          TextFormField(
                                            onSaved: (String value) {
                                              MyTextFormField.password = value;
                                            },
                                            validator: (String entereddate) {
                                              if (entereddate.isEmpty || entereddate == null) {
                                                return "you must fill this box";
                                              }
                                              if (!(regPassword.hasMatch(entereddate))) {
                                                return 'Your password should contain at least one number and one letter';
                                              }
                                              return null;
                                            },
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
                                          ElevatedButton(onPressed: (){
                                            if(_formkey.currentState.validate()){
                                              setState(() {
                                                _formkey.currentState.save();
                                                print(Accounts.accounts[Accounts.currentAccount].name);
                                              }
                                              );
                                            }

                                          },
                                              child: Text("Save"
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          child: Icon(
                            Icons.edit_rounded,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email : "),
                      Text(Accounts.accounts[Accounts.currentAccount].email!=null?Accounts.accounts[Accounts.currentAccount].email:" "),
                      SingleChildScrollView(
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context:context,
                                builder: (context){
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                                    child: Form(
                                      key: _formkey,
                                      child: ListView(
                                        children: [
                                          MyTextFormField(
                                            "Edit" ,
                                            index: 7,
                                            addToAccounts: true,
                                            initial: Accounts.accounts[Accounts.currentAccount].email,
                                          ),
                                          ElevatedButton(onPressed: (){
                                            if(_formkey.currentState.validate()){
                                              setState(() {
                                                _formkey.currentState.save();
                                                print(Accounts.accounts[Accounts.currentAccount].email);
                                              }
                                              );
                                            }
                                          },
                                              child: Text("Save"
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          child: Icon(
                            Icons.edit_rounded,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Address : "),
                      Text(Accounts.accounts[Accounts.currentAccount].email!=null?Accounts.accounts[Accounts.currentAccount].address:" "),
                      SingleChildScrollView(
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context:context,
                                builder: (context){
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                                    child: Form(
                                      key: _formkey,
                                      child: ListView(
                                        children: [
                                          MyTextFormField(
                                            "Edit" ,
                                            index: 7,
                                            addToAccounts: true,
                                            initial: Accounts.accounts[Accounts.currentAccount].address,
                                          ),
                                          ElevatedButton(onPressed: (){
                                            if(_formkey.currentState.validate()){
                                              setState(() {
                                                _formkey.currentState.save();
                                                print(Accounts.accounts[Accounts.currentAccount].address);
                                              }
                                              );
                                            }
                                          },
                                              child: Text("Save"
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          child: Icon(
                            Icons.edit_rounded,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

