import 'dart:io';

import 'package:flutter/material.dart';

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
                onPressed: () => exit(0)),
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
