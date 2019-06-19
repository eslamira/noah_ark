import 'dart:async';

import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  final String msg;
  final MaterialPageRoute nav;
  Success(this.msg, this.nav);
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      widget.nav != null
          ? Navigator.of(context).pushReplacement(widget.nav)
          : Navigator.of(context)
              .pushNamedAndRemoveUntil('/auth', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 43,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
            ),
          ),
          Text(
            "${widget.msg}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Hacen',
            ),
          ),
        ],
      ),
    );
  }
}
