import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/widgets/noah_container.dart';
import 'package:noah_ark/utils/database_client.dart';

class ReferScreen extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  ReferScreen({this.pageController, this.user});
  @override
  _ReferScreenState createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  final TextEditingController _numController = TextEditingController();
  String _error = ' ';

  _validateAndNext() async {
    try {
      if (await DatabaseClient.internal().isReferExist(_numController.text)) {
        widget.user.userRef = _numController.text;
        widget.pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      } else {
        setState(() {
          _error = 'كود الأحالة غير صحيح';
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
            NoahContainer(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
              maxHeight: MediaQuery.of(context).size.width * 0.12,
              text: 'كود الأحالة',
              fontWeight: FontWeight.bold,
            ),
            NoahContainer(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
              maxHeight: MediaQuery.of(context).size.width * 0.12,
              backgroundColor: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (v) {
                    setState(() {});
                  },
                  maxLength: 11,
                  controller: _numController,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 24.0)),
        NoahContainer(
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
        NoahContainer(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.12,
          backgroundColor: Colors.grey[900],
          text: _error,
        ),
      ],
    );
  }
}
