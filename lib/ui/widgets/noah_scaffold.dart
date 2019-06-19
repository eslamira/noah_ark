import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noah_ark/utils/auth_client.dart';

class NoahScaffold extends StatelessWidget {
  final PreferredSizeWidget appbar;
  final Widget body;
  final Widget bottomNavigationBar;
  final bool isScrollable;
  const NoahScaffold({
    Key key,
    this.appbar,
    this.body,
    this.bottomNavigationBar,
    this.isScrollable = true,
  }) : super(key: key);

  _onExitTapHandler(BuildContext context) async {
    AuthClient _auth = AuthClient.internal();
    if (await _auth.isLoggedIn() != null) {
      await _auth.signOut();
      Navigator.of(context).pushNamedAndRemoveUntil('/auth', (route) => false);
    } else {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _bodyWidget;

    if (isScrollable) {
      _bodyWidget = Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: body,
              ),
            ),
          ),
        ],
      );
    } else {
      _bodyWidget = Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: body,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: appbar ??
          AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.black,
              ),
              onPressed: () => _onExitTapHandler(context),
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'THE ARK',
                textScaleFactor: 1.0,
                style:
                    Theme.of(context).textTheme.subtitle.copyWith(fontSize: 22),
              ),
            ),
          ),
      body: _bodyWidget,
      bottomNavigationBar: bottomNavigationBar ??
          BottomAppBar(
            color: Color(0xFFFFE200),
            child: Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'TF OPTION FOUNDATION',
                      textScaleFactor: 1.0,
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    Text(
                      'ALL RIGHTS RESERVED',
                      textScaleFactor: 1.0,
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
