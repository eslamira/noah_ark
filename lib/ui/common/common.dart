import 'package:flutter/material.dart';

class LoadingModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFE200)),
      ),
    );
  }
}

class Common {
  static Common _instance = Common.internal();

  Common.internal();

  factory Common() => _instance;

  final dummyDomain = '@TheArk.com';

  loading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[LoadingModel()],
            ),
          ),
        );
      },
    );
  }

  networkErrorNotify(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Network Error",
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          content: Text(
            "Please check your Internet Connection and try again",
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Okay",
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// See https://stackoverflow.com/questions/596216/formula-to-determine-brightness-of-rgb-color
  bool isDark(Color color) {
    final luminance =
        (0.2126 * color.red + 0.7152 * color.green + 0.0722 * color.blue);
    return luminance < 150;
  }
}
