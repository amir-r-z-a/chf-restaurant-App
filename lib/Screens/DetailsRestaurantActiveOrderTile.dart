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
  // static String clientLastName;
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
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Stack(
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 15,
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(DetailsRestaurantActiveOrderTile.clientName ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)/*+
                                  " " +
                                  DetailsRestaurantActiveOrderTile.clientLastName*/),
                              Text(DetailsRestaurantActiveOrderTile
                                  .clientPhoneNumber,style: TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Card(
                        elevation: 10,
                        child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            // decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("address :     ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  Expanded(
                                      child: Text(DetailsRestaurantActiveOrderTile
                                          .clientAddress,style: TextStyle(fontSize: 16))),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text("Price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text("Count",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        children: List.generate(
                          DetailsRestaurantActiveOrderTile.foods.length,
                          (index) => Card(
                            elevation: 10,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Accounts.digester(
                                      DetailsRestaurantActiveOrderTile
                                          .foods[index].name,
                                      10),style: TextStyle(fontSize: 16)),
                                  Text("\$" +
                                      DetailsRestaurantActiveOrderTile
                                          .foods[index].price,style: TextStyle(fontSize: 16)),
                                  Text(DetailsRestaurantActiveOrderTile
                                      .numberOfFoods[index]
                                      .toString(),style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Card(
                        elevation: 10,
                        child: Container(
                          // margin: EdgeInsets.only(top: 20),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sum: ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                Text('\$' +
                                    DetailsRestaurantActiveOrderTile.sumPrice
                                        .toString(),style: TextStyle(fontSize: 16)),
                                Text(DetailsRestaurantActiveOrderTile.sumNumberOfFoods
                                    .toString(),style: TextStyle(fontSize: 16))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Card(
                        elevation: 10,
                        child: Container(
                          // margin: EdgeInsets.only(top: 20),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tracking Code : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                Text(DetailsRestaurantActiveOrderTile.id
                                  //TODO
                                ,style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
