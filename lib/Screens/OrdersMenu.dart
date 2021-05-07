import 'package:chfrestaurant/Classes/Accounts.dart';
import 'package:chfrestaurant/Classes/Food.dart';
import 'package:chfrestaurant/Common/Text/MyTextFormField.dart';
import 'package:flutter/material.dart';

class OrdersMenu extends StatefulWidget {
  @override
  _OrdersMenuState createState() => _OrdersMenuState();
}

class _OrdersMenuState extends State<OrdersMenu> {
  var key1 = GlobalKey<FormState>();

  void refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(248, 95, 106, 1),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Form(
                  key: key1,
                  child: ListView(padding: EdgeInsets.all(10), children: [
                    Text(
                      'Add Food',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
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
                    TextFormField(
                      onSaved: (String value) =>
                          MyTextFormField.foodDesc = value,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Color.fromRGBO(248, 95, 106, 1),
                        ),
                        labelText: 'Desc',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(248, 95, 106, 1)),
                        hintText: 'Your desc',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(209, 214, 219, 1),
                        ),
                      ),
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
                        onPressed: () {
                          if (key1.currentState.validate()) {
                            bool flag = true;
                            key1.currentState.save();
                            FoodTile food = FoodTile(
                              MyTextFormField.foodName,
                              MyTextFormField.foodPrice,
                              true,
                              desc: MyTextFormField.foodDesc,
                            );

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
                                  .addTabBarTitle(
                                      MyTextFormField.foodCategory, food);

                              print(Accounts.currentAccount);
                              print(Accounts.accounts.length);
                              print(Accounts.accounts[Accounts.currentAccount]
                                  .tabBarTitle);
                              print(Accounts.accounts[Accounts.currentAccount]
                                  .tabBarView);
                            }
                            setState(() {});
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Add'))
                  ]),
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Orders Menu',
            style: TextStyle(fontSize: 16.0),
          ),
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white,
            tabs: List.generate(
              Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
              (index) {
                FoodTile.function = refreshPage;
                return Text(
                  Accounts.accounts[Accounts.currentAccount].tabBarTitle[index],
                );
              },
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: TabBarView(
          children: List.generate(
              Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
              (i) {
            return ListView(
              children: List.generate(
                  Accounts
                      .accounts[Accounts.currentAccount].tabBarView[i].length,
                  (j) => Accounts
                      .accounts[Accounts.currentAccount].tabBarView[i][j]),
            );
          }),
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

//add kardan tag(entekhab chand menu ba ham)

//ShapeDecoration(shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20),side:BorderSide(color: Colors.green,) ))
//FilterChip,RawChip
