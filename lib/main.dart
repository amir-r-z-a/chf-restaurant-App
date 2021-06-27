import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Request.dart';
import 'package:chfrestaurant/Common/Common%20Classes/CommentTile.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Date.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Classes/RestaurantActiveOrderTile.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:chfrestaurant/Screens/ActiveOrdersScreen.dart';
import 'package:chfrestaurant/Screens/CalculatorScreen.dart';
import 'package:chfrestaurant/Screens/CommentsManagement.dart';
import 'package:chfrestaurant/Screens/DetailsCommentTile.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantActiveOrderTile.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantFoodTile.dart';
import 'package:chfrestaurant/Screens/DetailsTopTenFoodTile.dart';
import 'package:chfrestaurant/Screens/RestaurantMainMenuScreen.dart';
import 'package:chfrestaurant/Screens/OrdersHistoryScreen.dart';
import 'package:chfrestaurant/Screens/MenuEdition.dart';
import 'package:chfrestaurant/Screens/RestaurantProfileScreen.dart';
import 'package:chfrestaurant/Screens/RestaurantSignInScreen.dart';
import 'package:chfrestaurant/Screens/RestaurantSignUpScreen.dart';
import 'package:chfrestaurant/Screens/SplashScreen.dart';
import 'package:chfrestaurant/Screens/TopTenFoodsScreen.dart';
import 'package:chfrestaurant/Screens/contactUsScreen.dart';
import 'package:flutter/material.dart';

//now is: Date('2021', '3', '12', '4', '22', '23')
// Date(DateTime(DateTime.now().day).toString()

class MyApp extends StatefulWidget {
  static String id = '';
  static String mode = 'LogOut';
  static String ip = '192.168.1.7';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "CHFood",
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(248, 95, 106, 1),
        ),
        routes: {
          '/SignInScreen': (context) => RestaurantSignInScreen(),
          '/ContactUsScreen': (context) => ContactUsScreen(),
          '/SignUpScreen': (context) => RestaurantSignUpScreen(),
          '/DetailsFoodTile': (context) => DetailsRestaurantFoodTile(),
          '/MainMenuScreen': (context) => RestaurantMainMenuScreen(),
          '/ProfileScreen': (context) => RestaurantProfileScreen(),
          '/MenuEdition': (context) => MenuEdition(),
          '/DetailsRestaurantActiveOrderTiles': (context) =>
              DetailsRestaurantActiveOrderTile(),
          '/OrdersHistoryScreen': (context) => OrdersHistoryScreen(),
          '/ActiveOrdersScreen': (context) => ActiveOrdersScreen(),
          '/CommentsManagements': (context) => CommentsManagement(),
          '/DetailsCommentTile': (context) => DetailsCommentTile(),
          '/CalculatorScreen': (context) => CalculatorScreen(),
          '/DetailsTopTenFoodTile': (context) => DetailsTopTenFoodTile(),
          '/TopTenFoodsScreen': (context) => TopTenFoodsScreen(),
        },
        home:
        // ContactUsScreen()
      // DetailsRestaurantActiveOrderTile()
      /*RestaurantMainMenuScreen()*/
            // SplashScreen()
            /*TopTenFoodsScreen()*/ /*MenuEdition()*/ RestaurantSignInScreen() /*ActiveOrdersScreen()*/
        /*CalculatorScreen()*/ /*OrdersHistoryScreen()*/ /*CommentsManagement()*/
        /*RestaurantMainMenuScreen()*/ /*RestaurantActiveOrderTile([
          Food(
            'Tea',
            '25',
            true,
            desc: 'desc',
          ),
          Food(
            'pizza',
            '25',
            true,
            desc: 'desc',
          ),
          Food(
            'milk',
            '25',
            true,
            desc: 'desc',
          )
        ], [
          3,
          4,
          5
        ], Date('2021', '3', '7', '20', '20', '20'), "09185452060", "hamadan",
            "ghar", "alisadr", "#12345")*/
        // DetailsRestaurantOrderTile()
        // DetailsCommentTile()
        /*CommentsManagement()*/ /*OrdersMenu()*/ /*SignInScreen()*/ /*RestaurantFoodTile(
        'Hot Dog',
        '25',
        true,
        'Cafe',
        desc: 'desc',
      ),*/
        );
  }
}

void main() async {
  String msg = "09198612878:id: {, question1, answer1, phoneNumberClient, foodName, Date(2021:12:01:12:13:1), destinationRestaurant, }" ;
  List <String> msg1 = msg.split("\n");
  for( var i = 0 ; i < msg1.length ;i++ ){
    List <String> msg2 = msg1[i].split(", ") ;
    String ResPhonNumber = msg1[i].substring(0,11);
    String ID = msg2[0].substring(msg2[0].indexOf(":")+1,msg2[0].indexOf("{")-2);
    String question = msg2[1] ;
    String Answer = msg2[2] ;
    String clientNumber = msg2 [3];
    String foodname =  msg2[4];
    List <String> date  = msg2[5].split(":");
    String Year = date[0].substring(date[0].indexOf("(")+1);
    String Month = date[1];
    String Day = date[2];
    String hour = date[3];
    String minute = date[4];
    String second = date[5];
    String destinationRes = msg2[6];
  }
  // Restaurant restaurant=Accounts.addAccount('name1', '09198612878', 'password1', '09:02', '21,23',
  //     RestaurantTypes.Cafe.toString());
  // restaurant.addTabBarTitle(
  //     'Cafe',
  //     RestaurantFoodTile(
  //       'Tea',
  //       '25',
  //       true,
  //       'Cafe',
  //       desc: 'desc',
  //     ));
  // restaurant.addTabBarTitle(
  //     'Fast Food',
  //     RestaurantFoodTile(
  //       'Hot Dog',
  //       '25',
  //       true,
  //       'Fast Food',
  //       desc: 'desc',
  //     ));
  // restaurant.addTabBarViewElements(
  //     RestaurantFoodTile(
  //       'Milk',
  //       '25',
  //       true,
  //       'Cafe',
  //       desc: 'desc',
  //     ),
  //     1);
  // restaurant.addTabBarViewElements(
  //     RestaurantFoodTile(
  //       'Pizza',
  //       '25',
  //       true,
  //       'Fast Food',
  //       desc: 'desc',
  //     ),
  //     2);
  // restaurant.addComments(
  //     CommentTile(
  //         'chera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad bade?',
  //         'Milk',
  //         Date('2021', '3', '5', '22', '12', '2'),
  //         '09121231212',
  //         '09198612878',
  //         '#T2878-742'),
  //     1);
  // restaurant.addComments(
  //     CommentTile(
  //         'chera qazatoon inqad khoobe?',
  //         'Milk',
  //         Date('2021', '3', '7', '20', '20', '20'),
  //         '09121231212',
  //         '09198612878',
  //         'T2878-991'),
  //     1);
  // restaurant.addComments(
  //     CommentTile(
  //         'chera qazatoon inqad bade va khoobe?',
  //         'Hot Dog',
  //         Date('2021', '3', '11', '1', '28', '29'),
  //         '09121231212',
  //         '09198612878',
  //         'T2878-114'),
  //     2);
  // restaurant.addOrder(RestaurantActiveOrderTile([
  //   Food(
  //     'Tea',
  //     '25',
  //     true,
  //     'Cafe',
  //     desc: 'desc',
  //   ),
  //   Food(
  //     'Pizza',
  //     '25',
  //     true,
  //     'Fast Food',
  //     desc: 'desc',
  //   ),
  //   Food(
  //     'Milk',
  //     '25',
  //     true,
  //     'Cafe',
  //     desc: 'desc',
  //   )
  // ], [
  //   3,
  //   4,
  //   5,
  // ], Date('2021', '3', '11', '1', '28', '29'), "09185452060", "hamadan", "ghar",
  //     "alisadr", false));
  // restaurant.addOrder(RestaurantActiveOrderTile([
  //   Food(
  //     'Hot Dog',
  //     '25',
  //     true,
  //     'Fast Food',
  //     desc: 'desc',
  //   ),
  //   Food(
  //     'Milk',
  //     '25',
  //     true,
  //     'Cafe',
  //     desc: 'desc',
  //   ),
  // ], [
  //   6,
  //   9,
  // ], Date('2021', '3', '5', '22', '12', '2'), "09185452060", "hamadan", "arman",
  //     "shiraz", true));
  // print(Accounts.accounts[Accounts.currentAccount].activeOrders[0].foods);
  // print(DetailsRestaurantOrderTile.foods.length);
  // print(Accounts.accounts[Accounts.currentAccount].discountCodeCalculator(25));
  // print(Accounts.currentAccount);
  // print(Accounts.accounts.length);
  // print(restaurant.tabBarTitle);
  // print(restaurant.restaurantTabBarView);
  // print(restaurant.listOfFood);
  // print(restaurant.restaurantComments);
  // Accounts.addAccount(Restaurant(
  //     'name2', 09121111111, 'password2', 'addres2', RestaurantTypes.Other));

  // String listen = '';
  // await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
  //   print('connected writer');
  //   String write = 'RestaurantGetData-account-' + MyApp.id;
  //   write = (write.length + 11).toString() + ',Restaurant-' + write;
  //   serverSocket.write(write);
  //   serverSocket.flush();
  //   print('write: ' + write);
  //   print('connected listen');
  //   serverSocket.listen((socket) {
  //     listen = String.fromCharCodes(socket).trim().substring(2);
  //     print("listen: " + listen);
  //   }).onDone(() {
  //     SplashScreen.start(listen);
  //     Accounts.key = true;
  //     runApp(MyApp());
  //   });
  // });
  runApp(MyApp());
}
//comment
