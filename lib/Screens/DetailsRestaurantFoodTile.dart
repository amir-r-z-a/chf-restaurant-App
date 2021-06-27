import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetailsRestaurantFoodTile extends StatefulWidget {
  static String category;
  static String name;
  static String desc;
  static String price;
  static bool foodStatus;
  static Function deleteFunction;
  Function function;
  static Function topTenTile;
  static Function detailsTopTenFoods;
  static Function commentsManagements;
  static Function activeOrders;

  DetailsRestaurantFoodTile({this.function});

  //chera ba constructor nashod? field haye static ham nemishod ba constructor meqdar dad
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
                        MyTextFormField(
                          'Desc',
                          index: 7,
                          initial: DetailsRestaurantFoodTile.desc,
                          hint: 'New desc',
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
                          onPressed: () async {
                            if (key1.currentState.validate()) {
                              String oldName = '';
                              setState(() {
                                key1.currentState.save();
                                oldName = DetailsRestaurantFoodTile.name;
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
                                Accounts.accounts[Accounts.currentAccount]
                                    .editActiveOrdersName(oldName,
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
                                if (DetailsRestaurantFoodTile.activeOrders !=
                                    null) {
                                  DetailsRestaurantFoodTile.activeOrders();
                                }
                                widget.function();
                              });
                              String listen = '';
                              await Socket.connect(MyApp.ip, 2442)
                                  .then((serverSocket) {
                                print('connected writer');
                                String write =
                                    'RestaurantMenuEdition-editOther-' +
                                        MyApp.id +
                                        '-' +
                                        DetailsRestaurantFoodTile.category +
                                        '-' +
                                        oldName +
                                        '-' +
                                        DetailsRestaurantFoodTile.name +
                                        '-' +
                                        ((DetailsRestaurantFoodTile.desc ==
                                                    null ||
                                                DetailsRestaurantFoodTile
                                                    .desc.isEmpty)
                                            ? 'null'
                                            : DetailsRestaurantFoodTile.desc) +
                                        '-' +
                                        DetailsRestaurantFoodTile.price;
                                write = (write.length + 11).toString() +
                                    ',Restaurant-' +
                                    write;
                                serverSocket.write(write);
                                serverSocket.flush();
                                print('write: ' + write);
                                print('connected listen');
                                serverSocket.listen((socket) {
                                  listen = String.fromCharCodes(socket)
                                      .trim()
                                      .substring(2);
                                }).onDone(() {
                                  print("listen: " + listen);
                                  Navigator.pop(context);
                                });
                                // serverSocket.close();
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
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            TextButton(
              child: Text(
                'Set New Photo',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () => getImage(),
            ),
            // Padding(padding: EdgeInsets.all(5)),
            Text(
              DetailsRestaurantFoodTile.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Text(DetailsRestaurantFoodTile.desc),
            Padding(padding: EdgeInsets.all(3)),
            Text('Price: ' + '\$' + DetailsRestaurantFoodTile.price.toString()),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Row(
                  children: [
                    Switch(
                      inactiveThumbColor: Colors.red,
                      inactiveTrackColor: Colors.red,
                      activeTrackColor: Color.fromRGBO(0, 181, 0, 1),
                      activeColor: Color.fromRGBO(0, 181, 0, 1),
                      value: DetailsRestaurantFoodTile.foodStatus,
                      onChanged: (value) async {
                        setState(() {
                          Accounts.accounts[Accounts.currentAccount]
                              .topTenFoodsSwitch(
                                  DetailsRestaurantFoodTile.name);
                          DetailsRestaurantFoodTile.foodStatus =
                              !DetailsRestaurantFoodTile.foodStatus;
                        });
                        widget.function();
                        String listen = '';
                        await Socket.connect(MyApp.ip, 2442)
                            .then((serverSocket) {
                          print('connected writer');
                          String write = 'RestaurantMenuEdition-editStatus-' +
                              MyApp.id +
                              '-' +
                              DetailsRestaurantFoodTile.category +
                              '-' +
                              DetailsRestaurantFoodTile.name +
                              '-' +
                              DetailsRestaurantFoodTile.foodStatus.toString();
                          write = (write.length + 11).toString() +
                              ',Restaurant-' +
                              write;
                          serverSocket.write(write);
                          serverSocket.flush();
                          print('write: ' + write);
                          print('connected listen');
                          serverSocket.listen((socket) {
                            listen = String.fromCharCodes(socket)
                                .trim()
                                .substring(2);
                          }).onDone(() {
                            print("listen: " + listen);
                          });
                          // serverSocket.close();
                        });
                      },
                    ),
                    Text(
                      DetailsRestaurantFoodTile.foodStatus
                          ? 'Active'
                          : 'Inactive',
                      style: TextStyle(
                          color: DetailsRestaurantFoodTile.foodStatus
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
