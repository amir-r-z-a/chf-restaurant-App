import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantFoodTile.dart';
import 'package:flutter/material.dart';

class TopTenFoodsScreen extends StatefulWidget {
  @override
  _TopTenFoodsScreenState createState() => _TopTenFoodsScreenState();
}

class _TopTenFoodsScreenState extends State<TopTenFoodsScreen> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    RestaurantFoodTile.topTenFoods = refreshPage;
    return Scaffold(
      body: ListView(
        children: List.generate(
            Accounts.accounts[Accounts.currentAccount].getTopTenFoodsLength(),
            (index) {
          return Accounts.accounts[Accounts.currentAccount].topTenFoods[index];
        }),
      ),
    );
  }
}
