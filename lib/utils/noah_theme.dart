import 'package:flutter/material.dart';

class NoahTheme {
  ThemeData dark = ThemeData(
    primaryColor: Colors.black,
    accentColor: Colors.black54,
    unselectedWidgetColor: Colors.black54,
    scaffoldBackgroundColor: Colors.black,
    indicatorColor: Colors.white,
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.black,
        fontSize: 22,
      ),
      subtitle: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      subhead: TextStyle(
        color: Colors.white,
      ),
      button: TextStyle(
        color: Colors.white,
      ),

      // this will be for Items Card font
      display1: TextStyle(
        // Item Name
        color: Colors.black,
        fontSize: 16,
        fontFamily: "NeusaNextPro",
        fontWeight: FontWeight.w300,
      ),
      overline: TextStyle(
        // Item Name
        color: Colors.white,
        fontSize: 16,
        fontFamily: "NeusaNextPro",
        fontWeight: FontWeight.w300,
      ),
      caption: TextStyle(
        // Item Price
        color: Colors.black,
        fontSize: 12,
        fontFamily: "NeusaNextStd",
        fontWeight: FontWeight.bold,
      ),
      display2: TextStyle(
        // Item Price
        color: Colors.white,
        fontSize: 12,
        fontFamily: "NeusaNextStd",
        fontWeight: FontWeight.bold,
      ),
      display3: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: "Arial",
        fontWeight: FontWeight.bold,
      ),
      display4: TextStyle(
        // Item old Price
        color: Colors.black,
        fontSize: 10,
        fontFamily: "NeusaNextStd",
        fontWeight: FontWeight.bold,
      ),
      body1: TextStyle(
        // See more texts
        color: Colors.white,
        fontSize: 10,
        fontFamily: "NeusaNextStd",
        fontWeight: FontWeight.w300,
      ),
      body2: TextStyle(
        // See more texts
        color: Colors.white,
        fontSize: 16,
        fontFamily: "Arial",
        fontWeight: FontWeight.w300,
      ),
      headline: TextStyle(
        // Brand Name Horizontal
        color: Colors.white,
        fontSize: 16,
        fontFamily: "Montserrat", // Font Family
        fontWeight: FontWeight.w300,
      ),
    ),

    // --- Theming App Bars --- //
    appBarTheme: AppBarTheme(
      color: Colors.black, // background color for app bar
      brightness: Brightness.dark, // this controls the status bar text color

      // --- Theming Texts in Appbar ex: Title --- //
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.white, // Text Color
          fontSize: 20, // Font Size
          fontWeight: FontWeight.bold, // Font Weight
          fontFamily: "Montserrat", // Font Family
        ),
      ),

      // -- Theming App Bar Icons -- //
      iconTheme: IconThemeData(
        color: Colors.white, // Icon Color
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    // --- Theming Other Stuff --- //
    inputDecorationTheme: InputDecorationTheme(
      // hidden counter yay!!
      counterStyle: TextStyle(
        fontSize: 0,
        height: 0,
      ),
      border: InputBorder.none,
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: 18,
      ),
    ),

    // -- TabBar -- //
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.white,
    ),

    primaryTextTheme: TextTheme(
      title: TextStyle(
        fontFamily: 'Ariel',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      display1: TextStyle(
        fontFamily: 'Ariel',
        color: Colors.white,
        fontSize: 16,
      ),
      display2: TextStyle(
        fontFamily: 'NeusaNextStd',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      display3: TextStyle(
        fontFamily: 'NeusaNextStd',
        color: Colors.white,
        decoration: TextDecoration.lineThrough,
        fontSize: 16,
      ),
    ),
    // -- Divider -- //
    dividerColor: Colors.white,

    //-- Buttons --//
    buttonColor: Colors.white,

    //-- Splash Color ex: in InkWell --//
    splashColor: Colors.white,
  );
//  ThemeData lightestAppBar = ThemeData(); // still needs implementations

}
