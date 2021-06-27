import 'dart:async';
import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Screens/RestaurantProfileScreen.dart';
import 'package:chfrestaurant/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class SplashScreen extends StatefulWidget {
  // static void start(String ans) {
  //   if (ans != null && ans.isNotEmpty) {
  //     List<String> strings = ans.split(', ');
  //     Restaurant restaurant = Accounts.addAccount(
  //         strings[1],
  //         ans.substring(0, ans.indexOf(':')),
  //         strings[2],
  //         strings[3],
  //         strings[4],
  //         strings[5]);
  //     if (strings[6] != 'null') {
  //       restaurant.email = strings[6];
  //     }
  //     if (strings[7] != 'null') {
  //       restaurant.address = strings[7];
  //     }
  //     if (strings[8] != 'null') {
  //       String latitude = strings[8]
  //           .substring(strings[8].indexOf(':') + 1, strings[8].indexOf(':::'));
  //       String longitude = strings[8].substring(
  //           strings[8].lastIndexOf(':') + 1, strings[8].indexOf(')'));
  //       LatLng latLng = LatLng(double.parse(latitude), double.parse(longitude));
  //       restaurant.location = latLng;
  //       RestaurantProfileScreen.tappedPoints.add(latLng);
  //     }
  //     if (strings[9] != 'null') {
  //       restaurant.radiusOfWork = double.parse(strings[9]);
  //     }
  //     if (strings[10] != 'null') {
  //       restaurant.point = double.parse(strings[9]);
  //     }
  //     print('start');
  //   }
  // }

  // static void runMenu() async {
  //   String listen = '';
  //   await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
  //     print('connected writer');
  //     String write = 'RestaurantGetData-menu-' + MyApp.id;
  //     write = (write.length + 11).toString() + ',Restaurant-' + write;
  //     serverSocket.write(write);
  //     serverSocket.flush();
  //     print('write: ' + write);
  //     print('connected listen');
  //     serverSocket.listen((socket) {
  //       listen = String.fromCharCodes(socket).trim().substring(2);
  //     }).onDone(() {
  //       print("listen: " + listen);
  //       if (listen != null && listen.isNotEmpty) {
  //         List<String> menu = listen.split('\n');
  //         for (int i = 0; i < menu.length; i++) {
  //           List<String> strings = menu[i].split(', ');
  //           List<String> firstString = strings[0].split(':');
  //           if (firstString[1] != 'All') {
  //             RestaurantFoodTile food = RestaurantFoodTile(firstString[2],
  //                 strings[2], strings[3] == 'true', firstString[1]);
  //             food.orderCount = int.parse(strings[4]);
  //           }
  //         }
  //       }
  //     });
  //   });
  // }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
        () => Navigator.pushNamed(context, "/SignInScreen"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xff2E765E)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.asset("assets/images/5.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      backgroundColor: Color(0xffF1CCD7),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      "Find Your Meals Here",
                      style: TextStyle(fontFamily: 'HotPizza', fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
