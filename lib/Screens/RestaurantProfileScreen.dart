import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:chfrestaurant/Common/Text/MyPassFormField.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RestaurantProfileScreen extends StatefulWidget {
  static List<LatLng> tappedPoints = [];

  @override
  _RestaurantProfileScreenState createState() =>
      _RestaurantProfileScreenState();
}

class _RestaurantProfileScreenState extends State<RestaurantProfileScreen> {
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
  var _key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var markers = RestaurantProfileScreen.tappedPoints.map((latlng) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: latlng,
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            size: 50,
            color: Colors.red,
          ),
        ),
      );
    }).toList();
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
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
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
              key: _key1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Features',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  MyTextFormField(
                    'Name',
                    index: 1,
                    addToAccounts: true,
                    initial: Accounts.accounts[Accounts.currentAccount].name,
                    hint: 'Edit Your Name',
                  ),
                  MyTextFormField(
                    'Phone Number',
                    index: 2,
                    addToAccounts: true,
                    initial:
                        Accounts.accounts[Accounts.currentAccount].phoneNumber,
                    regex: 'PNEdit',
                    hint: 'Edit Your Phone Number',
                  ),
                  MyTextFormField(
                    'Address',
                    index: 3,
                    addToAccounts: true,
                    initial: Accounts.accounts[Accounts.currentAccount].address,
                    hint: 'Edit Your Address',
                  ),
                  MyTextFormField(
                    'Email',
                    index: 8,
                    addToAccounts: true,
                    initial: Accounts.accounts[Accounts.currentAccount].email,
                    regex: 'Email',
                    hint: 'Edit Your Email',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_key1.currentState.validate()) {
                              _key1.currentState.save();
                              print('Features was changed');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor),
                          child: Text('Save'))
                    ],
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  MyPassFormField(
                    'Old Password',
                    regex: 'PassEdit1',
                    hint: 'Your old Password',
                  ),
                  MyPassFormField(
                    'New Password',
                    regex: 'PassEdit2',
                    hint: 'Your new Password',
                  ),
                  MyPassFormField(
                    'Confirm Password',
                    regex: 'PassEdit3',
                    hint: 'Your confirm Password',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              _formkey.currentState.save();
                            });
                            print('Yor password was changed');
                          }
                        },
                        child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(7)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text('Hold to add pins'),
                    ),
                    SizedBox(
                      height: 500,
                      child: FlutterMap(
                        options: MapOptions(
                            center: LatLng(35.715298, 51.404343),
                            zoom: 13.0,
                            onLongPress: _handleTap),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                "https://api.mapbox.com/styles/v1/amirrza/ckov1rtrs059m17p8xugrutr4/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW1pcnJ6YSIsImEiOiJja292MW0zeGwwNDN1MnBwYzlhbDVyOHByIn0.Mwa8L0WNjyIKc-v32nKOhQ",
                          ),
                          MarkerLayerOptions(markers: markers)
                        ],
                      ),
                    ),
                    // ElevatedButton(onPressed: ()=> print(ProfileScreen.tappedPoints), child: Text("save"))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(LatLng latlng) {
    setState(() {
      if (RestaurantProfileScreen.tappedPoints.isEmpty) {
        RestaurantProfileScreen.tappedPoints.add(latlng);
      } else {
        RestaurantProfileScreen.tappedPoints.clear();
        RestaurantProfileScreen.tappedPoints.add(latlng);
      }
    });
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
