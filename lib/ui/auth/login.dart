import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/ui/common/pin_code.dart';
import 'package:noah_ark/utils/auth_client.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String _error = ' ';

  @override
  void dispose() {
    _numController?.dispose();
    _passController?.dispose();
    super.dispose();
  }

  _login() async {
    try {
      Common.internal().loading(context);
      await AuthClient.internal().signInWithEmailAndPassword(
          '${_numController.text}${Common.internal().dummyDomain}',
          _passController.text);
      Navigator.of(context).pop();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => PinCode()),
          (route) => false);
    } on SocketException {
      setState(() {
        _error = 'تأكد من الأتصال بالشبكه وحاول مرة أخرى';
      });
    } catch (e) {
      Navigator.of(context).pop();
      setState(() {
        _error = 'اﻟﺒﻴﺎﻧﺎت اﻟﻤﺪﺧﻠﺔ ﻏﻴﺮ ﺻﺤﻴﺤﺔ';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TinyContainer(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
              maxHeight: MediaQuery.of(context).size.width * 0.12,
              text: 'رقم الحساب',
              fontWeight: FontWeight.bold,
            ),
            TinyContainer(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
              maxHeight: MediaQuery.of(context).size.width * 0.12,
              backgroundColor: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _numController,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 16.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TinyContainer(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
              maxHeight: MediaQuery.of(context).size.width * 0.12,
              text: 'كلمة المرور',
              fontWeight: FontWeight.bold,
            ),
            TinyContainer(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
              maxHeight: MediaQuery.of(context).size.width * 0.12,
              backgroundColor: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  controller: _passController,
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 24.0)),
        TinyContainer(
          onTap: (_numController.text.length > 1 &&
                  _passController.text.length > 1)
              ? () => _login()
              : null,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.12,
          backgroundColor: (_numController.text.length > 1 &&
                  _passController.text.length > 1)
              ? Color(0xFFcb3b3b)
              : Colors.grey[800],
          text: 'دخول',
          fontWeight: FontWeight.bold,
        ),
        Padding(padding: EdgeInsets.only(bottom: 24.0)),
        TinyContainer(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.12,
          backgroundColor: Colors.grey[800],
          text: _error,
        ),
      ],
    );
  }
}
