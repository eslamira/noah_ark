import 'package:flutter/material.dart';
import 'package:noah_ark/ui/auth/main_auth.dart';
import 'package:noah_ark/ui/main_screen.dart';
import 'package:noah_ark/ui/splash_screen.dart';
import 'package:noah_ark/utils/noah_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noah\'s Ark',
      builder: (BuildContext context, Widget child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      theme: NoahTheme().dark,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MainScreen(),
        '/auth': (BuildContext context) => MainScreenAuth(),
      },
    );
  }
}
