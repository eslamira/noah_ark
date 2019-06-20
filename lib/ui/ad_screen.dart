import 'dart:async';

import 'package:flutter/material.dart';

class AdScreen extends StatefulWidget {
  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () async {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
