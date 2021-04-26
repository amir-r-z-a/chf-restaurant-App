import 'package:flutter/material.dart';
class SignUpTextFormFields extends StatelessWidget {
  String input ;
  SignUpTextFormFields(this.input);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color(0xfff85f6a),
      decoration: InputDecoration(
        labelText: input ,
      ),
    );
  }
}
