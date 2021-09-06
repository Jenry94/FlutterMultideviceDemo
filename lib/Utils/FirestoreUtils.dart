

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multidevice_demo/Models/Item.dart';

Future<bool> generateItems() async {
  var images = [
    "bag_1.png",
    "bag_2.png",
    "bag_3.png",
    "bag_4.png",
    "bag_5.png",
    "bag_6.png",
  ];
  try {
    for (var i = 6; i < 12; i++) {
      FirebaseFirestore.instance.collection("items").doc().set(
        new Item(
          i, 
          "Accesorios", 
          images[i -6],
          "Bolso ${i+2}",
          (i + 1) * 345
        ).toJson()
    );
    }
    return true;
  } catch (e) {
    return false;
  }
}