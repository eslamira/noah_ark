import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/utils/database_client.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class NumberScreen extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  NumberScreen({this.pageController, @required this.user});
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final TextEditingController _numController = TextEditingController();
  String _error = ' ';

  @override
  void dispose() {
    _numController?.dispose();
    super.dispose();
  }

  _validateAndNext() async {
    try {
      Common.internal().loading(context);
      if (_numController.text.length == 11) {
        if (_numController.text.substring(0, 3) == '015') {
          print(_numController.text.substring(0, 3));
          Navigator.of(context).pop();
          setState(() {
            _error = 'رقم الجوال غير صالح';
          });
        } else {
          if (!await DatabaseClient.internal()
              .isReferExist(_numController.text)) {
            widget.user.userNum = _numController.text;
            Navigator.of(context).pop();
            widget.pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          } else {
            Navigator.of(context).pop();
            setState(() {
              _error = 'رقم الجوال غير صالح';
            });
          }
        }
      } else {
        Navigator.of(context).pop();
        setState(() {
          _error = 'رقم الجوال غير صالح';
        });
      }
    } catch (e) {
      Navigator.of(context).pop();
      setState(() {
        _error = 'حدث خطأ برجاء المحاولة مرة أخرى';
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
              text: 'رقم الجوال',
              fontWeight: FontWeight.bold,
            ),
            TinyContainer(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
              maxHeight: MediaQuery.of(context).size.width * 0.12,
              backgroundColor: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (v) {
                    setState(() {});
                  },
                  controller: _numController,
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 24.0)),
        TinyContainer(
          onTap: (_numController.text.length > 1)
              ? () => _validateAndNext()
              : null,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.12,
          backgroundColor: (_numController.text.length > 1)
              ? Color(0xFFcb3b3b)
              : Colors.grey[800],
          text: 'دخول',
          fontWeight: FontWeight.bold,
        ),
        Padding(padding: EdgeInsets.only(bottom: 24.0)),
        TinyContainer(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.12,
          backgroundColor: Colors.grey[900],
          text: _error,
        ),
      ],
    );
  }
}
