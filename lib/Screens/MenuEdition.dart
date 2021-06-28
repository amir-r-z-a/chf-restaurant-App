import 'dart:io';
import 'package:search_page/search_page.dart';
import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/RestaurantFoodTile.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:chfrestaurant/Screens/DetailsRestaurantActiveOrderTile.dart';
import 'package:chfrestaurant/Screens/RestaurantProfileScreen.dart';
import 'package:chfrestaurant/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuEdition extends StatefulWidget {
  // static List<String> tabBarTitle = [];

  // static int tabBarTitleLength;

  // static List<RestaurantFoodTile>
  @override
  _MenuEditionState createState() => _MenuEditionState();
}

class _MenuEditionState extends State<MenuEdition> {
  var key1 = GlobalKey<FormState>();

  void refreshPage() {
    setState(() {});
  }

  void navigateToProfileScreen() async {
    String listen = '';
    await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
      print('connected writer');
      String write = 'RestaurantGetData-name-' + MyApp.id;
      write = (write.length + 11).toString() + ',Restaurant-' + write;
      serverSocket.write(write);
      serverSocket.flush();
      print('write: ' + write);
      print('connected listen');
      serverSocket.listen((socket) {
        listen = String.fromCharCodes(socket).trim().substring(2);
      }).onDone(() async {
        print("listen: " + listen);
        RestaurantProfileScreen.initialName = listen;
        String listenEmail = '';
        await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
          print('connected writer');
          String write = 'RestaurantGetData-email-' + MyApp.id;
          write = (write.length + 11).toString() + ',Restaurant-' + write;
          serverSocket.write(write);
          serverSocket.flush();
          print('write: ' + write);
          print('connected listen');
          serverSocket.listen((socket) {
            listenEmail = String.fromCharCodes(socket).trim().substring(2);
          }).onDone(() async {
            print("listen: " + listenEmail);
            RestaurantProfileScreen.initialEmail = listenEmail;
            if (RestaurantProfileScreen.initialEmail == 'null') {
              RestaurantProfileScreen.initialEmail = '';
            }
            String listenAddress = '';
            await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
              print('connected writer');
              String write = 'RestaurantGetData-address-' + MyApp.id;
              write = (write.length + 11).toString() + ',Restaurant-' + write;
              serverSocket.write(write);
              serverSocket.flush();
              print('write: ' + write);

              print('connected listen');
              serverSocket.listen((socket) {
                listenAddress =
                    String.fromCharCodes(socket).trim().substring(2);
              }).onDone(() async {
                print("listen: " + listenAddress);
                RestaurantProfileScreen.initialAddress = listenAddress;
                if (RestaurantProfileScreen.initialAddress == 'null') {
                  RestaurantProfileScreen.initialAddress = '';
                }
                String listenRadius = '';
                await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
                  print('connected writer');
                  String write = 'RestaurantGetData-radius-' + MyApp.id;
                  write =
                      (write.length + 11).toString() + ',Restaurant-' + write;
                  serverSocket.write(write);
                  serverSocket.flush();
                  print('write: ' + write);
                  print('connected listen');
                  serverSocket.listen((socket) {
                    listenRadius =
                        String.fromCharCodes(socket).trim().substring(2);
                  }).onDone(() {
                    print("listen: " + listenRadius);
                    RestaurantProfileScreen.initialRadius = listenRadius;
                    if (RestaurantProfileScreen.initialRadius == 'null') {
                      RestaurantProfileScreen.initialRadius = '';
                    }
                    print('success initialize');
                    print('name: ' + RestaurantProfileScreen.initialName);
                    print('email: ' + RestaurantProfileScreen.initialEmail);
                    print('address: ' + RestaurantProfileScreen.initialAddress);
                    print('radius: ' + RestaurantProfileScreen.initialRadius);
                    Navigator.pushNamed(context, '/ProfileScreen');
                  });
                });
              });
            });
          });
        });
      });
    });
  }

  void nullAddress(bool flag) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(flag ? 'Address not added' : 'Radius of work not added'),
        content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Unregistered ' +
                  (flag ? 'address' : 'Radius of work') +
                  ', Please register' +
                  (flag ? ' address' : 'Radius of work') +
                  ' first'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    onPressed: () => navigateToProfileScreen()
                    /*Navigator.pushNamed(context, '/ProfileScreen')*/,
                    child: Text(
                      flag ? 'Add Address' : 'Add Radius of work',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addFood() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Form(
          key: key1,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              Text(
                'Add Food',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              MyTextFormField(
                'Category',
                index: 4,
                hint: 'Your category',
                regex: 'Category',
              ),
              MyTextFormField(
                'Name',
                index: 5,
                hint: 'Your name',
                regex: 'FoodName',
              ),
              MyTextFormField(
                'Desc',
                index: 7,
                hint: 'Your desc',
              ),
              MyTextFormField(
                'Price',
                hint: 'Your price (example: 28.40)',
                regex: 'Price',
                index: 6,
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                  onPressed: () async {
                    if (key1.currentState.validate()) {
                      bool flag = true;
                      key1.currentState.save();
                      RestaurantFoodTile food = RestaurantFoodTile(
                          MyTextFormField.foodName,
                          MyTextFormField.foodPrice,
                          true,
                          MyTextFormField.foodCategory,
                          desc: MyTextFormField.foodDesc);
                      Accounts.accounts[Accounts.currentAccount]
                          .addNewTopTenFoodsElements(food);
                      for (int i = 0;
                          i <
                              Accounts.accounts[Accounts.currentAccount]
                                  .getTabBarTitleLength();
                          i++) {
                        if (Accounts.accounts[Accounts.currentAccount]
                                .tabBarTitle[i] ==
                            MyTextFormField.foodCategory) {
                          Accounts.accounts[Accounts.currentAccount]
                              .addTabBarViewElements(food, i);
                          flag = false;
                        }
                      }
                      if (flag) {
                        Accounts.accounts[Accounts.currentAccount]
                            .addTabBarTitle(MyTextFormField.foodCategory, food);

                        print(Accounts.currentAccount);
                        print(Accounts.accounts.length);
                        print(Accounts
                            .accounts[Accounts.currentAccount].tabBarTitle);
                        print(Accounts.accounts[Accounts.currentAccount]
                            .restaurantTabBarView);
                      }
                      if (flag) {
                        String listen = '';
                        await Socket.connect(MyApp.ip, 2442)
                            .then((serverSocket) {
                          print('connected writer');
                          String write = 'RestaurantMenuEdition-addCategory-' +
                              MyApp.id +
                              '-' +
                              MyTextFormField.foodCategory;
                          write = (write.length + 11).toString() +
                              ',Restaurant-' +
                              write;
                          serverSocket.write(write);
                          serverSocket.flush();
                          print('write: ' + write);
                          print('connected listen');
                          serverSocket.listen((socket) {
                            listen = String.fromCharCodes(socket)
                                .trim()
                                .substring(2);
                          }).onDone(() {
                            print("listen: " + listen);
                            addServerFood();
                          });
                          // serverSocket.close();
                        });
                      } else {
                        addServerFood();
                      }
                    }
                  },
                  child: Text('Add'))
            ],
          ),
        );
      },
    );
  }

  void addServerFood() async {
    String listen = '';
    await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
      print('connected writer');
      String write = 'RestaurantMenuEdition-addFood-' +
          MyApp.id +
          '-' +
          MyTextFormField.foodCategory +
          '-' +
          MyTextFormField.foodName +
          '-' +
          ((MyTextFormField.foodDesc == null ||
                  MyTextFormField.foodDesc.isEmpty)
              ? 'null'
              : MyTextFormField.foodDesc) +
          '-' +
          MyTextFormField.foodPrice +
          '-true-0';
      write = (write.length + 11).toString() + ',Restaurant-' + write;
      serverSocket.write(write);
      serverSocket.flush();
      print('write: ' + write);
      print('connected listen');
      serverSocket.listen((socket) {
        listen = String.fromCharCodes(socket).trim().substring(2);
      }).onDone(() {
        print("listen: " + listen);
        setState(() {});
        Navigator.pop(context);
      });
      // serverSocket.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(248, 95, 106, 1),
          onPressed: () {
            (Accounts.accounts[Accounts.currentAccount].address == null ||
                    Accounts.accounts[Accounts.currentAccount].location ==
                        null ||
                    Accounts.accounts[Accounts.currentAccount].radiusOfWork ==
                        null)
                ? nullAddress(Accounts
                            .accounts[Accounts.currentAccount].address ==
                        null ||
                    Accounts.accounts[Accounts.currentAccount].location == null)
                : addFood();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Menu Edition',
            style: TextStyle(fontSize: 16.0),
          ),
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white,
            tabs: List.generate(
              Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
              (index) {
                RestaurantFoodTile.function = refreshPage;
                return Text(
                  Accounts.accounts[Accounts.currentAccount].tabBarTitle[index],
                );
              },
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon:Icon( Icons.search),
                onPressed: (){
                  print("s");
                  showSearch(
                      context: context,
                      delegate: SearchPage<RestaurantFoodTile>(
                          onQueryUpdate: (s) => print(s),
                          searchLabel: 'Search people',
                          suggestion: Center(
                            child: Text('Filter restaurants by name'),
                          ),
                          failure:
                          Center(child: Text('No restaurant found :(')),
                          builder: (RestaurantFoodTile rs) =>
                          rs ,
                          filter: (RestaurantFoodTile rt) =>
                          [rt.name],
                          items:Accounts.accounts[Accounts.currentAccount].restaurantTabBarView[0]));
                },
              )
            ),
          ],
        ),
        body: TabBarView(
          children: List.generate(
            Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
            (i) {
              return ListView(
                children: List.generate(
                    Accounts.accounts[Accounts.currentAccount]
                        .restaurantTabBarView[i].length,
                    (j) => Accounts.accounts[Accounts.currentAccount]
                        .restaurantTabBarView[i][j]),
              );
            },
          ),
        ),
      ),
    );
  }
}
//agar name FoodTile dar alertDialog ja nashavad out of the bounds mikhorad
//desc dar FoodTile faqat yek khat namayesh dahad vagarna out of the bounds mikhorad
//padding az bala baraye OrdersMenu(fasele dashtan TabBar va FoodTile aval)
//vaqti rooye axe Food click mikone alertDialog baz she va ax tooye oon bashe
//vaqti Food ro delete mikone behesh bege aya motmaeni? (ba hamoon widgete AlertDialog)
//dar DetailsFoodTile karbar mitoone axe Food ro taqir bede
//responsive kardan panele asli(MainMenuScreen)
//ezafe kardan daste bedoone category
//row kardan profile dar drawer
//agar jaii(masalan dar class order niaz be class Food bood va na FoodTile mishe ye class Food tarif kard va foodTile oon ro extend kone)
//entekhab kardan status dar Add Food(be soorat radio: active,inactive)
//ezafe kardan delete (delete all type)
// dorost kardan radio ha
//hame showModalButtonSheet ha va baqie dokme ha ba builder responsive shavand
//dorost kardan zaher TabBar(fasele dashtan Tab ha az ham) va AppBar
//dorost kardan class color ha va ezafe kardan entekhab theme baraye barname
//vaqti title jadid add mishavad position avavz shavad va rooye an beravad
//ezafe kardan emza be barname(Arman Amirreza)
//add kardan image baraye hame ja
//taqir dadane category yek Food
//edite esme category too DetailsFoodTile (too onja mitoone category Food ro be yeki az category haye qabli ya category jadid taqir bede)
//ezafe kardan qabeliat @gmail be MyTextFormField
//edit haye DetailsFoodTile mesl profile dakhele drawer beshe
//dorost kardan rang desc(toosi mesl aks proje) dar DetailsFoodTile
//buttonSheep ha va dokme ha ba builder responsive shavad (mesl todolist)
//zire har qaza comment haye marboot be an qaza amade bashad(har comment yek field String nameFood dashte bashad va har Food ye List az comment ha dashte bashad vaqti commenti be Restaurant add mishavad be List comment haye Food niz add shavad)
//agar price ra 22.4 vared kard be soorat zemni 22.40 tabdil shavad
//client betavanad be khode resturant(na food) comment befrestad
//baraye OrderHistory ham TabBar(baraye tafkik category ha) va chip baraye tarikh(1,7,30 days ago) ezafe shavad
// tarahi RestaurantFoodTile mesle RestaurantCommentTile beshe
//3 field panel dar order enum shavad
//khoondan comment haye baqie class ha
//dorost kardan zaher TabBar commentManagements
//har safhe dar CommentsManagements 3chip makhsoos be khod ra dashte bashad
//safhe profile validator nadare age phone number ro be 0919oooo taqir bedim taqir mide hamchenin password ham newPassword va oldPassword nadare va regex email ham kar nemikone
//dar commentTile be resturan dar neshan dahad ke aya answer ra por karde ya na
//dar safhe DetailsRestaurantActiveOrderTile agar esm food ya qeymat ya tedad toolani shavad out of bound mikhore Expanded lazem dare dar zemn bayad 3 sotoon zir ham bashan
//month ha dar validDate be khareji bashad
//hame jaye barname TextFormField hash vaqti jomle ziad type mikonim biad khat paiin
//samte raste MyTextFormFielde Radius of works Text(km) neveshte shavad
//khoondan comment haye hame class ha va screen ha
//comment haye qabl 30 rooz ham betavanad bebinad(mahdoodiat zamani nadashte bashad va har che qadr khast be aqab beravad)
//hame alertDialog ha TextButton hash bold beshe
//mirtavan map ra yek class kard ke har dafe lazem nabashad handle tap va addressButtonSheet ra copy paste kard
//zadan forget password
//dar profileScreen vaqti password avaz mishavad balaye save success sabz biayad

//profileScreen bayad joori bashad ke age masalan name null bood va email taqir karde bood email dar dataBase sabt shavad na inke email vabaste be null boodan name bashad
//hamintor dar address va radiusOfWorks agar address por shode bood va radiusOfWorks khali bood va dokme save zade shavad bayad address ke por ast ra sabt karde va dar validator radiusOfWorks ke khali ast khata neshan dahad
//baraye inkar bayad mesle locationChecker() dar profileScreen amal kard ke keyForm ha ro az ham joda karde va agar null bood error neshoon mide va nemifreste va agar null nabood mifreste

//add kardan tag(entekhab chand menu ba ham)
//vasat order agar qaza pak konad be moshkel mikhorim

//ShapeDecoration(shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20),side:BorderSide(color: Colors.green,) ))
//FilterChip,RawChip
