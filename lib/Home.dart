import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multidevice_demo/CustomWidgets/ItemCard.dart';
import 'package:multidevice_demo/Models/Item.dart';

import 'Utils/Constants.dart';
import 'Utils/InitConfigs.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [];
  String? filterPrice = "mayor";
  bool isGrid = true;

  @override
  void initState() {
    super.initState();
    getItemsFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: isMobile ? bodyMobile() : bodyHorizontal(), 
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: generateItems,
      // ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  AppBar appBar(){
    return AppBar(
      title: Text(HOME_TITLE),
      actions: [
        searchButton(),
        shoppingBasketButton()
      ],
    );
  }

  Widget searchButton(){
    return IconButton(
      icon: new Icon(Icons.search),
      onPressed: (){

      }
    );
  }

  Widget shoppingBasketButton(){
    return IconButton(
        icon: new Stack(
          children: [
            new Icon(Icons.shopping_basket_outlined),
            new Positioned(  // draw a red marble
              top: 0.0,
              right: 0.0,
              child: new Icon(
                Icons.brightness_1,
                size: isMobile ? MediaQuery.of(context).size.width * .015 : MediaQuery.of(context).size.width * .004, 
                color: Colors.redAccent
              ),
            )
          ],
        ),
        onPressed: (){

      }
    );
  }

  Widget bodyMobile(){
    return SafeArea(
      child: new Column(
        children: [
          filters(),
          new Expanded(
            child: listItems(),
          )
        ],
      ),
    );
  }

  Widget bodyHorizontal(){
    return SafeArea(
      child: new Column(
        children: [
          filters(),
          new Expanded(
            child: new Row(
              children: [
                otherFilters(),
                new Flexible(
                  child: listItems(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listItems(){
    return SingleChildScrollView(
      child: new Wrap(
        children: items.map((Item item) => new ItemCard(item: item, isGrid: isGrid)).toList(),
      ),
    );
  }

  Widget filters(){
    return Padding(
      padding: globalPading().copyWith(top:0, bottom: 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            dropDownPrice(),
            new Container(
              margin: globalPading(),
              width: 1,
              height: MediaQuery.of(context).size.height * .02,
              color: Colors.black,
            ),
            typeViews(),
          ],
        )   
      ),
    );
  }

  Widget otherFilters(){
    return Padding(
      padding: globalPading(),
      child: Container(
        width: MediaQuery.of(context).size.width * .1,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("Categorias"),

            new Text("Colores"),
          ],
        ),
      ),
    );
  }

  Widget dropDownPrice(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Padding(
          padding: EdgeInsets.only(right: isMobile ? MediaQuery.of(context).size.width * .02 : MediaQuery.of(context).size.width * .005),
          child: new Text(
            "Ordenar por",
            style: new TextStyle(
              fontSize: isMobile ? MediaQuery.of(context).size.width * .03 : MediaQuery.of(context).size.width * .01,
            )
          ),
        ),
        new DropdownButton(
          value: filterPrice,
          onChanged: (String? value){
            setState(() {
              filterPrice = value;
            });
          },
          items: [
            new DropdownMenuItem(
              value: "menor",
              child: new Text(
                "Menor precio",
                style: new TextStyle(
                  fontSize: isMobile ? MediaQuery.of(context).size.width * .03 : MediaQuery.of(context).size.width * .01,
                )
              ),
            ),
            new DropdownMenuItem(
              value: "mayor",
              child: new Text(
                "Mayor precio",
                style: new TextStyle(
                  fontSize: isMobile ? MediaQuery.of(context).size.width * .03 : MediaQuery.of(context).size.width * .01,
                )
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget typeViews(){
    return Row(
      children: [
        new GestureDetector(
          child: new Icon(
            isGrid ? Icons.window_outlined : Icons.table_rows_outlined,
          ),
          onTap: (){
            setState(() {
              isGrid = !isGrid;
            });
          },
        ),
      ],
    );
  }

  EdgeInsets globalPading(){
    if(isMobile){
      return EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * .05, 
        MediaQuery.of(context).size.height * .015, 
        MediaQuery.of(context).size.width * .05, 
        MediaQuery.of(context).size.height * .015
      );
    }
    return EdgeInsets.fromLTRB(
      MediaQuery.of(context).size.width * .025, 
      MediaQuery.of(context).size.height * .005, 
      MediaQuery.of(context).size.width * .025, 
      MediaQuery.of(context).size.height * .005
    );
  }

  getItemsFirebase(){
    try {
      FirebaseFirestore.instance.collection("items").orderBy("id").snapshots().listen((snapshots) {
        List<Item> tempList = [];
        if(snapshots.docs.isNotEmpty){
          snapshots.docs.forEach((element) {
            tempList.add(new Item.fromJson(element.data()));
          });
          setState(() {
            items = tempList;
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
