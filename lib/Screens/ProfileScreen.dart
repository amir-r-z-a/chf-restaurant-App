import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isObscure = true;
  RegExp regPassword =
      new RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$", multiLine: false);
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  TextEditingController _editingController;
  String initialText = Accounts.accounts[Accounts.currentAccount].name;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Column(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              TextButton(
                onPressed: () => getImage(),
                child: Text(
                  'Set New Photo',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Form(
            key: _formkey,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  MyTextFormField('Name'),
                  MyTextFormField('Phone Number'),
                  MyTextFormField('Email'),
                  Padding(padding: EdgeInsets.all(15)),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  MyTextFormField('Old Password'),
                  MyTextFormField('New Password'),
                  MyTextFormField('Confirm Password'),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(7)),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Map',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(150)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 200,
//                 width: 200,
//                 margin: EdgeInsets.fromLTRB(50, 0, 50, 50),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.pink),
//                   // borderRadius: BorderRadius.circular(100),
//                 ),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     getImage();
//                   },
//                   child: Text("pick image")),
//               Column(
//                 children: [
//                   Container(
//                     height: 80,
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         child: Expanded(
//                           child: Form(
//                             key: _formkey,
//                             child: Column(
//                               children: [
//                                 MyTextFormField(
//                                   "Phone number",
//                                   index: 2,
//                                   addToAccounts: true,
//                                   initial: Accounts
//                                       .accounts[Accounts.currentAccount]
//                                       .phoneNumber,
//                                 ),
//                                 MyTextFormField(
//                                   "Name : ",
//                                   index: 1,
//                                   addToAccounts: true,
//                                   initial: Accounts
//                                       .accounts[Accounts.currentAccount].name,
//                                 ),
//                                 MyTextFormField(
//                                   "Email : ",
//                                   index: 7,
//                                   addToAccounts: true,
//                                   initial: Accounts
//                                       .accounts[Accounts.currentAccount].name,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
