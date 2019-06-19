import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/widgets/noah_container.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class PasswordScreen extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  PasswordScreen({this.pageController, this.user});
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _pass1Controller = TextEditingController();
  final TextEditingController _pass2Controller = TextEditingController();
  String _error;

  _validateAndNext() async {
    if ((_pass1Controller.text == _pass2Controller.text) &&
        (_pass1Controller.text.length > 7 &&
            _pass2Controller.text.length > 7)) {
      print(widget.user.userRef);
      print(widget.user.userNum);
      print(widget.user.userName.firstName);
      print(widget.user.userName.secondName);
      print(widget.user.userName.thirdName);
      print(widget.user.userName.fourthName);
      print(widget.user.userBirth.day);
      print(widget.user.userBirth.month);
      print(widget.user.userBirth.year);
      print(widget.user.userGender);
      print(widget.user.userCity);
    } else {
      setState(() {
        _error = '';
      });
    }
//    widget.pageController
//        .nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
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
            child: NoahContainer(
              text: "المرحلة التالية",
              backgroundColor: Color(0xFFcb3b3b),
              maxWidth: _size.width * 0.9,
              textColor: Colors.white,
              fontSize: 16,
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
