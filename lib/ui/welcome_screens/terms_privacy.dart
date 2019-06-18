import 'package:flutter/material.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/utils/database_client.dart';

class TermsAndPrivacy extends StatefulWidget {
  @override
  _TermsAndPrivacyState createState() => _TermsAndPrivacyState();
}

class _TermsAndPrivacyState extends State<TermsAndPrivacy> {
  final _controller = TabController(length: 2, vsync: AnimatedListState());
  final _db = DatabaseClient.internal();
  Map lic;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    lic = await _db.getUserLic();
    if (mounted) setState(() {});
  }

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
                  "الشروط و الأحكام",
                  textScaleFactor: 1.0,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
              Tab(
                child: Text(
                  "سياسية الخصوصية",
                  textScaleFactor: 1.0,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
        if (lic == null) ...[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: LoadingModel(),
          ),
        ],
        if (lic != null) ...[
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(24.0),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topRight,
                    child: Text(
                      "${lic['terms']}",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(24.0),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topRight,
                    child: Text(
                      "${lic['privacy']}",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
