import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}
class _MainMenuScreenState extends State<MainMenuScreen> {
  int _currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentSelected,
          onTap: (value) {
            setState(() => _currentSelected = value);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant_sharp),
              label: 'Orders',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              label: 'DashBoard',
              backgroundColor: Colors.purple,
            ),
          ],
        ),
        drawer: Container(
          child: Text("here is a drawer"),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Main Menu"),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("Menu Edition"),
                            ),
                            Container(
                              child: Icon(
                                Icons.edit_rounded,
                                size: 35,
                              ),
                              margin: EdgeInsets.only(left: 20),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.pink),
                            borderRadius:
                                const BorderRadius.all(const Radius.circular(8))),
                        width: 170,
                        height: 120,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("Orders History"),
                            ),
                            Container(
                              child: Icon(
                                Icons.edit_rounded,
                                size: 35,
                              ),
                              margin: EdgeInsets.only(left: 20),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.pink),
                            borderRadius:
                                const BorderRadius.all(const Radius.circular(8))),
                        width: 170,
                        height: 120,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("Hesabdari"),
                            ),
                            Container(
                              child: Icon(
                                Icons.edit_rounded,
                                size: 35,
                              ),
                              margin: EdgeInsets.only(left: 20),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.pink),
                            borderRadius:
                                const BorderRadius.all(const Radius.circular(8))),
                        width: 170,
                        height: 120,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("Comments"),
                            ),
                            Container(
                              child: Icon(
                                Icons.edit_rounded,
                                size: 35,
                              ),
                              margin: EdgeInsets.only(left: 20),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.pink),
                            borderRadius:
                                const BorderRadius.all(const Radius.circular(8))),
                        width: 170,
                        height: 120,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
