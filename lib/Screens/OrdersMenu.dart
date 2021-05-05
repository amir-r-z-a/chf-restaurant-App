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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Accounts.accounts[Accounts.currentAccount].getTabBarTitleLength(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(248, 95, 106, 1),
          onPressed: () {
            print(Accounts.accounts[Accounts.currentAccount]
                .getTabBarTitleLength());

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
              (index) => Text(Accounts
                  .accounts[Accounts.currentAccount].tabBarTitle[index]),
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
//agar jaii(masalan dar class order niaz be class Food bood va na FoodTile mishe ye class Food tarif kard va foodTile oon ro extend kone)
//entekhab kardan status dar Add Food
//ezafe kardan delete (delete all type)
// dorost kardan radio ha
//navigate kardan hame safhe ha(az signIn ta details)
//dorost kardan zaher TabBar va AppBar
//dorost kardan class color ha va ezafe kardan entekhab theme baraye barname
//vaqti title jadid add mishavad position avavz shavad va rooye an beravad
//ezafe kardan emza be barname(Arman Amirreza)
//add kardan image baraye hame ja
//taqir dadane category yek Food
//edite esme category
//ezafe kardan qabeliat @gmail be MyTextFormField
//edit haye DetailsFoodTile mesl profile dakhele drawer beshe
//dorost kardan rang desc(toosi mesl aks proje) dar DetailsFoodTile
//gozashtan initial baraye price dar DetailsFoodTile

//add kardan tag(entekhab chand menu ba ham)

//ShapeDecoration(shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20),side:BorderSide(color: Colors.green,) ))
//FilterChip,RawChip
