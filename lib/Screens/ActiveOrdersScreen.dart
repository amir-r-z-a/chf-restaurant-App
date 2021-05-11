import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:flutter/material.dart';

class ActiveOrdersScreen extends StatefulWidget {
  @override
  _ActiveOrdersScreenState createState() => _ActiveOrdersScreenState();
}

class _ActiveOrdersScreenState extends State<ActiveOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Active Orders'),
        ),
        body: ListView(
          children: List.generate(
              Accounts.accounts[Accounts.currentAccount]
                  .getActiveOrdersLength(),
              (index) => Accounts
                  .accounts[Accounts.currentAccount].activeOrders[index]),
        ),
      ),
    );
  }
}