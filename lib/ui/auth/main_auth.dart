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
        leading: IconButton(
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.black,
            ),
            onPressed: null),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'THE ARK',
            textScaleFactor: 1.0,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFFFE200),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('TF OPTION FOUNDATION', textScaleFactor: 1.0),
                Text('ALL RIGHTS RESERVED', textScaleFactor: 1.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
