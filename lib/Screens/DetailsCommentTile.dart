import 'dart:io';

import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Common/Common%20Classes/Date.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/main.dart';
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
  static Function function;

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
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: (MediaQuery.of(context).size.height) / 3 + 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                        child: Row(
                          children: [Expanded(child: Text("Question : "))],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(child: Text(DetailsCommentTile.question))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
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
                                              child: MyTextFormField('Reply',
                                                  index: 9,
                                                  initial: DetailsCommentTile
                                                      .answer),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Theme.of(context)
                                                      .primaryColor),
                                              onPressed: () async {
                                                setState(() {
                                                  if (_formkey.currentState
                                                      .validate()) {
                                                    _formkey.currentState
                                                        .save();
                                                    Accounts.accounts[Accounts
                                                            .currentAccount]
                                                        .editCommentsAnswer(
                                                            DetailsCommentTile
                                                                .id,
                                                            MyTextFormField
                                                                .reply);
                                                    DetailsCommentTile.answer =
                                                        MyTextFormField.reply;
                                                    DetailsCommentTile
                                                        .function();
                                                  }
                                                });
                                                String listen = '';
                                                await Socket.connect(
                                                        MyApp.ip, 2442)
                                                    .then((serverSocket) {
                                                  print('connected writer');
                                                  String write =
                                                      'Comments-reply-' +
                                                          MyApp.id +
                                                          '-' +
                                                          DetailsCommentTile
                                                              .id +
                                                          '-' +
                                                          MyTextFormField.reply;
                                                  write = (write.length + 7)
                                                          .toString() +
                                                      ',Client-' +
                                                      write;
                                                  serverSocket.write(write);
                                                  serverSocket.flush();
                                                  print('write: ' + write);
                                                  print('connected listen');
                                                  serverSocket.listen((socket) {
                                                    listen =
                                                        String.fromCharCodes(
                                                                socket)
                                                            .trim()
                                                            .substring(2);
                                                  }).onDone(() {
                                                    print("listen: " + listen);
                                                    Navigator.pop(context);
                                                  });
                                                  // serverSocket.close();
                                                });
                                              },
                                              child: Text("Save"),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text("Reply")),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: (MediaQuery.of(context).size.height) / 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [Expanded(child: Text("Answer : "))],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(children: [
                                Expanded(
                                  child: Text(
                                      (DetailsCommentTile.answer != null &&
                                              DetailsCommentTile.answer != ''
                                          ? DetailsCommentTile.answer
                                          : 'You have not answered yet')),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

//TextFormField(
//                                                   maxLines: null,
//                                                   onSaved: (String value) {
//                                                     // MyTextFormField.password = value;
//                                                   },
//                                                   decoration: InputDecoration(
//                                                     focusedBorder:
//                                                         OutlineInputBorder(
//                                                             borderSide:
//                                                                 const BorderSide(
//                                                                     color: Color
//                                                                         .fromRGBO(
//                                                                             248,
//                                                                             95,
//                                                                             106,
//                                                                             1),
//                                                                     width:
//                                                                         2.0)),
//                                                     errorStyle: TextStyle(
//                                                       color: Color.fromRGBO(
//                                                           248, 95, 106, 1),
//                                                     ),
//                                                     labelText: "Reply",
//                                                     labelStyle: TextStyle(
//                                                         fontSize: 14,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Color.fromRGBO(
//                                                             248, 95, 106, 1)),
//                                                     hintText: "Your Reply ",
//                                                     hintStyle: TextStyle(
//                                                       fontSize: 16,
//                                                       color: Color.fromRGBO(
//                                                           209, 214, 219, 1),
//                                                     ),
//                                                   ),
//                                                 ),
