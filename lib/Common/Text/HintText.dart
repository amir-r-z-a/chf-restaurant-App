import 'package:flutter/material.dart';

class HintText extends StatelessWidget {
  final String text;

  HintText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Color.fromRGBO(209, 214, 219, 1)),
      ),
    );
  }
}
