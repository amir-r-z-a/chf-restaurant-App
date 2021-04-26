import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xfff85f6a)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.title,size: 60,color: Color(0xff1e2a78),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      Text("TO DO",style: TextStyle(fontFamily:'Regular' , fontSize: 25,color: Color(0xfffc5c9c) ),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink) ,
                      backgroundColor: Color(0xff1e2a78),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text("Manage Your Tasks Here",style: TextStyle(fontFamily:'Regular' , fontSize: 20),)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
