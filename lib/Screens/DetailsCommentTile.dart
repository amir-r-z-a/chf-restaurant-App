import 'package:chfrestaurant/Classes/Date.dart';
import 'package:flutter/material.dart';

class DetailsCommentTile extends StatefulWidget {
  static String question;
  static String answer;
  static String clientPhoneNumber;
  static String destinationRestaurant;
  static String foodName;
  static String point;
  static Date date;
  static String id;

  @override
  _DetailsCommentTileState createState() => _DetailsCommentTileState();
}

class _DetailsCommentTileState extends State<DetailsCommentTile> {
  var _formkey = GlobalKey<FormState>();

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
                    height: (MediaQuery.of(context).size.height) - 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Row(
                                children: [
                                  Expanded(child: Text("Question : "))
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(child: Text(DetailsCommentTile.question))
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(children: [
                                      Text("Answer : "),
                                      Text(DetailsCommentTile.answer != null
                                          ? DetailsCommentTile.answer
                                          : 'You have not answered yet')
                                    ]),
                                  )
                                ],
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return ListView(
                                    children: [
                                      Form(
                                          key: _formkey,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: TextFormField(
                                                  maxLines: null,
                                                  onSaved: (String value) {
                                                    // MyTextFormField.password = value;
                                                  },
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            248,
                                                                            95,
                                                                            106,
                                                                            1),
                                                                    width:
                                                                        2.0)),
                                                    errorStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          248, 95, 106, 1),
                                                    ),
                                                    labelText: "Reply",
                                                    labelStyle: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            248, 95, 106, 1)),
                                                    hintText: "Your Reply ",
                                                    hintStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromRGBO(
                                                          209, 214, 219, 1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text("Save"))
                                            ],
                                          ))
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text("reply : "))
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
