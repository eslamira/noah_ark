import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noah_ark/utils/database_client.dart';

class MainScreenAuth extends StatefulWidget {
  @override
  _MainScreenAuthState createState() => _MainScreenAuthState();
}

class _MainScreenAuthState extends State<MainScreenAuth> {
  final DatabaseClient _dbClient = DatabaseClient.internal();
  final TabController _tabController =
      TabController(length: 4, vsync: AnimatedListState());
  ScrollController _scrollViewController;
  int index = 1;
  Duration _sliderDuration = Duration(seconds: 3);
  bool _autoPlaySlider = true;

  List _adsList = List();

  @override
  void initState() {
    super.initState();
    _tabController.index = 0;
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    initAds();
  }

  initAds() async {
    List t = await _dbClient.getGalleryADs();
    if (mounted)
      setState(() {
        t.forEach((f) => _adsList.add(NetworkImage(f)));
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFE200),
        leading: IconButton(
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () => exit(0)),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'THE ARK',
            textScaleFactor: 1.0,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              forceElevated: boxIsScrolled,
              backgroundColor: Color(0xFFFFE200),
              expandedHeight: MediaQuery.of(context).size.height * 0.33,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  margin: EdgeInsets.only(top: 3),
                  height: size.height * 0.3,
                  width: size.width,
                  child: _adsList.isEmpty
                      ? Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/ads/1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Carousel(
                          images: _adsList,
                          autoplay: _autoPlaySlider,
                          dotSize: 0,
                          autoplayDuration: _sliderDuration,
                          boxFit: BoxFit.fill,
                          showIndicator: false,
                        ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(0, 40),
                // 8 padding + 24 height = 32 + 8 bonus
                child: Container(
                  color: Color(0xFFFFE200),
                  child: TabBar(
                    controller: _tabController,
                    unselectedLabelColor:
                        Theme.of(context).unselectedWidgetColor,
                    tabs: [
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                            ),
                            Icon(
                              FontAwesomeIcons.lock,
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "تسجيل الدخول",
                                      style:
                                          Theme.of(context).textTheme.subhead,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                            ),
                            Icon(FontAwesomeIcons.userPlus),
                            Padding(
                                padding: EdgeInsets.only(top: 5, right: 16),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "فتح حساب",
                                      style:
                                          Theme.of(context).textTheme.subhead,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                            ),
                            Icon(FontAwesomeIcons.key),
                            Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "إستعادة الحساب",
                                      style:
                                          Theme.of(context).textTheme.subhead,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                            ),
                            Icon(FontAwesomeIcons.newspaper),
                            Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "إتفاقية الإستخدام",
                                      style:
                                          Theme.of(context).textTheme.subhead,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(),
            Container(),
            Container(),
            Container(),
//            LoginTab(),
//            RegisterRefScreen(),
//            RestoreAccountScreen(),
//            LicensesOfUse(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
