import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noah_ark/models/ad_model.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/utils/database_client.dart';

class AdScreen extends StatefulWidget {
  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  GeneralAdModel _generalAdModel;
  bool _isLoading = true;

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
        _isLoading = false;
        setState(() {});
        Timer(Duration(seconds: _generalAdModel.duration), () async {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return LoadingModel();
    } else {
      switch (_generalAdModel.link) {
        case null:
          return Scaffold(
            backgroundColor: Colors.black,
          );
        default:
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(_generalAdModel.link),
                    fit: BoxFit.cover)),
          );
      }
    }
  }
}
