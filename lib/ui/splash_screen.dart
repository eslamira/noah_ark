import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noah_ark/ui/auth/main_auth.dart';
import 'package:noah_ark/ui/common/pin_code.dart';
import 'package:noah_ark/utils/auth_client.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthClient _auth = AuthClient.internal();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    var loggedIn = await _auth.isLoggedIn();
    Timer(Duration(seconds: 5), () {
      loggedIn == null
          ? Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainScreenAuth()))
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => PinCode()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9EE),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FadeInImage(
            fadeInDuration: Duration(milliseconds: 200),
            image: AssetImage(
              'assets/images/splash.png',
            ),
            fit: BoxFit.cover,
            placeholder: AssetImage(
              'assets/images/splash.png',
            ),
          ),
        ),
      ),
    );
  }
}
