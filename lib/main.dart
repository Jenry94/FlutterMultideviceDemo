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
      scaffoldBackgroundColor: corePalette != null ? new Color(corePalette.neutralVariant.get(100)) : Colors.white,

      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: corePalette != null ? new Color(corePalette.primary.get(90)) : new Color(0xFFede7f6),
        primaryVariant: corePalette != null ? new Color(corePalette.secondary.get(90)) : new Color(0xFFede7f6),
        secondary: corePalette != null ? new Color(corePalette.tertiary.get(90)) : new Color(0XFFe8f5e9),
        secondaryVariant: corePalette != null ? new Color(corePalette.neutral.get(90)) : new Color(0XFFfffde7),
      ),

      hoverColor: corePalette != null ? new Color(corePalette.primary.get(90)) : new Color(0XFFe8f5e9).withOpacity(0.25),
      highlightColor: corePalette != null ? new Color(corePalette.primary.get(90)) : new Color(0XFFe8f5e9),
      splashColor: corePalette != null ? new Color(corePalette.primary.get(90)) : new Color(0XFFe8f5e9),

      appBarTheme: new AppBarTheme(
        backgroundColor: corePalette != null ? new Color(corePalette.primary.get(90)) : new Color(0xFFede7f6),
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: false
      ),
    );
  }

  ThemeData darkTheme(CorePalette? corePalette){
    return ThemeData(
      fontFamily: 'Product Sans',
      scaffoldBackgroundColor: corePalette != null ? new Color(corePalette.neutralVariant.get(100)) : Colors.white,

      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: corePalette != null ? new Color(corePalette.primary.get(90)) : new Color(0xFFede7f6),
        primaryVariant: corePalette != null ? new Color(corePalette.secondary.get(90)) : new Color(0xFFede7f6),
        secondary: corePalette != null ? new Color(corePalette.tertiary.get(90)) : new Color(0XFFe8f5e9),
        secondaryVariant: corePalette != null ? new Color(corePalette.neutral.get(90)) : new Color(0XFFfffde7),
      ),

      hoverColor: corePalette != null ? new Color(corePalette.primary.get(90)) : new Color(0XFFe8f5e9).withOpacity(0.25),
      highlightColor: corePalette != null ? new Color(corePalette.primary.get(90)) : new Color(0XFFe8f5e9),
      splashColor: corePalette != null ? new Color(corePalette.primary.get(90)) : new Color(0XFFe8f5e9),

      appBarTheme: new AppBarTheme(
        backgroundColor: corePalette != null ? new Color(corePalette.primary.get(90)) : new Color(0xFFede7f6),
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: false
      ),
    );
  }
}