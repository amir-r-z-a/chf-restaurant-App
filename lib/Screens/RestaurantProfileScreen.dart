import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Screens/RestaurantMainMenuScreen.dart';
import 'package:chfrestaurant/main.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:chfrestaurant/Common/Text/MyPassFormField.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RestaurantProfileScreen extends StatefulWidget {
  static List<LatLng> tappedPoints = [];
  static String initialName = '';
  static String initialEmail = '';
  static String initialAddress = '';
  static String initialRadius = '';

  @override
  _RestaurantProfileScreenState createState() =>
      _RestaurantProfileScreenState();
}

class _RestaurantProfileScreenState extends State<RestaurantProfileScreen> {
  TextEditingController _controllerOldPass = TextEditingController();
  TextEditingController _controllerNewPass = TextEditingController();
  TextEditingController _controllerConfirmPass = TextEditingController();

  bool validateOldPass = false;
  bool validateNewPass = false;

  bool _isObscure = true;
  bool _isObscure1 = true;
  bool _isObscure2 = true;
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

  // TextEditingController _editingController;
  // String initialText = Accounts.accounts[Accounts.currentAccount].name;

  // @override
  // void initState() {
  //   super.initState();
  //   _editingController = TextEditingController(text: initialText);
  // }

  // @override
  // void dispose() {
  //   _editingController.dispose();
  //   super.dispose();
  // }

  var _formkey = GlobalKey<FormState>();
  var _key1 = GlobalKey<FormState>();
  var _key2 = GlobalKey<FormState>();
  var _key3 = GlobalKey<FormState>();
  String _controllerName = '';
  String _controllerPhoneNumber = '';
  String _controllerEmail = '';
  bool validatePhoneNumber = false;
  String _controllerRadius = '';
  String _controllerAddress = '';
  bool nullRadius = false;

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
                  TextFormField(
                    initialValue: RestaurantProfileScreen.initialName,
                    validator: (value) {
                      _controllerName = value;
                      if (value == null || value.isEmpty) {
                        return "Please enter something";
                      }
                      return null;
                    },
                    cursorColor: Color.fromRGBO(248, 95, 106, 1),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Color.fromRGBO(248, 95, 106, 1),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(248, 95, 106, 1)),
                      hintText: 'Edit Your Name',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(209, 214, 219, 1),
                      ),
                    ),
                  ),
                  // MyTextFormField(
                  //   'Name',
                  //   index: 1,
                  //   addToAccounts: true,
                  //   initial: Accounts.accounts[Accounts.currentAccount].name,
                  //   hint: 'Edit Your Name',
                  // ),
                  TextFormField(
                    initialValue: MyApp.id,
                    validator: (value) {
                      _controllerPhoneNumber = value;
                      if (value == null || value.isEmpty) {
                        return "Please enter something";
                      } else if (Accounts.validPhoneNumber(
                          _controllerPhoneNumber)) {
                        return 'Your phone number is not valid';
                      } else if (validatePhoneNumber) {
                        return 'Your phone number is already registered';
                      }
                      return null;
                    },
                    cursorColor: Color.fromRGBO(248, 95, 106, 1),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Color.fromRGBO(248, 95, 106, 1),
                      ),
                      labelText: 'PhoneNumber',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(248, 95, 106, 1)),
                      hintText: 'Edit Your PhoneName',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(209, 214, 219, 1),
                      ),
                    ),
                  ),
                  // MyTextFormField(
                  //   'Phone Number',
                  //   index: 2,
                  //   addToAccounts: true,
                  //   initial:
                  //       Accounts.accounts[Accounts.currentAccount].phoneNumber,
                  //   regex: 'PNEdit',
                  //   hint: 'Edit Your Phone Number',
                  // ),
                  TextFormField(
                    initialValue: RestaurantProfileScreen.initialEmail,
                    validator: (value) {
                      _controllerEmail =
                          value.isEmpty || value == null ? 'null' : value;
                      return null;
                    },
                    cursorColor: Color.fromRGBO(248, 95, 106, 1),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Color.fromRGBO(248, 95, 106, 1),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(248, 95, 106, 1)),
                      hintText: 'Edit Your Email',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(209, 214, 219, 1),
                      ),
                    ),
                  ),
                  // MyTextFormField(
                  //   'Email',
                  //   index: 8,
                  //   addToAccounts: true,
                  //   initial: Accounts.accounts[Accounts.currentAccount].email,
                  //   regex: 'Email',
                  //   hint: 'Edit Your Email',
                  // ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () => checkerFeature(),
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
                  TextFormField(
                    controller: _controllerOldPass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter something";
                      } else if (validateOldPass) {
                        return 'Your input does not match your old password';
                      }
                      return null;
                    },
                    cursorColor: Color.fromRGBO(248, 95, 106, 1),
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(248, 95, 106, 1),
                              width: 2.0)),
                      errorStyle: TextStyle(
                        color: Color.fromRGBO(248, 95, 106, 1),
                      ),
                      suffixIcon: IconButton(
                        color: Color.fromRGBO(248, 95, 106, 1),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      labelText: 'Old Password',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(248, 95, 106, 1)),
                      hintText: 'Your old Password',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(209, 214, 219, 1),
                      ),
                    ),
                  ),
                  // MyPassFormField(
                  //   'Old Password',
                  //   regex: 'PassEdit1',
                  //   hint: 'Your old Password',
                  // ),
                  TextFormField(
                    controller: _controllerNewPass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter something";
                      } else if (Accounts.validPassword(value)) {
                        return 'Your password should contain at least one number and one letter';
                      }
                      return null;
                    },
                    obscureText: _isObscure1,
                    cursorColor: Color.fromRGBO(248, 95, 106, 1),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(248, 95, 106, 1),
                              width: 2.0)),
                      errorStyle: TextStyle(
                        color: Color.fromRGBO(248, 95, 106, 1),
                      ),
                      suffixIcon: IconButton(
                        color: Color.fromRGBO(248, 95, 106, 1),
                        onPressed: () {
                          setState(() {
                            _isObscure1 = !_isObscure1;
                          });
                        },
                        icon: Icon(_isObscure1
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      labelText: 'New Password',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(248, 95, 106, 1)),
                      hintText: 'Your new Password',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(209, 214, 219, 1),
                      ),
                    ),
                  ),
                  // MyPassFormField(
                  //   'New Password',
                  //   regex: 'PassEdit2',
                  //   hint: 'Your new Password',
                  // ),
                  TextFormField(
                    controller: _controllerConfirmPass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter something";
                      } else if (validateNewPass) {
                        return 'Your input does not match your new password';
                      }
                      return null;
                    },
                    cursorColor: Color.fromRGBO(248, 95, 106, 1),
                    obscureText: _isObscure2,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(248, 95, 106, 1),
                              width: 2.0)),
                      errorStyle: TextStyle(
                        color: Color.fromRGBO(248, 95, 106, 1),
                      ),
                      suffixIcon: IconButton(
                        color: Color.fromRGBO(248, 95, 106, 1),
                        onPressed: () {
                          setState(() {
                            _isObscure2 = !_isObscure2;
                          });
                        },
                        icon: Icon(_isObscure2
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(248, 95, 106, 1)),
                      hintText: 'Your confirm Password',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(209, 214, 219, 1),
                      ),
                    ),
                  ),
                  // MyPassFormField(
                  //   'Confirm Password',
                  //   regex: 'PassEdit3',
                  //   hint: 'Your confirm Password',
                  // ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => checkerPassword(),
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
                Padding(padding: EdgeInsets.all(10)),
                Column(
                  children: [
                    Form(
                      key: _key2,
                      child: TextFormField(
                        initialValue: RestaurantProfileScreen.initialAddress,
                        validator: (value) {
                          _controllerAddress = value;
                          if (value == null || value.isEmpty) {
                            return "Please enter something";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            color: Color.fromRGBO(248, 95, 106, 1),
                          ),
                          labelText: 'Address',
                          labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(248, 95, 106, 1)),
                          hintText: 'Enter Your Address',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(209, 214, 219, 1),
                          ),
                        ),
                      ),
                    ),
                    // MyTextFormField(
                    //   'Address',
                    //   index: 3,
                    //   addToAccounts: true,
                    //   // initial: Accounts
                    //   //     .accounts[Accounts.currentAccount].address,
                    //   hint: 'Edit Your Address',
                    // ),
                    Form(
                      key: _key3,
                      child: TextFormField(
                        initialValue: RestaurantProfileScreen.initialRadius,
                        validator: (value) {
                          _controllerRadius = value;
                          if (nullRadius) {
                            return "Please enter something";
                          }
                          /*if (value == null && value.isEmpty) {
                            return "Please enter something";
                          }*/ /*else if (int.parse(value) <= 0) {
                            return 'Your Radius of works is not valid';
                          }*/
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            color: Color.fromRGBO(248, 95, 106, 1),
                          ),
                          labelText: 'Radius of works',
                          labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(248, 95, 106, 1)),
                          hintText: 'Your Radius Of works',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(209, 214, 219, 1),
                          ),
                        ),
                      ),
                    ),
                    // MyTextFormField(
                    //   'Radius of works',
                    //   index: 10,
                    // ),
                    ElevatedButton(
                        onPressed: () => location(),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        child: Text("Save"))
                  ],
                ),
                // Padding(padding: EdgeInsets.all(10)),
                Padding(padding: EdgeInsets.all(10)),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(LatLng latlng) async {
    if (RestaurantProfileScreen.tappedPoints.isEmpty) {
      RestaurantProfileScreen.tappedPoints.add(latlng);
    } else {
      RestaurantProfileScreen.tappedPoints.clear();
      RestaurantProfileScreen.tappedPoints.add(latlng);
    }
    print(latlng);
    String listen = '';
    await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
      print('connected writer');
      String write = 'RestaurantEditProfile-location';
      write += ('-latLang-' +
          MyApp.id +
          '-' +
          RestaurantProfileScreen.tappedPoints[0]
              .toString()
              .replaceAll(', ', ':::'));
      write = (write.length + 11).toString() + ',Restaurant-' + write;
      serverSocket.write(write);
      serverSocket.flush();
      print('write: ' + write);
      print('connected listen');
      serverSocket.listen((socket) {
        listen = String.fromCharCodes(socket).trim().substring(2);
      }).onDone(() {
        print("listen: " + listen);
        Accounts.accounts[Accounts.currentAccount].location =
            RestaurantProfileScreen.tappedPoints[0];
      });
    });

    // Accounts.accounts[Accounts.currentAccount].location = latlng;
    setState(() {});
  }

  void location() async {
    bool address = _key2.currentState.validate();
    _key3.currentState.validate();
    bool radius = !(_controllerRadius == null || _controllerRadius.isEmpty);
    nullRadius = !radius;
    _key3.currentState.validate();
    String listen = '';
    String stringAddress = _controllerAddress;
    String stringRadius = _controllerRadius;
    await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
      print('connected writer');
      String write = 'RestaurantEditProfile-location';
      if (address) {
        write += ('-address-' + MyApp.id + '-' + stringAddress);
      }
      if (radius) {
        write += ('-radius-' + MyApp.id + '-' + stringRadius);
      }
      write = (write.length + 11).toString() + ',Restaurant-' + write;
      serverSocket.write(write);
      serverSocket.flush();
      print('write: ' + write);
      print('connected listen');
      serverSocket.listen((socket) {
        listen = String.fromCharCodes(socket).trim().substring(2);
      }).onDone(() {
        print("listen: " + listen);
        if (address) {
          Accounts.accounts[Accounts.currentAccount].address = stringAddress;
        }
        if (radius) {
          Accounts.accounts[Accounts.currentAccount].radiusOfWork =
              double.parse(stringRadius);
        }
      });
    });
  }

  void checkerPassword() async {
    print('tap password');
    //baraye safe boodan bishtar bayad chek kardan null va chek kardan validPassword ham inja anjam shavad
    //manzoor az safe boodan in ast ke vaqti controller chek mishavad momken ast bad az check shodan controller karbar voroodi digari vared konad va vaqti dobare az controller estefade mikonim meqdar jadid ke check nashode estefade mishavad
    //dar kol barname in masale check shavad
    if (_formkey.currentState.validate()) {
      String listen = '';
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        String newPassword = _controllerNewPass.text;
        String write = 'RestaurantEditProfile-password-' +
            MyApp.id +
            '-' +
            _controllerOldPass.text +
            '-' +
            newPassword +
            '-' +
            _controllerConfirmPass.text;
        write = (write.length + 11).toString() + ',Restaurant-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() {
          print("listen: " + listen);
          List<String> split = listen.split('-');
          validateOldPass = split[0] == 'invalid';
          validateNewPass = split[1] == 'invalid';
          if (_formkey.currentState.validate()) {
            _controllerOldPass.clear();
            _controllerNewPass.clear();
            _controllerConfirmPass.clear();
            Accounts.accounts[Accounts.currentAccount].password = newPassword;
            print('password changed');
          } else {
            validateOldPass = false;
            validateNewPass = false;
          }
        });
      });
    }
  }

  void checkerFeature() async {
    print('tap feature');
    if (_key1.currentState.validate()) {
      String listen = '';
      bool phoneNumber = false;
      int numOfPhoneNumber = -1;
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        String write = 'RestaurantEditProfile-feature';
        if (RestaurantProfileScreen.initialName != _controllerName) {
          write += '-name-';
          write += (MyApp.id + '-');
          write += _controllerName;
        }
        if (RestaurantProfileScreen.initialEmail != _controllerEmail) {
          write += '-email-';
          write += (MyApp.id + '-');
          write += _controllerEmail;
        }
        if (MyApp.id != _controllerPhoneNumber) {
          write += '-phoneNumber-';
          write += (MyApp.id + '-');
          write += _controllerPhoneNumber;
          phoneNumber = true;
          numOfPhoneNumber++;
        }
        write = (write.length + 11).toString() + ',Restaurant-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() async {
          print("listen: " + listen);
          if (phoneNumber) {
            validatePhoneNumber =
                listen.split('-')[numOfPhoneNumber] == 'invalid';
            String safeControllerPhoneNumber = _controllerPhoneNumber;
            if (_key1.currentState.validate()) {
              MyApp.id = safeControllerPhoneNumber;
              Accounts.accounts[Accounts.currentAccount].phoneNumber =
                  safeControllerPhoneNumber;
            } else {
              validatePhoneNumber = false;
            }
          }
          Accounts.accounts[Accounts.currentAccount].name =
              RestaurantProfileScreen.initialName = _controllerName;
          Accounts.accounts[Accounts.currentAccount].email =
              RestaurantProfileScreen.initialEmail = _controllerEmail;
          // if (_key1.currentState.validate()) {
          //   _key1.currentState.save();
          //   print('feature was changed');
          // }
        });
      });
    }
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
