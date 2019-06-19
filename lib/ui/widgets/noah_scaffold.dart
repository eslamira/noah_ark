import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noah_ark/utils/auth_client.dart';

class NoahScaffold extends StatelessWidget {
  final PreferredSizeWidget appbar;
  final Widget body;
  final Widget bottomNavigationBar;
  const NoahScaffold({
    Key key,
    this.appbar,
    this.body,
    this.bottomNavigationBar,
  }) : super(key: key);

  _onExitTapHandler() async {
    AuthClient _auth = AuthClient.internal();
    if (await _auth.isLoggedIn() != null) {
      await _auth.signOut();
      // TODO:(eslamira) pop all and nav to welcome
    } else {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar ??
          AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.black,
              ),
              onPressed: () => _onExitTapHandler(),
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: body,
              ),
            ),
          ),
        ],
      ),
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
