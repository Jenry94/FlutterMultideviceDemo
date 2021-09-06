import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:multidevice_demo/Models/Item.dart';
import 'package:multidevice_demo/Utils/InitConfigs.dart';
import 'package:palette_generator/palette_generator.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  final bool isGrid;

  
  ItemCard({ 
    required this.item,
    required this.isGrid
  });

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    getPalette();
  }

  getPalette() async {
    var colors = await PaletteGenerator.fromImageProvider(Image.asset("assets/images/${widget.item.image}").image);
    setState(() {
      paletteGenerator = colors;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isGrid){
      return itemGrid();
    }
    return itemList();
  }

  Widget itemGrid(){
    return Container(
      padding: globalPading(),
      width: isMobile ? MediaQuery.of(context).size.width * .5 : MediaQuery.of(context).size.width * .15,
      height: isMobile ? MediaQuery.of(context).size.width * .6 : MediaQuery.of(context).size.width * .16,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          image(),
          description(),
          price(),
        ],
      ),
    );
  }

  Widget itemList(){
    return Column(
      children: [
        new Container(
          padding: globalPading(),
          width: isMobile ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width * .40,
          height: isMobile ? MediaQuery.of(context).size.width * .35 : MediaQuery.of(context).size.width * .1,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  image(),
                  new Padding(
                    padding: globalPading(),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        description(),
                        price()
                      ],
                    ),
                  ),
                ],
              ),
              new IconButton(
                icon: new Icon(Icons.add_shopping_cart_outlined),
                onPressed: (){
                  
                },
              )
            ],
          )
        ), 
      ],
    );
  }

  Widget image(){
    if (widget.isGrid) {
      if(paletteGenerator != null){
        return Container(
          decoration: new BoxDecoration(
            color: paletteGenerator!.dominantColor!.color.withOpacity(.75),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          width: MediaQuery.of(context).size.width,
          height: isMobile ?  MediaQuery.of(context).size.width * .4 : MediaQuery.of(context).size.width * .1,
          child: new Container(
            padding: EdgeInsets.all(isMobile ? MediaQuery.of(context).size.width * .075 : MediaQuery.of(context).size.width * .01),
            child: new Image.asset(
              "assets/images/${widget.item.image}",
              fit: BoxFit.fill,
            ),
          ),
        );
      }
      return Container(
        width: MediaQuery.of(context).size.width,
        height: isMobile ?  MediaQuery.of(context).size.width * .4 : MediaQuery.of(context).size.width * .1,
        child: new Center(
          child: new CircularProgressIndicator(),
        ),
      );
    }
    
    if(paletteGenerator != null){
      return Container(
        decoration: new BoxDecoration(
          color: paletteGenerator!.dominantColor!.color.withOpacity(.75),
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        width: isMobile ? MediaQuery.of(context).size.width * .3 : MediaQuery.of(context).size.width * .075,
        height: isMobile ?  MediaQuery.of(context).size.width * .3 : MediaQuery.of(context).size.width * .075,
        child: new Container(
          padding: EdgeInsets.all(isMobile ? MediaQuery.of(context).size.width * .05 : MediaQuery.of(context).size.width * .01),
          child: new Image.asset(
            "assets/images/${widget.item.image}",
            fit: BoxFit.fill,
          ),
        ),
      );
    }
    return Container(
      width: isMobile ? MediaQuery.of(context).size.width * .3 : MediaQuery.of(context).size.width * .075,
      height: isMobile ?  MediaQuery.of(context).size.width * .3 : MediaQuery.of(context).size.width * .075,
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
  
  Widget description(){
    return Text(
      widget.item.description,
      style: new TextStyle(
        fontSize: isMobile ? MediaQuery.of(context).size.width * .035 : MediaQuery.of(context).size.width * .01,
        color: Colors.grey
      ),
    );
  }

  Widget price(){
    return Text(
      widget.item.price.toCurrencyString(leadingSymbol: MoneySymbols.DOLLAR_SIGN),
      style: new TextStyle(
        fontSize: isMobile ? MediaQuery.of(context).size.width * .035 : MediaQuery.of(context).size.width * .01,
        fontWeight: FontWeight.bold
      ),
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
      MediaQuery.of(context).size.height * .01, 
      MediaQuery.of(context).size.width * .025, 
      MediaQuery.of(context).size.height * .01
    );
  }

}
