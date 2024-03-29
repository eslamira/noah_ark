import 'package:flutter/material.dart';

class NoahTheme {
  ThemeData dark = ThemeData(
    primaryColor: Colors.black,
    accentColor: Colors.black54,
    unselectedWidgetColor: Colors.black45,
    scaffoldBackgroundColor: Colors.black,
    indicatorColor: Colors.black,
    dialogBackgroundColor: Colors.grey,
    canvasColor: Colors.grey,
//    dialogTheme: DialogTheme(
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.all(
//          Radius.circular(10.0),
//        ),
//      ),
//    ),
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontFamily: "Ariel",
        fontWeight: FontWeight.bold,
      ),
      subtitle: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: "Ariel",
        fontWeight: FontWeight.bold,
      ),
      subhead: TextStyle(
        color: Colors.black,
        fontSize: 10,
        fontFamily: "Hacen",
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(
        color: Colors.white,
      ),
      display1: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: "Hacen",
        fontWeight: FontWeight.bold,
      ),
      overline: TextStyle(
        // Item Name
        color: Colors.white,
        fontSize: 16,
        fontFamily: "Hacen",
        fontWeight: FontWeight.w300,
      ),
      caption: TextStyle(
        // Item Price
        color: Colors.black,
        fontSize: 12,
        fontFamily: "Hacen",
        fontWeight: FontWeight.bold,
      ),
      display2: TextStyle(
        // Item Price
        color: Colors.white,
        fontSize: 20,
        fontFamily: "Hacen",
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
      color: Color(0xFFFFE200),
      brightness: Brightness.light, // this controls the status bar text color

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
