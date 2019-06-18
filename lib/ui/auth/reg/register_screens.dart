import 'package:flutter/material.dart';
import 'package:noah_ark/ui/auth/reg/name_screen_3.dart';
import 'package:noah_ark/ui/auth/reg/num_screen_2.dart';
import 'package:noah_ark/ui/auth/reg/password_screen_5.dart';
import 'package:noah_ark/ui/auth/reg/refer_screen_1.dart';

class RegisterScreens extends StatefulWidget {
  @override
  _RegisterScreensState createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  PageController _controller;
  int _currentImage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: _currentImage,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        NameScreen(),
        ReferScreen(),
        NumberScreen(),
        ReferScreen(),
        PasswordScreen(),
      ],
    );
  }
}
