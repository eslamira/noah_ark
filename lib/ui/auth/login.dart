import 'package:flutter/material.dart';
import 'package:noah_ark/ui/widgets/noah_container.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String _error = '';

  _login() async {}

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
                child: TextField(),
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
                child: TextField(),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 24.0)),
        NoahContainer(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.12,
          backgroundColor: Color(0xFFcb3b3b),
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
