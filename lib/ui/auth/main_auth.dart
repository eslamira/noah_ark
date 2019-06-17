import 'package:flutter/material.dart';

class MainScreenAuth extends StatefulWidget {
  @override
  _MainScreenAuthState createState() => _MainScreenAuthState();
}

class _MainScreenAuthState extends State<MainScreenAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFE200),
        title: Text('THE ARK', textScaleFactor: 1.0),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFFFE200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('TF OPTION FOUNDATION', textScaleFactor: 1.0),
            Text('ALL RIGHTS RESERVED', textScaleFactor: 1.0),
          ],
        ),
      ),
    );
  }
}
