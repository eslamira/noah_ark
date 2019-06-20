import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class PinCodeScreen extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  PinCodeScreen({@required this.pageController, @required this.user});
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final TextEditingController _pin1Controller = TextEditingController();
  final TextEditingController _pin2Controller = TextEditingController();
  String _error;

  @override
  void dispose() {
    _pin1Controller?.dispose();
    _pin2Controller?.dispose();
    super.dispose();
  }

  _validateAndNext() async {
    Common.internal().loading(context);
    if (_pin1Controller.text.length == 4 && _pin2Controller.text.length == 4) {
      if (_pin1Controller.text == _pin2Controller.text) {
        widget.user.userPinCode = _pin1Controller.text;
        Navigator.of(context).pop();
        widget.pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      } else {
        Navigator.of(context).pop();
        setState(() {
          _error = 'تأكد من تطابق التأكيد الامنى';
        });
      }
    } else {
      Navigator.of(context).pop();
      setState(() {
        _error = 'التأكيد الأمنى يجب ان يتكون من 4 ارقام';
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
                text: "التأكيد الأمنى",
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
                    onChanged: (v) {
                      setState(() {});
                    },
                    controller: _pin1Controller,
                    obscureText: true,
                    maxLength: 4,
                    keyboardType: TextInputType.number,
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
                text: "إعادة التأكيد الأمنى",
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
                    onChanged: (v) {
                      setState(() {});
                    },
                    controller: _pin2Controller,
                    obscureText: true,
                    maxLength: 4,
                    keyboardType: TextInputType.number,
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
          onTap: (_pin1Controller.text.length > 1 &&
                  _pin2Controller.text.length > 1)
              ? () => _validateAndNext()
              : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TinyContainer(
              text: "المرحلة التالية",
              backgroundColor: (_pin1Controller.text.length > 1 &&
                      _pin2Controller.text.length > 1)
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
