import 'package:flutter/material.dart';
import 'Utils/Constants.dart';
import 'Utils/InitConfigs.dart';
import 'Utils/Tools.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initConfigs(context);
    return Scaffold(
      body: checkScreen(context) ? bodyMobile() : bodyHorizontal(), 
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
                size: checkScreen(context) ? MediaQuery.of(context).size.width * .015 : MediaQuery.of(context).size.width * .004, 
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

        ],
      ),
    );
  }

  Widget bodyHorizontal(){
    return SafeArea(
      child: new Column(
        children: [

        ],
      ),
    );
  }

}
