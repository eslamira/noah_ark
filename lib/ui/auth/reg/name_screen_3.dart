import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class NameScreen extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  NameScreen({this.pageController, @required this.user});
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _sNameController = TextEditingController();
  final TextEditingController _tNameController = TextEditingController();
  final TextEditingController _foNameController = TextEditingController();
  bool _isArabic = false;
  String _error = ' ';

  @override
  void dispose() {
    _fNameController?.dispose();
    _sNameController?.dispose();
    _tNameController?.dispose();
    _foNameController?.dispose();
    super.dispose();
  }

  void _validator(val) {
    if (val.contains(RegExp('^[\u0621-\u064A ]+\$'))) {
      if (val.text.length >= 1) {
        if (mounted)
          setState(() {
            _isArabic = true;
          });
      }
    } else {
      if (mounted)
        setState(() {
          _isArabic = false;
        });
    }
  }

  _validateAndNext() async {
    try {
      if (_isArabic) {
        Common.internal().loading(context);
        widget.user.userName.firstName = _fNameController.text;
        widget.user.userName.secondName = _sNameController.text;
        widget.user.userName.thirdName = _tNameController.text;
        widget.user.userName.fourthName = _foNameController.text;
        Navigator.of(context).pop();
        widget.pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      } else {
        setState(() {
          _error = 'برجاء كتابة الاسم باللغة العربية فقط';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TinyContainer(
                  maxWidth: MediaQuery.of(context).size.width * 0.45,
                  maxHeight: MediaQuery.of(context).size.width * 0.12,
                  text: 'الأسم الكامل',
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                TinyContainer(
                  maxWidth: MediaQuery.of(context).size.width * 0.45,
                  maxHeight: MediaQuery.of(context).size.width * 0.12,
                  backgroundColor: Colors.grey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _fNameController,
                      onChanged: _validator,
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                TinyContainer(
                  maxWidth: MediaQuery.of(context).size.width * 0.45,
                  maxHeight: MediaQuery.of(context).size.width * 0.12,
                  backgroundColor: Colors.grey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _sNameController,
                      onChanged: _validator,
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                TinyContainer(
                  maxWidth: MediaQuery.of(context).size.width * 0.45,
                  maxHeight: MediaQuery.of(context).size.width * 0.12,
                  backgroundColor: Colors.grey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _tNameController,
                      onChanged: _validator,
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                TinyContainer(
                  maxWidth: MediaQuery.of(context).size.width * 0.45,
                  maxHeight: MediaQuery.of(context).size.width * 0.12,
                  backgroundColor: Colors.grey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _foNameController,
                      onChanged: _validator,
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 24.0)),
        TinyContainer(
          onTap: (_fNameController.text.length > 1 &&
                  _sNameController.text.length > 1 &&
                  _tNameController.text.length > 1 &&
                  _foNameController.text.length > 1)
              ? () => _validateAndNext()
              : null,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.12,
          backgroundColor: (_fNameController.text.length > 1 &&
                  _sNameController.text.length > 1 &&
                  _tNameController.text.length > 1 &&
                  _foNameController.text.length > 1)
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
