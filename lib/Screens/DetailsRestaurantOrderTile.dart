import 'package:chfrestaurant/Classes/Food.dart';
import 'package:flutter/material.dart';

class DetailsRestaurantOrderTile extends StatefulWidget {
  @override
  _DetailsRestaurantOrderTileState createState() =>
      _DetailsRestaurantOrderTileState();
}
class _DetailsRestaurantOrderTileState
    extends State<DetailsRestaurantOrderTile> {
  List foods = [
    Food(
      'Tea',
      '25',
      true,
      desc: 'desc',
    ),
    Food(
      'Tea',
      '25',
      true,
      desc: 'desc',
    ),
    Food(
      'Tea',
      '25',
      true,
      desc: 'desc',
    )
  ];
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
                  width: MediaQuery. of(context). size. width,
                  decoration: BoxDecoration(
                    border: Border.all()
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("amirreza ahmadi"),
                          Text("09185452060")
                        ],
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                    height: 100,
                    width: MediaQuery. of(context). size. width,
                    decoration: BoxDecoration(
                        border: Border.all()
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("address :     "),
                          Expanded(child: Text(" lygyg y ugh i uiyi iuh iu  uyu huh i ig ighuihiuh ")),
                        ],
                      ),
                    )
                ),
                Column(
                    children: List.generate(foods.length, (index){
                      return Card(
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(foods[index].name),
                              Text(foods[index].price)
                            ],
                          ),
                        ),
                      );
                    })
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
