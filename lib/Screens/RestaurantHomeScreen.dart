import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/RestaurantInactiveOrderTile.dart';
import 'package:chfrestaurant/Common/Common%20Classes/CommentTile.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Date.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Food.dart';
import 'package:chfrestaurant/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class customListTile extends StatefulWidget {
  IconData icon;
  String text;
  Function ontap;

  customListTile(this.icon, this.text, this.ontap);

  @override
  _customListTileState createState() => _customListTileState();
}

class _customListTileState extends State<customListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: InkWell(
        splashColor: Colors.deepOrange,
        onTap: widget.ontap,
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(widget.icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantHomeScreen extends StatefulWidget {
  @override
  _RestaurantHomeScreenState createState() => _RestaurantHomeScreenState();
}

class _RestaurantHomeScreenState extends State<RestaurantHomeScreen> {
  void socketOrdersHistory(String listen) {
    if (listen != 'invalid...invalid...invalid') {
      Accounts.accounts[Accounts.currentAccount].ordersHistory = [];
      List<String> split = listen.split('...');
      List<String> data = split[0].split('\n');
      List<String> foods = split[1].split('\n');
      List<String> numbers = split[2].split('\n');
      for (int i = 0; i < data.length; i++) {
        List<String> foodsElements = foods[i].split('+');
        List<Food> foodsAns = [];
        for (int j = 0; j < foodsElements.length; j++) {
          List<String> foodIndex = foodsElements[j].split(', ');
          foodsAns.add(Food(foodIndex[1], foodIndex[3], true, foodIndex[0],
              desc: foodIndex[2] == 'null' ? '' : foodIndex[2]));
        }
        List<String> numbersElements = numbers[i].split(', ');
        List<int> numbersAns = [];
        for (int j = 0; j < numbersElements.length; j++) {
          numbersAns.add(int.parse(numbersElements[j]));
        }
        List<String> dataAns = data[i].split(', ');
        List<String> dateElements = dataAns[5].split(':');
        Accounts.accounts[Accounts.currentAccount].ordersHistory.add(
            RestaurantInactiveOrderTile(
                foodsAns,
                numbersAns,
                Date(
                    year: dateElements[0]
                        .substring(dateElements[0].indexOf('(') + 1),
                    month: dateElements[1],
                    day: dateElements[2],
                    hour: dateElements[3],
                    minute: dateElements[4],
                    second: dateElements[5]
                        .substring(0, dateElements[5].indexOf(')'))),
                dataAns[2],
                dataAns[3],
                dataAns[1],
                // _clientLastName,
                dataAns[0],
                double.parse(dataAns[7]),
                dataAns[6] == 'true',
                int.parse(dataAns[8])));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // drawer: Drawer(
        //   child: ListView(
        //     children: [
        //       DrawerHeader(
        //           decoration: BoxDecoration(
        //             gradient: LinearGradient(colors: [
        //               Colors.orange,
        //               Colors.deepOrange,
        //             ]),
        //           ),
        //           child: Text('here is header')),
        //       customListTile(Icons.person, 'Profile',
        //           () => {Navigator.pushNamed(context, '/ProfileScreen')}),
        //       customListTile(Icons.phone, 'Contact Us', () => {}),
        //       customListTile(Icons.logout, "Log Out", () => {}),
        //     ],
        //   ),
        // ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 4, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset("assets/images/7.png"),
                        height: 120,
                        width: 160,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/MenuEdition');
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Text("Menu Edition",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'HotPizza',
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(6, 4),
                                          blurRadius: 2,
                                          color: Colors.grey,
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          width: 170,
                          height: 120,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          String listen = '';
                          await Socket.connect(MyApp.ip, 2442)
                              .then((serverSocket) {
                            print('connected writer');
                            String write =
                                'RestaurantOrders-RestaurantOrdersHistoryData-' +
                                    MyApp.id +
                                    '-' +
                                    'RestaurantOrdersHistoryFoodNames-' +
                                    MyApp.id +
                                    '-' +
                                    'RestaurantOrdersHistoryNumbers-' +
                                    MyApp.id;
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
                              socketOrdersHistory(listen);
                              Navigator.pushNamed(
                                  context, '/OrdersHistoryScreen');
                            });
                          });
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text("Orders History",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'HotPizza',
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(6, 4),
                                          blurRadius: 2,
                                          color: Colors.grey,
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          width: 170,
                          height: 120,
                        ),
                      ),
                      Container(
                        child: Image.asset("assets/images/4.png"),
                        height: 120,
                        width: 160,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset("assets/images/3.png"),
                        width: 180,
                      ),
                      GestureDetector(
                        onTap: () async {
                          String listen = '';
                          await Socket.connect(MyApp.ip, 2442)
                              .then((serverSocket) {
                            print('connected writer');
                            String write =
                                'RestaurantOrders-RestaurantOrdersHistoryData-' +
                                    MyApp.id +
                                    '-' +
                                    'RestaurantOrdersHistoryFoodNames-' +
                                    MyApp.id +
                                    '-' +
                                    'RestaurantOrdersHistoryNumbers-' +
                                    MyApp.id;
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
                              socketOrdersHistory(listen);
                              Accounts.accounts[Accounts.currentAccount]
                                  .calculator();
                              Accounts.accounts[Accounts.currentAccount]
                                  .sumNumberCalculator();
                              Navigator.pushNamed(context, '/CalculatorScreen');
                            });
                          });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 50),
                                child: Text("Accounting",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'HotPizza',
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(6, 4),
                                          blurRadius: 2,
                                          color: Colors.grey,
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          width: 170,
                          height: 120,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          String listen = '';
                          await Socket.connect(MyApp.ip, 2442)
                              .then((serverSocket) {
                            print('connected writer');
                            String write =
                                'Comments-RestaurantComments-' + MyApp.id;
                            write = (write.length + 7).toString() +
                                ',Client-' +
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
                              if (listen != null && listen.isNotEmpty) {
                                Map test = {0: []};
                                for (int u = 1;
                                    u <
                                        Accounts
                                            .accounts[Accounts.currentAccount]
                                            .restaurantComments
                                            .length;
                                    u++) {
                                  test[u] = [];
                                }
                                Accounts.accounts[Accounts.currentAccount]
                                    .restaurantComments = test;
                                List<String> comments = listen.split('\n');
                                for (int i = 0; i < comments.length; i++) {
                                  List<String> commentElements =
                                      comments[i].split(', ');
                                  int index = 0;
                                  for (int j = 1;
                                      j <
                                          Accounts
                                              .accounts[Accounts.currentAccount]
                                              .restaurantTabBarView
                                              .length;
                                      j++) {
                                    for (int k = 0;
                                        k <
                                            Accounts
                                                .accounts[
                                                    Accounts.currentAccount]
                                                .restaurantTabBarView[j]
                                                .length;
                                        k++) {
                                      if (Accounts
                                              .accounts[Accounts.currentAccount]
                                              .restaurantTabBarView[j][k]
                                              .name ==
                                          commentElements[3]) {
                                        index = j;
                                      }
                                    }
                                  }
                                  List<String> dateElements =
                                      commentElements[5].split(':');
                                  Date date = Date(
                                      year: dateElements[0].substring(
                                          dateElements[0].indexOf('(') + 1),
                                      month: dateElements[1],
                                      day: dateElements[2],
                                      hour: dateElements[3],
                                      minute: dateElements[4],
                                      second: dateElements[5].substring(
                                          0, dateElements[5].indexOf(')')));
                                  print('index is: ' + index.toString());
                                  for (int y = 0;
                                      y < commentElements.length;
                                      y++) {
                                    print("element is: " + commentElements[y]);
                                  }
                                  Accounts.accounts[Accounts.currentAccount]
                                      .addComments(
                                          CommentTile(
                                            commentElements[1],
                                            commentElements[3],
                                            date,
                                            commentElements[0].substring(
                                                0,
                                                commentElements[0]
                                                    .indexOf(':')),
                                            commentElements[4],
                                            commentElements[0].substring(
                                                commentElements[0]
                                                        .indexOf(':') +
                                                    1,
                                                commentElements[0]
                                                    .lastIndexOf(':')),
                                            answer:
                                                (commentElements[2] == 'null'
                                                    ? ''
                                                    : commentElements[2]),
                                          ),
                                          index);
                                }
                              }
                              Navigator.pushNamed(
                                  context, '/CommentsManagements');
                            });
                            // serverSocket.close();
                          });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text("Comments",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'HotPizza',
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(6, 4),
                                          blurRadius: 2,
                                          color: Colors.grey,
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          width: 170,
                          height: 120,
                        ),
                      ),
                      Container(
                        child: Image.asset("assets/images/2.png"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
