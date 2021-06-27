import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/RestaurantActiveOrderTile.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Date.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Food.dart';
import 'package:chfrestaurant/Screens/ActiveOrdersScreen.dart';
import 'package:chfrestaurant/Screens/RestaurantHomeScreen.dart';
import 'package:chfrestaurant/Screens/RestaurantProfileScreen.dart';
import 'package:chfrestaurant/Screens/TopTenFoodsScreen.dart';
import 'package:chfrestaurant/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'HotPizza',
                      ),
                    ),
                  ),
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

class RestaurantMainMenuScreen extends StatefulWidget {
  @override
  _RestaurantMainMenuScreenState createState() =>
      _RestaurantMainMenuScreenState();
}

class _RestaurantMainMenuScreenState extends State<RestaurantMainMenuScreen> {
  int _currentSelected = 0;
  String appBarText = 'Main Menu';
  List<Widget> screen = [
    RestaurantHomeScreen(),
    ActiveOrdersScreen(),
    TopTenFoodsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentSelected,
            onTap: (value) async {
              _currentSelected = value;
              if (_currentSelected != 0) {
                String listen = '';
                await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
                  print('connected writer');
                  String write = '';
                  write += 'RestaurantOrders-RestaurantActiveOrdersData-' +
                      MyApp.id +
                      '-' +
                      'RestaurantActiveOrdersFoodNames-' +
                      MyApp.id +
                      '-' +
                      'RestaurantActiveOrdersNumbers-' +
                      MyApp.id;
                  write =
                      (write.length + 11).toString() + ',Restaurant-' + write;
                  serverSocket.write(write);
                  serverSocket.flush();
                  print('write: ' + write);
                  print('connected listen');
                  serverSocket.listen((socket) {
                    listen = String.fromCharCodes(socket).trim().substring(2);
                  }).onDone(() async {
                    print("listen: " + listen);
                    if (listen != 'invalid...invalid...invalid') {
                      Accounts.accounts[Accounts.currentAccount].activeOrders =
                          [];
                      for (int i = 0;
                          i <
                              Accounts.accounts[Accounts.currentAccount]
                                  .getTopTenFoodsLength();
                          i++) {
                        Accounts.accounts[Accounts.currentAccount]
                            .topTenFoods[i].orderCount = 0;
                      }
                      for (int i = 0;
                          i <
                              Accounts.accounts[Accounts.currentAccount]
                                  .restaurantTabBarView.length;
                          i++) {
                        for (int j = 0;
                            j <
                                Accounts.accounts[Accounts.currentAccount]
                                    .restaurantTabBarView[i].length;
                            j++) {
                          Accounts.accounts[Accounts.currentAccount]
                              .restaurantTabBarView[i][j].orderCount = 0;
                        }
                      }
                      List<String> split = listen.split('...');
                      List<String> data = split[0].split('\n');
                      List<String> foods = split[1].split('\n');
                      List<String> numbers = split[2].split('\n');
                      for (int i = 0; i < data.length; i++) {
                        List<String> foodsElements = foods[i].split('+');
                        List<Food> foodsAns = [];
                        for (int j = 0; j < foodsElements.length; j++) {
                          List<String> foodIndex = foodsElements[j].split(', ');
                          foodsAns.add(Food(
                              foodIndex[1], foodIndex[3], true, foodIndex[0],
                              desc:
                                  foodIndex[2] == 'null' ? '' : foodIndex[2]));
                        }
                        List<String> numbersElements = numbers[i].split(', ');
                        List<int> numbersAns = [];
                        for (int j = 0; j < numbersElements.length; j++) {
                          numbersAns.add(int.parse(numbersElements[j]));
                        }
                        List<String> dataAns = data[i].split(', ');
                        List<String> dateElements = dataAns[5].split(':');
                        Accounts.accounts[Accounts.currentAccount].addOrder(
                            RestaurantActiveOrderTile(
                                foodsAns,
                                numbersAns,
                                Date(
                                    year: dateElements[0].substring(
                                        dateElements[0].indexOf('(') + 1),
                                    month: dateElements[1],
                                    day: dateElements[2],
                                    hour: dateElements[3],
                                    minute: dateElements[4],
                                    second: dateElements[5].substring(
                                        0, dateElements[5].indexOf(')'))),
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
                    listen = '';
                    await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
                      write = '';
                      write += 'RestaurantTopTenFoods-' + MyApp.id + '- {, ';
                      for (int i = 0;
                          i <
                              Accounts.accounts[Accounts.currentAccount]
                                  .getTopTenFoodsLength();
                          i++) {
                        write += Accounts.accounts[Accounts.currentAccount]
                            .topTenFoods[i].name;
                        write += ', ';
                      }
                      write += '}';
                      print('connected writer');
                      write = (write.length + 11).toString() +
                          ',Restaurant-' +
                          write;
                      serverSocket.write(write);
                      serverSocket.flush();
                      print('write: ' + write);
                      print('connected listen');
                      serverSocket.listen((socket) {
                        listen =
                            String.fromCharCodes(socket).trim().substring(2);
                      }).onDone(() {
                        print("listen: " + listen);
                        setState(() {
                          if (_currentSelected == 1) {
                            appBarText = 'Active Orders';
                          } else {
                            appBarText = 'Top Ten Foods';
                          }
                        });
                      });
                      // serverSocket.close();
                    });
                  });
                  // serverSocket.close();
                });
              } else {
                setState(() {
                  appBarText = 'Main Menu';
                });
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_restaurant_sharp),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined),
                label: 'DashBoard',
              ),
            ],
          ),
          drawer: Drawer(
              child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor,
                    Colors.deepOrange
                  ]),
                ),
                child: Center(
                  child: Container(
                    child: Image.asset(
                      "assets/images/6.png",
                    ),
                  ),
                ),
              ),
              customListTile(
                  Icons.person, 'Profile', () => navigateToProfileScreen()),
              customListTile(Icons.phone, 'Contact Us', () => {Navigator.pushNamed(context, "/ContactUsScreen")}),
              customListTile(
                Icons.logout,
                "Log Out",
                () {
                  MyApp.id = '';
                  MyApp.mode = 'LogOut';
                  RestaurantProfileScreen.tappedPoints = [];
                  Accounts.key = false;
                  Accounts.currentAccount = 0;
                  Navigator.popUntil(
                      context, ModalRoute.withName('/SignInScreen'));
                  Navigator.pushNamed(context, '/SignInScreen');
                },
              ),
            ],
          )),
          appBar: AppBar(
            centerTitle: true,
            title: Text(appBarText),
          ),
          body: screen[_currentSelected]),
    );
  }

  void navigateToProfileScreen() async {
    String listen = '';
    await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
      print('connected writer');
      String write = 'RestaurantGetData-name-' + MyApp.id;
      write = (write.length + 11).toString() + ',Restaurant-' + write;
      serverSocket.write(write);
      serverSocket.flush();
      print('write: ' + write);
      print('connected listen');
      serverSocket.listen((socket) {
        listen = String.fromCharCodes(socket).trim().substring(2);
      }).onDone(() async {
        print("listen: " + listen);
        RestaurantProfileScreen.initialName = listen;
        String listenEmail = '';
        await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
          print('connected writer');
          String write = 'RestaurantGetData-email-' + MyApp.id;
          write = (write.length + 11).toString() + ',Restaurant-' + write;
          serverSocket.write(write);
          serverSocket.flush();
          print('write: ' + write);
          print('connected listen');
          serverSocket.listen((socket) {
            listenEmail = String.fromCharCodes(socket).trim().substring(2);
          }).onDone(() async {
            print("listen: " + listenEmail);
            RestaurantProfileScreen.initialEmail = listenEmail;
            if (RestaurantProfileScreen.initialEmail == 'null') {
              RestaurantProfileScreen.initialEmail = '';
            }
            String listenAddress = '';
            await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
              print('connected writer');
              String write = 'RestaurantGetData-address-' + MyApp.id;
              write = (write.length + 11).toString() + ',Restaurant-' + write;
              serverSocket.write(write);
              serverSocket.flush();
              print('write: ' + write);

              print('connected listen');
              serverSocket.listen((socket) {
                listenAddress =
                    String.fromCharCodes(socket).trim().substring(2);
              }).onDone(() async {
                print("listen: " + listenAddress);
                RestaurantProfileScreen.initialAddress = listenAddress;
                if (RestaurantProfileScreen.initialAddress == 'null') {
                  RestaurantProfileScreen.initialAddress = '';
                }
                String listenRadius = '';
                await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
                  print('connected writer');
                  String write = 'RestaurantGetData-radius-' + MyApp.id;
                  write =
                      (write.length + 11).toString() + ',Restaurant-' + write;
                  serverSocket.write(write);
                  serverSocket.flush();
                  print('write: ' + write);
                  print('connected listen');
                  serverSocket.listen((socket) {
                    listenRadius =
                        String.fromCharCodes(socket).trim().substring(2);
                  }).onDone(() {
                    print("listen: " + listenRadius);
                    RestaurantProfileScreen.initialRadius = listenRadius;
                    if (RestaurantProfileScreen.initialRadius == 'null') {
                      RestaurantProfileScreen.initialRadius = '';
                    }
                    print('success initialize');
                    print('name: ' + RestaurantProfileScreen.initialName);
                    print('email: ' + RestaurantProfileScreen.initialEmail);
                    print('address: ' + RestaurantProfileScreen.initialAddress);
                    print('radius: ' + RestaurantProfileScreen.initialRadius);
                    Navigator.pushNamed(context, '/ProfileScreen');
                  });
                });
              });
            });
          });
        });
      });
    });
  }
}

//comment

//Container(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushNamed(context, '/OrdersMenu');
//                         },
//                         child: Container(
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(left: 20),
//                                 child: Text("Menu Edition"),
//                               ),
//                               Container(
//                                 child: Icon(
//                                   Icons.edit_rounded,
//                                   size: 35,
//                                 ),
//                                 margin: EdgeInsets.only(left: 20),
//                               ),
//                             ],
//                           ),
//                           decoration: BoxDecoration(
//                               border: Border.all(width: 1, color: Colors.pink),
//                               borderRadius: const BorderRadius.all(
//                                   const Radius.circular(8))),
//                           width: 170,
//                           height: 120,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(0, 20, 30, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushNamed(context, '/OrdersHistoryScreen');
//                         },
//                         child: Container(
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(left: 20),
//                                 child: Text("Orders History"),
//                               ),
//                               Container(
//                                 child: Icon(
//                                   Icons.edit_rounded,
//                                   size: 35,
//                                 ),
//                                 margin: EdgeInsets.only(left: 20),
//                               ),
//                             ],
//                           ),
//                           decoration: BoxDecoration(
//                               border: Border.all(width: 1, color: Colors.pink),
//                               borderRadius: const BorderRadius.all(
//                                   const Radius.circular(8))),
//                           width: 170,
//                           height: 120,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Accounts.accounts[Accounts.currentAccount]
//                               .calculator();
//                           Accounts.accounts[Accounts.currentAccount]
//                               .sumNumberCalculator();
//                           Navigator.pushNamed(context, '/CalculatorScreen');
//                         },
//                         child: Container(
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(left: 20),
//                                 child: Text("Calculator"),
//                               ),
//                               Container(
//                                 child: Icon(
//                                   Icons.edit_rounded,
//                                   size: 35,
//                                 ),
//                                 margin: EdgeInsets.only(left: 20),
//                               ),
//                             ],
//                           ),
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 1, color: Colors.pink),
//                             borderRadius: const BorderRadius.all(
//                                 const Radius.circular(8)),
//                           ),
//                           width: 170,
//                           height: 120,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(0, 20, 30, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushNamed(context, '/CommentsManagements');
//                         },
//                         child: Container(
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(left: 20),
//                                 child: Text("Comments"),
//                               ),
//                               Container(
//                                 child: Icon(
//                                   Icons.edit_rounded,
//                                   size: 35,
//                                 ),
//                                 margin: EdgeInsets.only(left: 20),
//                               ),
//                             ],
//                           ),
//                           decoration: BoxDecoration(
//                               border: Border.all(width: 1, color: Colors.pink),
//                               borderRadius: const BorderRadius.all(
//                                   const Radius.circular(8))),
//                           width: 170,
//                           height: 120,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
