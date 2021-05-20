import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Screens/ActiveOrdersScreen.dart';
import 'package:chfrestaurant/Screens/RestaurantHomeScreen.dart';
import 'package:chfrestaurant/Screens/TopTenFoodsScreen.dart';
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
            onTap: (value) {
              setState(() {
                _currentSelected = value;
                if (_currentSelected == 0) {
                  appBarText = 'Main Menu';
                } else if (_currentSelected == 1) {
                  appBarText = 'Active Orders';
                } else {
                  appBarText = 'Top Ten Foods';
                }
              });
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
                    Colors.orange,
                    Colors.deepOrange,
                  ])),
                  child: Text('here is header')),
              customListTile(Icons.person, 'Profile',
                  () => {Navigator.pushNamed(context, '/ProfileScreen')}),
              customListTile(Icons.phone, 'Contact Us', () => {}),
              customListTile(Icons.logout, "Log Out", () => {}),
            ],
          )),
          appBar: AppBar(
            centerTitle: true,
            title: Text(appBarText),
          ),
          body: screen[_currentSelected]),
    );
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
