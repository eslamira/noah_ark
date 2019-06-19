import 'package:flutter/material.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/utils/database_client.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class PersonalInfo extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  PersonalInfo({this.pageController, @required this.user});
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  String _error;
  String _selectedGender;
  String _selectedCity;
  final _db = DatabaseClient.internal();
  final _genders = ['ذكر', 'انثي'];
  List<String> _cities = List<String>();
  DateTime _datePicked;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    _cities = await _db.getCities();
    if (mounted) setState(() {});
  }

  _validateAndNext() async {
    try {
      Common.internal().loading(context);
      widget.user.userBirth.day = _datePicked.day.toString();
      widget.user.userBirth.month = _datePicked.month.toString();
      widget.user.userBirth.year = _datePicked.year.toString();
      widget.user.userGender = _selectedGender;
      widget.user.userCity = _selectedCity;
      Navigator.of(context).pop();
      widget.pageController
          .nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } catch (e) {
      Navigator.of(context).pop();
      setState(() {
        _error = 'حدث خطأ برجاء المحاولة مرة أخرى';
      });
    }
  }

  Future<Null> _datePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(Duration(days: 4380)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().subtract(Duration(days: 4380)),
    );

    if (picked != null) {
      _datePicked = picked;
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(8, _size.height * 0.1, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TinyContainer(
                onTap: () => _datePicker(context),
                text: "تاريخ الميلاد",
                backgroundColor: Color(0xFF6D6DFF),
                fontWeight: FontWeight.bold,
                maxWidth: _size.width * 0.4,
                textColor: Colors.white,
                fontSize: 16,
              ),
              TinyContainer(
                onTap: () => _datePicker(context),
                text: _datePicked == null
                    ? " "
                    : "${_datePicked.year}/"
                        "${_datePicked.month}/"
                        "${_datePicked.day}",
                backgroundColor: Colors.white24,
                maxWidth: _size.width * 0.4,
                textColor: Colors.white,
                fontSize: 16,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TinyContainer(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    onChanged: (val) {
                      _selectedGender = val;
                      if (mounted) setState(() {});
                    },
                    isExpanded: true,
                    elevation: 0,
                    hint: Center(
                      child: Container(
                        child: Text(
                          'الجنس',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Hacen',
                          ),
                        ),
                      ),
                    ),
                    items: _genders.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                backgroundColor: Color(0xFF6D6DFF),
                maxWidth: _size.width * 0.4,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                fontSize: 16,
              ),
              TinyContainer(
                text: _selectedGender ?? " ",
                backgroundColor: Colors.white24,
                maxWidth: _size.width * 0.4,
                textColor: Colors.white,
                fontSize: 16,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TinyContainer(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    onChanged: (val) {
                      _selectedCity = val;
                      if (mounted) setState(() {});
                    },
                    isExpanded: true,
                    elevation: 0,
                    hint: Center(
                      child: Container(
                        child: Text(
                          'المدينة',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Hacen',
                          ),
                        ),
                      ),
                    ),
                    items: _cities.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                backgroundColor: Color(0xFF6D6DFF),
                maxWidth: _size.width * 0.4,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                fontSize: 16,
              ),
              TinyContainer(
                text: _selectedCity ?? " ",
                backgroundColor: Colors.grey[900],
                maxWidth: _size.width * 0.4,
                textColor: Colors.white,
                fontSize: 16,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: (_selectedCity != null &&
                  _selectedGender != null &&
                  _datePicked != null)
              ? () => _validateAndNext()
              : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TinyContainer(
              text: "المرحلة التالية",
              backgroundColor: (_selectedCity != null &&
                      _selectedGender != null &&
                      _datePicked != null)
                  ? Color(0xFFcb3b3b)
                  : Colors.grey[800],
              maxWidth: _size.width * 0.9,
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TinyContainer(
            text: _error ?? " ",
            backgroundColor: Colors.grey[900],
            maxWidth: _size.width * 0.9,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
