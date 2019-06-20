import 'package:flutter/material.dart';
import 'package:noah_ark/models/scratch_model.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/utils/auth_client.dart';
import 'package:noah_ark/utils/database_client.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class ScratchScreen extends StatefulWidget {
  final PageController pageController;
  final UserModel user;
  ScratchScreen({@required this.pageController, @required this.user});
  @override
  _ScratchScreenState createState() => _ScratchScreenState();
}

class _ScratchScreenState extends State<ScratchScreen> {
  final TextEditingController _scratchController = TextEditingController();
  ScratchModel _scratchModel;
  String _error;

  @override
  void dispose() {
    _scratchController?.dispose();
    super.dispose();
  }

  _checkScratchAndCreateAcc() async {
    try {
      Common.internal().loading(context);
      _scratchModel =
          await DatabaseClient.internal().getScratch(_scratchController.text);

      if (_scratchModel == null) {
        Navigator.of(context).pop();
        setState(() {
          _error = 'البطاقة غير مسجلة بالنظام';
        });
      } else {
        if (_scratchModel.used) {
          Navigator.of(context).pop();
          setState(() {
            _error = 'البطاقة منتهية الصالحية';
          });
        } else {
          if (_scratchModel.val >= 20) {
            widget.user.cash = _scratchModel.val;
            if (await DatabaseClient.internal()
                .useScratch(_scratchController.text, widget.user.userNum)) {
              await DatabaseClient.internal().createAccount(widget.user);
              await AuthClient.internal().signOut();
              Navigator.of(context).pop();
              widget.pageController.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            } else {
              Navigator.of(context).pop();
              setState(() {
                _error = 'حدث خطأ برجاء المحاولة مرة أخرى';
              });
            }
          } else {
            Navigator.of(context).pop();
            setState(() {
              _error = 'قيمة البطاقة غير متوافقة مع قيمة رسوم فتح الحساب';
            });
          }
        }
      }
    } catch (e) {
      Navigator.of(context).pop();
      setState(() {
        _error = 'حدث خطأ برجاء المحاولة مرة أخرى';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(8, _size.height * 0.1, 8, 8),
          child: TinyContainer(
            text: "سكرتش كارد",
            backgroundColor: Color(0xFF6D6DFF),
            maxWidth: _size.width * 0.9,
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, _size.height * 0.1, 8, 8),
          child: TinyContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (v) {
                  setState(() {});
                },
                controller: _scratchController,
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            backgroundColor: Colors.grey[900],
            maxWidth: _size.width * 0.9,
            textColor: Colors.white,
            fontSize: 16,
          ),
        ),
        InkWell(
          onTap: _scratchController.text.length > 1
              ? () => _checkScratchAndCreateAcc()
              : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TinyContainer(
              text: "فتح الحساب",
              backgroundColor: _scratchController.text.length > 1
                  ? Color(0xFFcb3b3b)
                  : Colors.grey[900],
              maxWidth: _size.width * 0.9,
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
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
