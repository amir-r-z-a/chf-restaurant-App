import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = Accounts.accounts[Accounts.currentAccount].name;
  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }@override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 200,
              margin:EdgeInsets.all(50),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink),
                 borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              height: 50,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Restaurant Name : "),
                      Text(Accounts.accounts[Accounts.currentAccount].name),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            context:context,
                            builder: (context){
                              return Container(
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                                child: Form(
                                  key: _formkey,
                                  child: ListView(
                                    children: [
                                      _editTitleTextField()
                                    ],
                                  ),
                                ),
                              );
                            }
                          );
                        },
                        child: Icon(
                            Icons.edit_rounded,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _editTitleTextField() {
    if (_isEditingText)
      return Center(
        child: TextField(
          onSubmitted: (newValue){
            setState(() {
              initialText = newValue;
              _isEditingText =false;
            });
          },
          autofocus: true,
          controller: _editingController,
        ),
      );
    return InkWell(
        onTap: () {
      setState(() {
        _isEditingText = true;
      });
    },
    child: Text(
    initialText,
    style: TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    ),
    ));
  }
}

