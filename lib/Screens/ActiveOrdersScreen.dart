import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/RestaurantActiveOrderTile.dart';
import 'package:flutter/material.dart';

class ActiveOrdersScreen extends StatefulWidget {
  @override
  _ActiveOrdersScreenState createState() => _ActiveOrdersScreenState();
}

class _ActiveOrdersScreenState extends State<ActiveOrdersScreen> {
  void refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
      child: Scaffold(
        body: ListView(
          children: List.generate(
            Accounts.accounts[Accounts.currentAccount].getActiveOrdersLength(),
            (index) {
              RestaurantActiveOrderTile.function = refreshPage;
              return Accounts
                  .accounts[Accounts.currentAccount].activeOrders[index];
            },
          ),
        ),
      ),
    );
  }
}
