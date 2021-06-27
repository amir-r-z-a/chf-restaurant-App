import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantActiveOrderTile.dart';
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
          Padding(padding: EdgeInsets.all(5)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Card(
                elevation: 10,
                child: Container(
                    margin: EdgeInsets.all(10),
                    height: 350,
                    width: 200,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                                    child: Text("Orders Report : "),
                                  )),
                            ],
                          ),
                          Container(
                            decoration:
                                BoxDecoration(border: Border(bottom: BorderSide())),
                            margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text("Subject"),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Text("Count"),
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
                                    child: Text("Online Sell"),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Text(Accounts
                                        .accounts[Accounts.currentAccount]
                                        .sumOnlineNumberOfFoods
                                        .toString()),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Text('\$' +
                                        Accounts.accounts[Accounts.currentAccount]
                                            .onlineSell
                                            .toString()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration:
                                BoxDecoration(border: Border(bottom: BorderSide())),
                            margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text("Cash Sell"),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Text(Accounts
                                        .accounts[Accounts.currentAccount]
                                        .sumCashNumberOfFoods
                                        .toString()),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Text('\$' +
                                        Accounts.accounts[Accounts.currentAccount]
                                            .cashSell
                                            .toString()),
                                  ),
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
                                  Expanded(
                                    child: Text(Accounts
                                        .accounts[Accounts.currentAccount]
                                        .sumNumberOfFoods
                                        .toString()),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Text('\$' +
                                        Accounts
                                            .accounts[Accounts.currentAccount].sumSell
                                            .toString()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
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
            Accounts.accounts[Accounts.currentAccount]
                .sumNumberCalculator(input: 1);
            Accounts.accounts[Accounts.currentAccount].calculator(input: 1);
            chipController2 = false;
            chipController3 = false;
            chipController1 = !chipController1;
          } else if (index == 2) {
            Accounts.accounts[Accounts.currentAccount]
                .sumNumberCalculator(input: 7);
            Accounts.accounts[Accounts.currentAccount].calculator(input: 7);
            chipController1 = false;
            chipController3 = false;
            chipController2 = !chipController2;
          } else {
            Accounts.accounts[Accounts.currentAccount]
                .sumNumberCalculator(input: 30);
            Accounts.accounts[Accounts.currentAccount].calculator(input: 30);
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
      backgroundColor: Theme.of(context).primaryColor,
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
          Accounts.accounts[Accounts.currentAccount].sumNumberCalculator();
          Accounts.accounts[Accounts.currentAccount].calculator();
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
