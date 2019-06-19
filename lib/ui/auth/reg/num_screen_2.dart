import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/widgets/noah_container.dart';
import 'package:noah_ark/utils/database_client.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class NumberScreen extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  NumberScreen({this.pageController, this.user});
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final TextEditingController _numController = TextEditingController();
  String _error = ' ';

  _validateAndNext() async {
    try {
      if (_numController.text.substring(0, 2) == '015') {
        if (!await DatabaseClient.internal()
            .isReferExist(_numController.text)) {
          widget.user.userNum = _numController.text;
          widget.pageController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        } else {
          setState(() {
            _error = 'رقم الجوال غير صالح';
          });
        }
      } else {
        setState(() {
          _error = 'رقم الجوال غير صالح';
        });
      }
    } catch (e) {
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
