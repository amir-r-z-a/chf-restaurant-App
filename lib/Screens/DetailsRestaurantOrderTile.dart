import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Date.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:flutter/material.dart';

class DetailsRestaurantOrderTile extends StatefulWidget {
  static Map foods;
  static Date orderDate;
  static String orderStatus;
  static String clientPhoneNumber;
  static String clientAddress;
  static String clientName;
  static String clientLastName;
  static String id;
  Function function ;
  DetailsRestaurantOrderTile({this.function});
  @override
  _DetailsRestaurantOrderTileState createState() =>
      _DetailsRestaurantOrderTileState();
}

class _DetailsRestaurantOrderTileState
    extends State<DetailsRestaurantOrderTile> {
  // List foods = [
  //   Food(
  //     'Tea',
  //     '25',
  //     true,
  //     desc: 'desc',
  //   ),
  //   Food(
  //     'Tea',
  //     '25',
  //     true,
  //     desc: 'desc',
  //   ),
  //   Food(
  //     'Tea',
  //     '25',
  //     true,
  //     desc: 'desc',
  //   )
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(DetailsRestaurantOrderTile.clientName+"  "+DetailsRestaurantOrderTile.clientLastName),
                          Text(DetailsRestaurantOrderTile.clientPhoneNumber)
                        ],
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("address :     "),
                          Expanded(
                              child: Text(DetailsRestaurantOrderTile.clientAddress)),
                        ],
                      ),
                    )),
                // Column(
                //     children: List.generate(foods.length, (index) {
                //   return Card(
                //     child: ListTile(
                //       title: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(" "),
                //           Text(" ")
                //         ],
                //       ),
                //     ),
                //   );
                // }))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
