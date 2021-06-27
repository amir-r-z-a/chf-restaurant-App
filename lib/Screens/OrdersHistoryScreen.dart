import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Date.dart';
import 'package:flutter/material.dart';

class OrdersHistoryScreen extends StatefulWidget {
  @override
  _OrdersHistoryScreenState createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen> {
  bool chipController1 = false;
  bool chipController2 = false;
  bool chipController3 = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:
          Accounts.accounts[Accounts.currentAccount].getOrdersHistoryLength(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Orders History'),
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
            Column(
              children: List.generate(
                Accounts.accounts[Accounts.currentAccount]
                    .getOrdersHistoryLength(),
                (index) {
                  bool flag = true;
                  if (chipController1) {
                    if (Accounts.accounts[Accounts.currentAccount]
                        .ordersHistory[index].orderDate
                        .validDate(
                            Date(), 1)) {
                      return Accounts.accounts[Accounts.currentAccount]
                          .ordersHistory[index];
                    } else {
                      flag = false;
                    }
                  } else if (chipController2) {
                    if (Accounts.accounts[Accounts.currentAccount]
                        .ordersHistory[index].orderDate
                        .validDate(
                            Date(), 7)) {
                      return Accounts.accounts[Accounts.currentAccount]
                          .ordersHistory[index];
                    } else {
                      flag = false;
                    }
                  } else if (chipController3) {
                    if (Accounts.accounts[Accounts.currentAccount]
                        .ordersHistory[index].orderDate
                        .validDate(
                            Date(), 30)) {
                      return Accounts.accounts[Accounts.currentAccount]
                          .ordersHistory[index];
                    } else {
                      flag = false;
                    }
                  } else if (flag) {
                    return Accounts
                        .accounts[Accounts.currentAccount].ordersHistory[index];
                  }
                  return Container(
                    height: 0,
                    width: 0,
                  );
                },
              ),
            )
          ],
        ),
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
