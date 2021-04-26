import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Sign up"),
            Form(
                key: _formkey,
                child: ListView(
                  children: [
                    TextFormField()
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
