import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsFoodTile extends StatefulWidget {
  static String name;
  static String desc;
  static String price;
  static bool foodStatus;
  Function function;

  DetailsFoodTile({this.function});

  static bool validPrice(String input) {
    //^([1-9][0-9]*)|([1-9][0-9]*\\.[0-9]+)$
    RegExp regPrice = new RegExp(
        r'^((\d{1,3}|\s*){1})((\,\d{3}|\d)*)(\s*|\.(\d{2}))$',
        caseSensitive: false,
        multiLine: false);
    if (!regPrice.hasMatch(input)) {
      return true;
    }
    return false;
  }

  // DetailsFoodTile({String name, double price, bool status, String desc}) {
  //   print(name);
  //   DetailsFoodTile.name = (name != null ? name : ' ');
  //   DetailsFoodTile.desc = (desc != null ? desc : ' ');
  //   DetailsFoodTile.price = price;
  //   DetailsFoodTile.status = status;
  // }

  @override
  _DetailsFoodTileState createState() => _DetailsFoodTileState();
}

class _DetailsFoodTileState extends State<DetailsFoodTile> {
  var key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Form(
                    key: key1,
                    child: ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        Text(
                          'Edit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                        MyTextFormField(
                          'Name',
                          hint: 'New name',
                          index: 5,
                          regex: 'FoodName',
                          initial: DetailsFoodTile.name,
                        ),
                        TextFormField(
                          initialValue: DetailsFoodTile.desc,
                          onSaved: (String value) =>
                              MyTextFormField.foodDesc = value,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Color.fromRGBO(248, 95, 106, 1),
                            ),
                            labelText: 'Desc',
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(248, 95, 106, 1)),
                            hintText: 'New desc',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(209, 214, 219, 1),
                            ),
                          ),
                        ),
                        MyTextFormField(
                          'Price',
                          hint: 'New price (example: 28.40)',
                          regex: 'Price',
                          index: 6,
                          initial: DetailsFoodTile.price,
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(248, 95, 106, 1)),
                            onPressed: () {
                              if (key1.currentState.validate()) {
                                setState(() {
                                  key1.currentState.save();
                                  DetailsFoodTile.name =
                                      MyTextFormField.foodName;
                                  DetailsFoodTile.desc =
                                      MyTextFormField.foodDesc;
                                  DetailsFoodTile.price =
                                      MyTextFormField.foodPrice;
                                  widget.function();
                                  Navigator.pop(context);
                                });
                              }
                            },
                            child: Text('Save'))
                      ],
                    ),
                  ),
                );
              },
              child: Icon(Icons.edit))
        ],
        centerTitle: true,
        title: Text('Details'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Container(
              height: 370,
              width: 370,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              DetailsFoodTile.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Text(DetailsFoodTile.desc),
            Padding(padding: EdgeInsets.all(3)),
            Text('Price: ' + DetailsFoodTile.price.toString() + '\$'),
            Row(
              children: [
                Switch(
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red,
                  activeTrackColor: Color.fromRGBO(0, 181, 0, 1),
                  activeColor: Color.fromRGBO(0, 181, 0, 1),
                  value: DetailsFoodTile.foodStatus,
                  onChanged: (value) {
                    setState(() {
                      DetailsFoodTile.foodStatus = !DetailsFoodTile.foodStatus;
                    });
                    widget.function();
                  },
                ),
                Text(
                  DetailsFoodTile.foodStatus ? 'Active' : 'Inactive',
                  style: TextStyle(
                      color: DetailsFoodTile.foodStatus
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
