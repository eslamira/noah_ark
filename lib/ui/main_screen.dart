import 'package:flutter/material.dart';
import 'package:noah_ark/models/ad_model.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/ui/widgets/ad_dialog.dart';
import 'package:noah_ark/ui/widgets/noah_scaffold.dart';
import 'package:noah_ark/utils/database_client.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<AdModel> _adList = List<AdModel>();
  UserModel _user;
  bool _isLoading = true;
  final _db = DatabaseClient.internal();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    _user = await _db.getUser();
    _adList = await _db.getAllAds();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  _watchNextAd() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      // assuming that we remove from stack every watched one
      builder: (context) => AdDialog(adModel: _adList.first),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return _isLoading
        ? LoadingModel()
        : NoahScaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TinyContainer(
                          text: "رصيد الحساب",
                          backgroundColor: Colors.pinkAccent,
                          maxWidth: _size.width * 0.4,
                          textColor: Colors.black,
                          fontSize: 14,
                        ),
                        TinyContainer(
                          text: "الراتب التالي",
                          backgroundColor: Colors.pinkAccent,
                          maxWidth: _size.width * 0.4,
                          textColor: Colors.black,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TinyContainer(
                          text: "${_user.cash}", // Cash
                          backgroundColor: Colors.white24,
                          maxWidth: _size.width * 0.2,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                        TinyContainer(
                          text: "0", // Next Cash
                          backgroundColor: Colors.white24,
                          maxWidth: _size.width * 0.2,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TinyContainer(
                          text: "الاعلانات المتاحة",
                          backgroundColor: Color(0xFF6D6DFF),
                          maxWidth: _size.width * 0.4,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                        TinyContainer(
                          text: "عدد المشاهدة",
                          backgroundColor: Color(0xFF6D6DFF),
                          maxWidth: _size.width * 0.4,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TinyContainer(
                          text: "${_adList.length}", // Ava. Ads
                          backgroundColor: Colors.white24,
                          maxWidth: _size.width * 0.2,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                        TinyContainer(
                          text: "0", // Watched Ads
                          backgroundColor: Colors.white24,
                          maxWidth: _size.width * 0.2,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: _size.width * 0.9,
                      color: Colors.white24,
                      alignment: Alignment.center,
                      child: TinyContainer(
                        onTap: _adList.length < 1 ? null : () => _watchNextAd(),
                        text: "شاهد",
                        backgroundColor:
                            _adList.length < 1 ? Colors.grey : Colors.redAccent,
                        maxWidth: _size.width * 0.25,
                        textColor: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TinyContainer(
                      text:
                          "يتوقف تنزيل الراتب علي مشاهدة كافة الاعلانات المتاحة",
                      backgroundColor: Colors.white24,
                      maxWidth: _size.width * 0.9,
                      textColor: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TinyContainer(
                          text: "إضافة رصيد",
                          backgroundColor: Color(0xFF56a554),
                          maxWidth: _size.width * 0.4,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                        TinyContainer(
                          text: "سكراتش كارد",
                          backgroundColor: Color(0xFF56a554),
                          maxWidth: _size.width * 0.4,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TinyContainer(
                          text: "برنامج الإحالة",
                          backgroundColor: Color(0xFF56a554),
                          maxWidth: _size.width * 0.4,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                        TinyContainer(
                          text: "سجل المشتركين",
                          backgroundColor: Color(0xFF56a554),
                          maxWidth: _size.width * 0.4,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TinyContainer(
                          text: "الملف الشخصي",
                          backgroundColor: Color(0xFF56a554),
                          maxWidth: _size.width * 0.4,
                          textColor: Colors.white,
                          fontSize: 16,
                        ),
                        TinyContainer(
                          text: "أمن الحساب",
                          backgroundColor: Color(0xFF56a554),
                          maxWidth: _size.width * 0.4,
                          textColor: Colors.white,
                          fontSize: 16,
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
