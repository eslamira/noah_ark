import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noah_ark/models/ad_model.dart';
import 'package:noah_ark/utils/database_client.dart';

class AdScreen extends StatefulWidget {
  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  GeneralAdModel _generalAdModel;
  String image;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    _generalAdModel = await DatabaseClient.internal().getGeneralAd();
    if (_generalAdModel == null) {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } else {
      if (_generalAdModel.endDateTime.difference(DateTime.now()).isNegative) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      } else if (DateTime.now()
          .difference(_generalAdModel.startDateTime)
          .isNegative) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        Timer(Duration(seconds: _generalAdModel.duration), () async {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (this.image) {
      case null:
        return Scaffold(
          backgroundColor: Colors.black,
        );
      default:
        return Container(
          child: Image.network(this.image),
        );
    }
  }
}
