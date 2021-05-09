import 'package:flutter/material.dart';

class DetailsCommentTile extends StatefulWidget {
  @override
  _DetailsCommentTileState createState() => _DetailsCommentTileState();
}

class _DetailsCommentTileState extends State<DetailsCommentTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Comment Details"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: (MediaQuery.of(context).size.height)-120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all()
                    ),
                    child: Column(
                      children: [
                        Row(children: [Text("Question : ")],),
                        Row(children: [Text(" ")],)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
