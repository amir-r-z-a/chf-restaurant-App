import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantFoodTile.dart';
import 'package:chfrestaurant/Screens/DetailsTopTenFoodTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopTenFoodTile extends StatefulWidget {
  String _name;
  String _category;
  String _price;
  String desc;
  bool _foodStatus;
  Image foodImage ;
  int orderCount;
  int _rank;
  static Function function;
  TopTenFoodTile(
      this._name, this._price, this._foodStatus, this._category, this._rank,
      {this.desc, this.orderCount = 0,this.foodImage  }){
    this.foodImage=Image.asset("assets/images/9.jpg");
  }
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  bool get foodStatus => _foodStatus;

  set foodStatus(bool value) {
    _foodStatus = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }


  int get rank => _rank;

  set rank(int value) {
    _rank = value;
  }

  @override
  _TopTenFoodTileState createState() => _TopTenFoodTileState();
}

class _TopTenFoodTileState extends State<TopTenFoodTile> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {
        widget.name = DetailsTopTenFoodTile.name;
        widget.desc = DetailsTopTenFoodTile.desc;
        widget.price = DetailsTopTenFoodTile.price;
        widget.foodStatus = DetailsTopTenFoodTile.foodStatus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DetailsRestaurantFoodTile.topTenTile = refreshPage;
    return GestureDetector(
      onTap: () {
        DetailsTopTenFoodTile.name = widget.name;
        DetailsTopTenFoodTile.desc = widget.desc != null ? widget.desc : ' ';
        DetailsTopTenFoodTile.price = widget.price;
        DetailsTopTenFoodTile.foodStatus = widget.foodStatus;
        DetailsTopTenFoodTile.orderCount = widget.orderCount;
        Navigator.pushNamed(context, '/DetailsTopTenFoodTile');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: Color(0xffDCDCDC), width: 1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(7)),
                    Text(
                      widget.category,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,fontFamily:'HotPizza'),
                    ),
                  ],
                ),
                Row(children: [
                  Padding(padding: EdgeInsets.all(7)),
                  Container(
                    child: widget.foodImage ,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    height: 95,
                    width: 95,
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Accounts.digester(widget.name,
                          MediaQuery.of(context).size.width.floor() - 372)),
                      Padding(padding: EdgeInsets.all(3)),
                      Text(Accounts.digester(
                          widget.desc == null ? ' ' : widget.desc,
                          MediaQuery.of(context).size.width.floor() - 372)),
                      Padding(padding: EdgeInsets.all(13)),
                      Text(Accounts.digester(
                          'Price: ' + '\$' + widget.price.toString(),
                          MediaQuery.of(context).size.width.floor() - 372)),
                    ],
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.rank.toString()),
                    Padding(padding: EdgeInsets.all(7)),
                  ],
                ),
              ],
            ),
            // color: Colors.green,
            height: 190,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
