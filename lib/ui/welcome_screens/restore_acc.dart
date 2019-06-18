import 'package:flutter/material.dart';
import 'package:noah_ark/utils/database_client.dart';

class RestoreAccountScreen extends StatefulWidget {
  @override
  _RestoreAccountScreenState createState() => _RestoreAccountScreenState();
}

class _RestoreAccountScreenState extends State<RestoreAccountScreen> {
  bool isLoading = true;
  Map _dbData = Map();

  @override
  void initState() {
    super.initState();
    DatabaseClient.internal().getRestoreData().then((data) {
      if (mounted)
        setState(() {
          _dbData = data;
          isLoading = false;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pink,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFE200)),
                strokeWidth: 4.0,
              ),
            )
          : Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 10)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        " يرجي التواصل مع خدمة العملاء من خلال الرقم التالي",
                        style: TextStyle(
                            color: Color(0xFFFFE200),
                            fontSize: 12,
                            fontFamily: 'Hacen'),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 10)),
                  Text(
                    "${_dbData["phoneNumber"]}",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, fontFamily: 'Hacen'),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 10)),
                  Text(
                    "وذلك فى مواعيد العمل التالية",
                    style: TextStyle(
                        color: Color(0xFFFFE200),
                        fontSize: 12,
                        fontFamily: 'Hacen'),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 10)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "من الساعه ",
                          style: TextStyle(
                            color: Color(0xFFFFE200),
                            fontSize: 12,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          "${_dbData["fromTime"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          "حتى",
                          style: TextStyle(
                            color: Color(0xFFFFE200),
                            fontSize: 12,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          "${_dbData["toTime"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 10)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "ابتداءً من",
                          style: TextStyle(
                            color: Color(0xFFFFE200),
                            fontSize: 12,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          "${_dbData["fromDay"]}",
                          style: TextStyle(
                            color: Color(0xFFFF0090),
                            fontSize: 16,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          "وحتى",
                          style: TextStyle(
                            color: Color(0xFFFFE200),
                            fontSize: 12,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          "${_dbData["toDay"]}",
                          style: TextStyle(
                            color: Color(0xFFFF0090),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
