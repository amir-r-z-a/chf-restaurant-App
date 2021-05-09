import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantOrderTile extends StatefulWidget {
  @override
  _RestaurantOrderTileState createState() => _RestaurantOrderTileState();
}

class _RestaurantOrderTileState extends State<RestaurantOrderTile> {
  String SelectedValue ;
  List panelItems =["active","unActive","finished"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: (){print("taped");},
            child: SizedBox(
              height:200,
              child: Card(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Amirreza' + '  Ahmadi'),
                        Text("09185452060"),
                  ]
                  ),
                   subtitle:Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:[
                         Column(
                           children: [
                             Text("#9956"),
                           ],
                         ),
                         Column(
                           children: [
                             Text("2020/05/05"),
                             Container(
                               margin: EdgeInsets.only(top: 70),
                               padding: EdgeInsets.all(5),
                               decoration: BoxDecoration(
                                 border: Border.all(color: Colors.grey),
                                 borderRadius: BorderRadius.circular(15)
                               ),
                               child: DropdownButton(

                                 hint: Text("Order Status "),
                                 dropdownColor: Colors.grey,
                                 icon:Icon (Icons.arrow_drop_down),
                                 value: SelectedValue,
                                 onChanged: (newValue){
                                   setState(() {
                                     SelectedValue=newValue;
                                   });
                                 },
                                 items: panelItems.map((valueitem){
                                   return DropdownMenuItem(
                                     value: valueitem,
                                       child: Text(valueitem),
                                   );
                                 }
                                 ).toList(),
                               ),
                             )
                           ],
                         )
                   ] ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
