import 'package:flutter/material.dart';
import 'package:noah_ark/ui/widgets/noah_container.dart';
import 'package:noah_ark/ui/widgets/noah_scaffold.dart';
import 'package:noah_ark/utils/database_client.dart';

class PersonalInfo extends StatefulWidget {
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
    return NoahScaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(8, _size.height * 0.1, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NoahContainer(
                  onTap: () => _datePicker(context),
                  text: "تاريخ الميلاد",
                  backgroundColor: Color(0xFF6D6DFF),
                  maxWidth: _size.width * 0.4,
                  textColor: Colors.white,
                  fontSize: 16,
                ),
                NoahContainer(
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
                NoahContainer(
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
                  textColor: Colors.white,
                  fontSize: 16,
                ),
                NoahContainer(
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
                NoahContainer(
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
                  textColor: Colors.white,
                  fontSize: 16,
                ),
                NoahContainer(
                  text: _selectedCity ?? " ",
                  backgroundColor: Colors.white24,
                  maxWidth: _size.width * 0.4,
                  textColor: Colors.white,
                  fontSize: 16,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NoahContainer(
              text: "المرحلة التالية",
              backgroundColor: Color(0xFFcb3b3b),
              maxWidth: _size.width * 0.9,
              textColor: Colors.white,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NoahContainer(
              text: _error ?? " ",
              backgroundColor: Colors.white24,
              maxWidth: _size.width * 0.9,
              textColor: Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}