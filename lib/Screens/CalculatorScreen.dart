import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  bool chipController1 = false;
  bool chipController2 = false;
  bool chipController3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculator'),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              chipController1
                  ? MyOnChip('1 days ago', 1)
                  : MyOffChip('1 days ago', 1),
              chipController2
                  ? MyOnChip('7 days ago', 2)
                  : MyOffChip('7 days ago', 2),
              chipController3
                  ? MyOnChip('30 days ago', 3)
                  : MyOffChip('30 days ago', 3),
            ],
          ),
          Padding(padding: EdgeInsets.all(10)),

          Container(
            margin: EdgeInsets.all(10),
            height: 350,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
                          width: 365,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                            child: Text("gozaresh froosh : "),
                          )),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide())
                    ),
                    margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text("Subject"),
                            flex: 2,
                          ),
                          Expanded(child: Text("Count"),
                            flex: 2,
                          ),
                          Expanded(child: Text("Price")),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Subject"),
                            flex: 2,
                          ),
                          Expanded(child: Text("0"),
                            flex: 2,
                          ),
                          Expanded(child: Text("0")),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide())
                    ),
                    margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Subject"),
                            flex: 2,
                          ),
                          Expanded(child: Text("0"),
                            flex: 2,
                          ),
                          Expanded(child: Text("0")),
                        ],
                      ),
                    ),
                  ),
                  Container(

                    margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Subject"),
                            flex: 2,
                          ),
                          Expanded(child: Text("0"),
                            flex: 2,
                          ),
                          Expanded(child: Text("0")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all()
            ),
          )
        ],
      ),
    );
  }

  Widget MyOffChip(String input, int index) {
    return FilterChip(
      label: Text(input),
      onSelected: (value) {
        setState(() {
          if (index == 1) {
            chipController2 = false;
            chipController3 = false;
            chipController1 = !chipController1;
          } else if (index == 2) {
            chipController1 = false;
            chipController3 = false;
            chipController2 = !chipController2;
          } else {
            chipController1 = false;
            chipController2 = false;
            chipController3 = !chipController3;
          }
        });
      },
    );
  }

  Widget MyOnChip(String input, int index) {
    return FilterChip(
      backgroundColor: Colors.blue,
      avatar: Icon(
        Icons.check,
        color: Colors.white,
      ),
      label: Text(
        input,
        style: TextStyle(color: Colors.white),
      ),
      onSelected: (value) {
        setState(() {
          if (index == 1) {
            chipController1 = !chipController1;
          } else if (index == 2) {
            chipController2 = !chipController2;
          } else {
            chipController3 = !chipController3;
          }
        });
      },
    );
  }
}
