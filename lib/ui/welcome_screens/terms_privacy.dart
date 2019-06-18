import 'package:flutter/material.dart';

class TermsAndPrivacy extends StatelessWidget {
  final TabController _controller =
      TabController(length: 2, vsync: AnimatedListState());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Color(0xFF56a554),
          child: TabBar(
            controller: _controller,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Posts",
                  textScaleFactor: 1.0,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
              Tab(
                child: Text(
                  "Posts",
                  textScaleFactor: 1.0,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
              TabBarView(
                children: <Widget>[
                  Container(),
                  Container(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
