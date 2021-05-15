import 'package:chfrestaurant/Classes/TopTenFoodTile.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantFoodTile.dart';
import 'package:flutter/material.dart';

class DetailsTopTenFoodTile extends StatefulWidget {
  static String name;
  static String desc;
  static String price;
  static bool foodStatus;
  static Function deleteFunction;
  static int orderCount;

  @override
  _DetailsTopTenFoodTileState createState() => _DetailsTopTenFoodTileState();
}

class _DetailsTopTenFoodTileState extends State<DetailsTopTenFoodTile> {
  var key1 = GlobalKey<FormState>();

  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    DetailsRestaurantFoodTile.detailsTopTenFoods = refreshPage;
    return Scaffold(
      appBar: AppBar(
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
              DetailsTopTenFoodTile.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Text(DetailsTopTenFoodTile.desc),
            Padding(padding: EdgeInsets.all(3)),
            Text('Price: ' + '\$' + DetailsTopTenFoodTile.price.toString()),
            Text(
                'Order Counts: ' + DetailsTopTenFoodTile.orderCount.toString()),
            Text(
              DetailsTopTenFoodTile.foodStatus ? 'Active' : 'Inactive',
              style: TextStyle(
                  color: DetailsTopTenFoodTile.foodStatus
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
