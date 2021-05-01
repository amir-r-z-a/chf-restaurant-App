import 'package:flutter/material.dart';
class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Container(
          child: Text("here is a drawer"),
        ),
       appBar: AppBar(
         title: Text("hi"),
       ),
        body: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(30, 60, 0,0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.pink),
                        borderRadius: const BorderRadius.all(const Radius.circular(8))
                      ),
                      width: 150,
                      height: 90,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 60,30,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.pink),
                          borderRadius: const BorderRadius.all(const Radius.circular(8))
                      ),
                      width: 150,
                      height: 90,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 60, 0,0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.pink),
                          borderRadius: const BorderRadius.all(const Radius.circular(8))
                      ),
                      width: 150,
                      height: 90,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 60, 30,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.pink),
                          borderRadius: const BorderRadius.all(const Radius.circular(8))
                      ),
                      width: 150,
                      height: 90,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
