import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:flutter/material.dart';

class TopTenFoodsScreen extends StatefulWidget {
  @override
  _TopTenFoodsScreenState createState() => _TopTenFoodsScreenState();
}

class _TopTenFoodsScreenState extends State<TopTenFoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Top Ten Foods'),
      ),
      body: ListView(
        children: List.generate(
            Accounts.accounts[Accounts.currentAccount].getTopTenFoodsLength(),
            (index) =>
                Accounts.accounts[Accounts.currentAccount].topTenFoods[index]),
      ),
    );
  }
}
