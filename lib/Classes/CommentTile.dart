import 'package:chfrestaurant/Classes/Date.dart';
import 'package:flutter/material.dart';

class CommentTile extends StatefulWidget {
  String _question;
  String _answer;
  String _clientPhoneNumber;
  String _destinationRestaurant;
  String foodName;
  String _point;
  Date _date;
  String _id;

  CommentTile(this._question, this.foodName, this._date,
      this._clientPhoneNumber, this._destinationRestaurant);

  String get question => _question;

  set question(String value) {
    _question = value;
  }

  String get answer => _answer;

  set answer(String value) {
    _answer = value;
  }

  String get clientPhoneNumber => _clientPhoneNumber;

  set clientPhoneNumber(String value) {
    _clientPhoneNumber = value;
  }

  Date get date => _date;

  set date(Date value) {
    _date = value;
  }

  String get point => _point;

  set point(String value) {
    _point = value;
  }

  String get destinationRestaurant => _destinationRestaurant;

  set destinationRestaurant(String value) {
    _destinationRestaurant = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tab');
      },
      child: SizedBox(
        height: 300,
        child: Card(
          child: ListTile(
              isThreeLine: true,
              subtitle: Text(widget.date.dateFormatter() +
                  '\n' +
                  // '#' +
                  widget.foodName),
              title: Text(widget.question)),
        ),
      ),
    );
  }
}
//agar karbar tarikh ra injoori vared kard 2012/3/2 barname injoori tabdil konad 2012/03/02