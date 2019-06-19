import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/widgets/noah_scaffold.dart';
import 'package:noah_ark/utils/auth_client.dart';
import 'package:secure_pin_code/secure_pin_code.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class PinCode extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  final bool onResume;

  PinCode({
    this.pageController,
    this.user,
    this.onResume = false,
  });

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  String _correctPin = '';
  String _error = " ";
  int errorCounter = 0;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _correctPin = widget.user.userPinCode;
    }
  }

  _savePinAndNav(String pin) async {
    if (pin.length != 4) {
      if (mounted) setState(() => _error = 'رمز الأمان يجب ان يكون 4 ارقام');
    } else {
      widget.user.userPinCode = pin;
      widget.pageController
          .nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  fuckOff(context) async {
    await AuthClient.internal().signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/auth', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return NoahScaffold(
      isScrollable: false,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: SecurePinCode(
          upperTitle: TinyContainer(
            text: "التأكيد الامني",
            backgroundColor: Color(0xFF6D6DFF),
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            textColor: Colors.white,
            fontSize: 14,
          ),
          bottomTitle: TinyContainer(
            text: "$_error",
            backgroundColor: Colors.green,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            textColor: Colors.black,
            fontSize: 14,
          ),
          bottomSubTitle: TinyContainer(
            text: "برجاء إدخال الرمز المكون من 4 أرقام",
            backgroundColor: Colors.white24,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            textColor: Colors.white,
            fontSize: 14,
          ),
          keyboardTextStyle: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          pinCodeTextStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          underlineBorderColor: Colors.black,
          obscurePin: true,
          // to make pin * instead of number
          codeLength: 4,
          correctPin: _correctPin,
          onCodeSuccess: (val) {
            widget.onResume
                ? Navigator.of(context).pop()
                : Navigator.of(context).pushReplacementNamed('/ads');
          },
          onCodeFails: (val) {
            if (widget.pageController != null) {
              _savePinAndNav(val);
            } else {
              errorCounter++;
              if (mounted)
                setState(() => _error = 'رمز الأمان غير صحيح\n'
                    ' لقد استنفذت $errorCounter محاولة من 3 محاولات\n ');
              if (errorCounter == 3) fuckOff(context);
            }
          },
        ),
      ),
    );
  }
}
