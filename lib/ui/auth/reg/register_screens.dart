import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/auth/reg/name_screen_3.dart';
import 'package:noah_ark/ui/auth/reg/num_screen_2.dart';
import 'package:noah_ark/ui/auth/reg/password_screen_5.dart';
import 'package:noah_ark/ui/auth/reg/personal_info_4.dart';
import 'package:noah_ark/ui/auth/reg/pin_code_screen_6.dart';
import 'package:noah_ark/ui/auth/reg/refer_screen_1.dart';
import 'package:noah_ark/ui/auth/reg/scratch_card_7.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/ui/common/success.dart';
import 'package:noah_ark/utils/database_client.dart';

class RegisterScreens extends StatefulWidget {
  @override
  _RegisterScreensState createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  UserModel _user = UserModel();
  PageController _controller;
  int _currentImage = 0;
  bool _isOpen;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    _isOpen = await DatabaseClient.internal().isRegOpen();
    _controller = PageController(
      initialPage: _currentImage,
      keepPage: false,
    );
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingModel()
        : _isOpen
            ? PageView(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  ReferScreen(pageController: _controller, user: _user),
                  NumberScreen(pageController: _controller, user: _user),
                  NameScreen(pageController: _controller, user: _user),
                  PersonalInfo(pageController: _controller, user: _user),
                  PasswordScreen(pageController: _controller, user: _user),
                  PinCodeScreen(pageController: _controller, user: _user),
                  ScratchScreen(pageController: _controller, user: _user),
                  Success('تم فتح الحساب بنجاح', null, true),
                ],
              )
            : Center(
                child: Text(
                  'لا يمكنك فتح حساب جديد فى الوقت الحالى',
                  style: Theme.of(context)
                      .textTheme
                      .display2
                      .copyWith(color: Color(0xFFFFE200)),
                  textScaleFactor: 1.0,
                ),
              );
  }
}
