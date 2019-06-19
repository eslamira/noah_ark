import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noah_ark/ui/widgets/noah_scaffold.dart';
import 'package:secure_pin_code/secure_pin_code.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class RegPinCode extends StatelessWidget {
  final String error = " ";
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
            text: "$error",
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
          correctPin: "****",
          onCodeSuccess: (val) {},
          onCodeFails: (val) {},
        ),
      ),
    );
  }
}
