import 'package:flutter/material.dart';
import 'package:noah_ark/ui/widgets/noah_container.dart';
import 'package:noah_ark/ui/widgets/noah_scaffold.dart';

class RegPassword extends StatefulWidget {
  @override
  _RegPasswordState createState() => _RegPasswordState();
}

class _RegPasswordState extends State<RegPassword> {
  String _error;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return NoahScaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(8, _size.height * 0.1, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NoahContainer(
                  text: "كلمة المرور",
                  backgroundColor: Color(0xFF6D6DFF),
                  maxWidth: _size.width * 0.4,
                  textColor: Colors.white,
                  fontSize: 16,
                ),
                NoahContainer(
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
                NoahContainer(
                  text: "إعادة كلمة المرور",
                  backgroundColor: Color(0xFF6D6DFF),
                  maxWidth: _size.width * 0.4,
                  textColor: Colors.white,
                  fontSize: 16,
                ),
                NoahContainer(
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
            child: NoahContainer(
              text: "المرحلة التالية",
              backgroundColor: Color(0xFFcb3b3b),
              maxWidth: _size.width * 0.9,
              textColor: Colors.white,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NoahContainer(
              text: _error ?? " ",
              backgroundColor: Colors.white24,
              maxWidth: _size.width * 0.9,
              textColor: Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
