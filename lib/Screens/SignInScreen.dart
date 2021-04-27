import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
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
        child: ListView(children: [
          MyTextFormField(
            1,
            "Name",
            hint: "hiiiii",
          ),
          MyTextFormField(
            2,
            "password",
          ),
          ElevatedButton(
              onPressed: () {
                if (key1.currentState.validate()) {
                  key1.currentState.save();
                  print("done");
                  print(MyTextFormField.name);
                  print(MyTextFormField.password);
                }
              },
              child: Text("Continue"))
        ]),
      ),
    );
  }
}
