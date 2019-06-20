import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noah_ark/ui/widgets/noah_scaffold.dart';

class Success extends StatefulWidget {
  final String msg;
  final MaterialPageRoute nav;
  final bool isReg;
  Success(this.msg, this.nav, this.isReg);
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
    return widget.isReg
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 180,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                ),
                Text(
                  "${widget.msg}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.display2,
                  textScaleFactor: 1.0,
                ),
              ],
            ),
          )
        : NoahScaffold(
            isScrollable: false,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 180,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                  ),
                  Text(
                    "${widget.msg}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display2,
                    textScaleFactor: 1.0,
                  ),
                ],
              ),
            ),
          );
  }
}
