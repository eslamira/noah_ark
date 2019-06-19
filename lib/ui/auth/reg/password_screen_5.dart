import 'package:flutter/material.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class PasswordScreen extends StatefulWidget {
  final PageController pageController;
  PasswordScreen({this.pageController});
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String _error;

  _validateAndNext() async {
    widget.pageController
        .nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
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
                fontSize: 16,
              ),
              TinyContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(),
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
                textColor: Colors.white,
                fontSize: 16,
              ),
              TinyContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(),
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
          padding: const EdgeInsets.all(8.0),
          child: TinyContainer(
            text: "المرحلة التالية",
            backgroundColor: Color(0xFFcb3b3b),
            maxWidth: _size.width * 0.9,
            textColor: Colors.white,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TinyContainer(
            text: _error ?? " ",
            backgroundColor: Colors.white24,
            maxWidth: _size.width * 0.9,
            textColor: Colors.red,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
