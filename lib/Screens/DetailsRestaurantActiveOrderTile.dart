import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Date.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Food.dart';
import 'package:chfrestaurant/Classes/Restaurant.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantFoodTile.dart';
import 'package:flutter/material.dart';

class DetailsRestaurantActiveOrderTile extends StatefulWidget {
  static List foods;
  static List numberOfFoods;
  static Date orderDate;
  static String orderStatus;

  //orderStatus tooye DetailsRestaurantActiveOrderTile gozashte shavad
  static String clientPhoneNumber;
  static String clientAddress;
  static String clientName;
  static String clientLastName;
  static String id;
  static double sumPrice;
  static int sumNumberOfFoods;
  Function function;

  DetailsRestaurantActiveOrderTile({this.function});

  @override
  _DetailsRestaurantActiveOrderTileState createState() =>
      _DetailsRestaurantActiveOrderTileState();
}

class _DetailsRestaurantActiveOrderTileState
    extends State<DetailsRestaurantActiveOrderTile> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    DetailsRestaurantFoodTile.activeOrders = refreshPage;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                          Text(DetailsRestaurantActiveOrderTile.clientName +
                              " " +
                              DetailsRestaurantActiveOrderTile.clientLastName),
                          Text(DetailsRestaurantActiveOrderTile
                              .clientPhoneNumber)
                        ],
                      ),
                    ),
                  ),
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
                                child: Text(DetailsRestaurantActiveOrderTile
                                    .clientAddress)),
                          ],
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Name"), Text("Price"), Text("Count")],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: List.generate(
                        DetailsRestaurantActiveOrderTile.foods.length,
                        (index) => Card(
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Accounts.digester(
                                    DetailsRestaurantActiveOrderTile
                                        .foods[index].name,
                                    10)),
                                Text("\$" +
                                    DetailsRestaurantActiveOrderTile
                                        .foods[index].price),
                                Text(DetailsRestaurantActiveOrderTile
                                    .numberOfFoods[index]
                                    .toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sum: '),
                          Text('\$' +
                              DetailsRestaurantActiveOrderTile.sumPrice
                                  .toString()),
                          Text(DetailsRestaurantActiveOrderTile.sumNumberOfFoods
                              .toString())
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
