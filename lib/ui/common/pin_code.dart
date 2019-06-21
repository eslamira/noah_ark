import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noah_ark/ui/ad_screen.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/ui/widgets/noah_scaffold.dart';
import 'package:noah_ark/utils/auth_client.dart';
import 'package:noah_ark/utils/database_client.dart';
import 'package:secure_pin_code/secure_pin_code.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class PinCode extends StatefulWidget {
  final bool onResume;

  PinCode({
    this.onResume = false,
  });

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  String _correctPin = '';
  String _error = " ";
  int errorCounter = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    _correctPin = await DatabaseClient.internal().getUserPin();
    _isLoading = false;
    setState(() {});
  }

  _fuckOff(context) async {
    await AuthClient.internal().signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/auth', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return NoahScaffold(
      isScrollable: false,
      body: _isLoading
          ? LoadingModel()
          : Directionality(
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
                      : Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => AdScreen()));
                },
                onCodeFails: (val) {
                  errorCounter++;
                  if (mounted)
                    setState(() => _error = 'رمز الأمان غير صحيح\n'
                        ' لقد استنفذت $errorCounter محاولة من 3 محاولات\n ');
                  if (errorCounter == 3) _fuckOff(context);
                },
              ),
            ),
    );
  }
}
