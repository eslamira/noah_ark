import 'package:flutter/material.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class NameScreen extends StatefulWidget {
  final PageController pageController;
  NameScreen({this.pageController});
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _sNameController = TextEditingController();
  final TextEditingController _tNameController = TextEditingController();
  final TextEditingController _foNameController = TextEditingController();
  String _error = ' ';

  _validateAndNext() async {
    widget.pageController
        .nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
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
                      onChanged: (v) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
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
                      onChanged: (v) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
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
                      onChanged: (v) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
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
                      onChanged: (v) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
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
