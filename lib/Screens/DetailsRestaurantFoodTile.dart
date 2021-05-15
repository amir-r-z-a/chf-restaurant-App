import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsRestaurantFoodTile extends StatefulWidget {
  static String name;
  static String desc;
  static String price;
  static bool foodStatus;
  static Function deleteFunction;
  Function function;
  static Function topTenTile;
  static Function detailsTopTenFoods;
  static Function commentsManagements;

  DetailsRestaurantFoodTile({this.function});

  // DetailsFoodTile({String name, double price, bool status, String desc}) {
  //   print(name);
  //   DetailsFoodTile.name = (name != null ? name : ' ');
  //   DetailsFoodTile.desc = (desc != null ? desc : ' ');
  //   DetailsFoodTile.price = price;
  //   DetailsFoodTile.status = status;
  // }

  @override
  _DetailsRestaurantFoodTileState createState() =>
      _DetailsRestaurantFoodTileState();
}

class _DetailsRestaurantFoodTileState extends State<DetailsRestaurantFoodTile> {
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
                          initial: DetailsRestaurantFoodTile.name,
                        ),
                        TextFormField(
                          initialValue: DetailsRestaurantFoodTile.desc,
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
                          initial: DetailsRestaurantFoodTile.price,
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(248, 95, 106, 1)),
                          onPressed: () {
                            if (key1.currentState.validate()) {
                              setState(() {
                                key1.currentState.save();
                                String oldName = DetailsRestaurantFoodTile.name;
                                DetailsRestaurantFoodTile.name =
                                    MyTextFormField.foodName;
                                DetailsRestaurantFoodTile.desc =
                                    MyTextFormField.foodDesc;
                                DetailsRestaurantFoodTile.price =
                                    MyTextFormField.foodPrice;
                                Accounts.accounts[Accounts.currentAccount]
                                    .editTopTenFoodsElements(
                                        oldName,
                                        DetailsRestaurantFoodTile.name,
                                        DetailsRestaurantFoodTile.desc,
                                        DetailsRestaurantFoodTile.price);
                                Accounts.accounts[Accounts.currentAccount]
                                    .editCommentsName(oldName,
                                        DetailsRestaurantFoodTile.name);
                                if (DetailsRestaurantFoodTile
                                        .detailsTopTenFoods !=
                                    null) {
                                  DetailsRestaurantFoodTile
                                      .detailsTopTenFoods();
                                }
                                if (DetailsRestaurantFoodTile.topTenTile !=
                                    null) {
                                  DetailsRestaurantFoodTile.topTenTile();
                                }
                                if (DetailsRestaurantFoodTile
                                        .commentsManagements !=
                                    null) {
                                  DetailsRestaurantFoodTile
                                      .commentsManagements();
                                }
                                widget.function();
                                Navigator.pop(context);
                              });
                            }
                          },
                          child: Text('Save'),
                        )
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
              DetailsRestaurantFoodTile.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Text(DetailsRestaurantFoodTile.desc),
            Padding(padding: EdgeInsets.all(3)),
            Text('Price: ' + '\$' + DetailsRestaurantFoodTile.price.toString()),
            Row(
              children: [
                Switch(
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red,
                  activeTrackColor: Color.fromRGBO(0, 181, 0, 1),
                  activeColor: Color.fromRGBO(0, 181, 0, 1),
                  value: DetailsRestaurantFoodTile.foodStatus,
                  onChanged: (value) {
                    setState(() {
                      Accounts.accounts[Accounts.currentAccount]
                          .topTenFoodsSwitch(DetailsRestaurantFoodTile.name);
                      DetailsRestaurantFoodTile.foodStatus =
                          !DetailsRestaurantFoodTile.foodStatus;
                    });
                    widget.function();
                  },
                ),
                Text(
                  DetailsRestaurantFoodTile.foodStatus ? 'Active' : 'Inactive',
                  style: TextStyle(
                      color: DetailsRestaurantFoodTile.foodStatus
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                return DetailsRestaurantFoodTile.deleteFunction(true);
              },
              child: Container(
                height: 25,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(width: 0.7, color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
