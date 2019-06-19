import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noah_ark/models/ad_model.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class AdDialog extends StatefulWidget {
  final AdModel adModel;
  AdDialog({@required this.adModel});
  @override
  _AdDialogState createState() => _AdDialogState();
}

class _AdDialogState extends State<AdDialog> {
  Timer _timer;
  int _time = 0;
  bool _rewarded = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() {
    _timer = Timer.periodic(Duration(seconds: 1), (d) {
      if (d.tick >= widget.adModel.duration.inSeconds) {
        _rewarded = true;
        _timer.cancel();
      }
      _time = widget.adModel.duration.inSeconds - d.tick;
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  _rewardAndClose() async {
    await Future.delayed(Duration(seconds: 2), () {
      // TODO: Implement DB Reward and remove from list;
      print("Rwarded Ad ^^");
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _leftTopWidget;

    if (_rewarded) {
      _leftTopWidget = TinyContainer(
        onTap: () => _rewardAndClose(),
        textDecoration: TextDecoration.none,
        maxHeight: 20,
        maxWidth: MediaQuery.of(context).size.width * 0.3,
        textColor: Colors.red,
        backgroundColor: Colors.white24,
        text: "اغلاق الاعلان",
      );
    } else {
      _leftTopWidget = TinyContainer(
        textDecoration: TextDecoration.none,
        maxHeight: 20,
        maxWidth: MediaQuery.of(context).size.width * 0.3,
        textColor: Colors.black,
        backgroundColor: Colors.white24,
        text: "$_time ثواني متبقية",
      );
    }

    return WillPopScope(
      onWillPop: () async {
        if (_rewarded) {
          await _rewardAndClose();
          return true;
        } else {
          return Future.value(_rewarded);
        }
      },
      child: Material(
        child: Stack(
          children: <Widget>[
            TinyContainer(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height,
              backgroundColor: Colors.black,
              child: Image.network(widget.adModel.picLink),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: _leftTopWidget,
            ),
          ],
        ),
      ),
    );
  }
}
