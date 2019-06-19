import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class ScratchScreen extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  ScratchScreen({this.pageController, @required this.user});
  @override
  _ScratchScreenState createState() => _ScratchScreenState();
}

class _ScratchScreenState extends State<ScratchScreen> {
  final TextEditingController _scratchController = TextEditingController();
  String _error;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(8, _size.height * 0.1, 8, 8),
          child: TinyContainer(
            text: "سكرتش كارد",
            backgroundColor: Color(0xFF6D6DFF),
            maxWidth: _size.width * 0.9,
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, _size.height * 0.1, 8, 8),
          child: TinyContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _scratchController,
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            backgroundColor: Colors.grey[900],
            maxWidth: _size.width * 0.9,
            textColor: Colors.white,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TinyContainer(
            text: "فتح الحساب",
            backgroundColor: Color(0xFFcb3b3b),
            maxWidth: _size.width * 0.9,
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TinyContainer(
            text: _error ?? " ",
            backgroundColor: Colors.grey[900],
            maxWidth: _size.width * 0.9,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
