import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multidevice_demo/Home.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (CorePalette? corePalette) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(context, corePalette),
          darkTheme: darkTheme(corePalette),
          // home: LoginPage(),
          home: Home(),
        );
      }
    );
  }

  ThemeData theme(BuildContext context, CorePalette? corePalette){
    return ThemeData(
      fontFamily: 'Product Sans',
      scaffoldBackgroundColor: new Color(corePalette?.neutralVariant.get(100) ?? 0xFFFB8C00),

      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: new Color(corePalette?.primary.get(90) ?? 0xFFFB8C00),
        primaryVariant: new Color(corePalette?.secondary.get(90) ?? 0xFFFB8C00),
        secondary: new Color(corePalette?.tertiary.get(90) ?? 0xFFFB8C00),
        secondaryVariant: new Color(corePalette?.neutral.get(90) ?? 0xFFFB8C00),
      ),

      appBarTheme: new AppBarTheme(
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: false
      ),
    );
  }

  ThemeData darkTheme(CorePalette? corePalette){
    return ThemeData(
      fontFamily: 'Product Sans',
      scaffoldBackgroundColor: new Color(corePalette?.neutralVariant.get(100) ?? 0xFFFB8C00).withOpacity(0.1),

      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: new Color(corePalette?.primary.get(90) ?? 0xFFFB8C00),
        primaryVariant: new Color(corePalette?.secondary.get(90) ?? 0xFFFB8C00),
        secondary: new Color(corePalette?.tertiary.get(90) ?? 0xFFFB8C00),
        secondaryVariant: new Color(corePalette?.neutral.get(90) ?? 0xFFFB8C00),
      ),

      appBarTheme: new AppBarTheme(
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: false
        ),
    );
  }
}