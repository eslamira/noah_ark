import 'package:flutter/material.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/ui/widgets/noah_container.dart';
import 'package:noah_ark/utils/auth_client.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String _error = ' ';

  _login() async {
    try {
      Common.internal().loading(context);
      await AuthClient.internal().signInWithEmailAndPassword(
          '${_numController.text}${Common.internal().dummyDomain}',
          _passController.text);
      Navigator.of(context).pop();
    } catch (e) {
      Navigator.of(context).pop();
      setState(() {
        _error = e.toString();
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
            NoahContainer(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
              maxHeight: MediaQuery.of(context).size.width * 0.12,
              text: 'رقم الحساب',
              fontWeight: FontWeight.bold,
            ),
            NoahContainer(
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
            NoahContainer(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
              maxHeight: MediaQuery.of(context).size.width * 0.12,
              text: 'كلمة المرور',
              fontWeight: FontWeight.bold,
            ),
            NoahContainer(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
              maxHeight: MediaQuery.of(context).size.width * 0.12,
              backgroundColor: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passController,
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 24.0)),
        NoahContainer(
          onTap: (_numController.text.length > 1 &&
                  _passController.text.length > 1)
              ? null
              : () => _login(),
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.12,
          backgroundColor: (_numController.text.length > 1 &&
                  _passController.text.length > 1)
              ? Colors.grey[800]
              : Color(0xFFcb3b3b),
          text: 'دخول',
          fontWeight: FontWeight.bold,
        ),
        Padding(padding: EdgeInsets.only(bottom: 24.0)),
        NoahContainer(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.12,
          backgroundColor: Colors.grey[800],
          text: _error,
        ),
      ],
    );
  }
}
