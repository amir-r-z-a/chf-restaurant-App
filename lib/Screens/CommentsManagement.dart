import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Comment.dart';
import 'package:flutter/material.dart';

class CommentsManagement extends StatefulWidget {
  @override
  _CommentsManagementState createState() => _CommentsManagementState();
}

class _CommentsManagementState extends State<CommentsManagement> {
  bool chipController1 = false;
  bool chipController2 = false;
  bool chipController3 = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
              Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
              (index) => Text(Accounts
                  .accounts[Accounts.currentAccount].tabBarTitle[index]),
            ),
          ),
          centerTitle: true,
          title: Text('Comments Management'),
        ),
        body: TabBarView(
          children: List.generate(
            Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
            (i) => ListView(
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
                        .restaurantComments[i].length,
                    (j) => Accounts.accounts[Accounts.currentAccount]
                        .restaurantComments[i][j],
                  ),
                ),
              ],
            ),
          ),
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