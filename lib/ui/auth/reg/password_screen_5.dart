import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class PasswordScreen extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  PasswordScreen({this.pageController, @required this.user});
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _pass1Controller = TextEditingController();
  final TextEditingController _pass2Controller = TextEditingController();
  String _error;

  @override
  void dispose() {
    _pass1Controller?.dispose();
    _pass2Controller?.dispose();
    super.dispose();
  }

  _validateAndNext() async {
    Common.internal().loading(context);
    if (_pass1Controller.text.length > 7 && _pass2Controller.text.length > 7) {
      if (_pass1Controller.text == _pass2Controller.text) {
        widget.user.userPass = _pass1Controller.text;
        Navigator.of(context).pop();
        widget.pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      } else {
        Navigator.of(context).pop();
        setState(() {
          _error = 'تأكد من تطابق كلمة المرور';
        });
      }
    } else {
      Navigator.of(context).pop();
      setState(() {
        _error = 'كلمة المرور يجب ان لا تقل عن 8 حروف لاتينية وأرقام';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(8, _size.height * 0.1, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TinyContainer(
                text: "كلمة المرور",
                backgroundColor: Color(0xFF6D6DFF),
                maxWidth: _size.width * 0.4,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              TinyContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _pass1Controller,
                    obscureText: true,
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
                backgroundColor: Colors.white24,
                maxWidth: _size.width * 0.4,
                textColor: Colors.white,
                fontSize: 16,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TinyContainer(
                text: "إعادة كلمة المرور",
                backgroundColor: Color(0xFF6D6DFF),
                maxWidth: _size.width * 0.4,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                fontSize: 16,
              ),
              TinyContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _pass2Controller,
                    obscureText: true,
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
                backgroundColor: Colors.white24,
                maxWidth: _size.width * 0.4,
                textColor: Colors.white,
                fontSize: 16,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: (_pass1Controller.text.length > 1 &&
                  _pass2Controller.text.length > 1)
              ? () => _validateAndNext()
              : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TinyContainer(
              text: "المرحلة التالية",
              backgroundColor: (_pass1Controller.text.length > 1 &&
                      _pass2Controller.text.length > 1)
                  ? Color(0xFFcb3b3b)
                  : Colors.grey[800],
              maxWidth: _size.width * 0.9,
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TinyContainer(
            text: _error ?? " ",
            maxWidth: _size.width * 0.9,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.grey[900],
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
