import 'package:flutter/material.dart';
import 'package:noah_ark/ui/widgets/noah_container.dart';
import 'package:noah_ark/ui/widgets/noah_scaffold.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return NoahScaffold(
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
                  NoahContainer(
                    text: "رصيد الحساب",
                    backgroundColor: Colors.pinkAccent,
                    maxWidth: _size.width * 0.4,
                    textColor: Colors.black,
                    fontSize: 14,
                  ),
                  NoahContainer(
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
                  NoahContainer(
                    text: "0",
                    backgroundColor: Colors.white24,
                    maxWidth: _size.width * 0.2,
                    textColor: Colors.white,
                    fontSize: 16,
                  ),
                  NoahContainer(
                    text: "0",
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
                  NoahContainer(
                    text: "الاعلانات المتاحة",
                    backgroundColor: Color(0xFF6D6DFF),
                    maxWidth: _size.width * 0.4,
                    textColor: Colors.white,
                    fontSize: 16,
                  ),
                  NoahContainer(
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
                  NoahContainer(
                    text: "0",
                    backgroundColor: Colors.white24,
                    maxWidth: _size.width * 0.2,
                    textColor: Colors.white,
                    fontSize: 16,
                  ),
                  NoahContainer(
                    text: "0",
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
                child: NoahContainer(
                  text: "شاهد",
                  backgroundColor: Colors.redAccent,
                  maxWidth: _size.width * 0.25,
                  textColor: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: NoahContainer(
                text: "يتوقف تنزيل الراتب علي مشاهدة كافة الاعلانات المتاحة",
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
                  NoahContainer(
                    text: "إضافة رصيد",
                    backgroundColor: Color(0xFF56a554),
                    maxWidth: _size.width * 0.4,
                    textColor: Colors.white,
                    fontSize: 16,
                  ),
                  NoahContainer(
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
                  NoahContainer(
                    text: "برنامج الإحالة",
                    backgroundColor: Color(0xFF56a554),
                    maxWidth: _size.width * 0.4,
                    textColor: Colors.white,
                    fontSize: 16,
                  ),
                  NoahContainer(
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
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NoahContainer(
                    text: "الملف الشخصي",
                    backgroundColor: Color(0xFF56a554),
                    maxWidth: _size.width * 0.4,
                    textColor: Colors.white,
                    fontSize: 16,
                  ),
                  NoahContainer(
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
