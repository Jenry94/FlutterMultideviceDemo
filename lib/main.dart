import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multidevice_demo/Home.dart';
import 'package:multidevice_demo/Utils/InitConfigs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initConfigs();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      darkTheme: darkTheme(),
      home: Home(),
    );
  }

  ThemeData theme(){
    return ThemeData(
      fontFamily: 'Product Sans',
      primaryColor: Colors.white,
      accentColor: Colors.lightGreen.shade100,
    );
  }

  ThemeData darkTheme(){
    return ThemeData(
      fontFamily: 'Product Sans',
      primaryColor: Colors.black,
      accentColor: Colors.lightGreen.shade100
    );
  }
}