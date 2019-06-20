import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:noah_ark/models/ad_model.dart';
import 'package:noah_ark/models/scratch_model.dart';
import 'package:noah_ark/models/user_model.dart';
import 'package:noah_ark/ui/common/common.dart';
import 'package:noah_ark/utils/auth_client.dart';

class DatabaseClient {
  FirebaseDatabase _db = FirebaseDatabase.instance;

  // Making Singleton
  static DatabaseClient _instance = DatabaseClient.internal();

  DatabaseClient.internal();

  factory DatabaseClient() => _instance;

  Future<Map<dynamic, dynamic>> getUserLic() async {
    DatabaseReference ref = _db.reference().child('config/lic');
    return await ref.once().then((d) {
      return d.value;
    });
  }

  /// Retrieves [restoreAccount] from DB / Config
  Future<Map> getRestoreData() async {
    return await _db
        .reference()
        .child("config/restoreAccount/")
        .once()
        .then((docs) {
      return docs.value == null ? Map() : docs.value;
    });
  }

  Future<bool> isRegOpen() async {
    return await _db
        .reference()
        .child("config/isRegistrationsOpen")
        .once()
        .then((s) {
      return s.value;
    });
  }

  Future<List<String>> getCities() async {
    List<String> c = List<String>();
    await _db.reference().child("config/cities/").once().then((s) {
      Map m = s.value;
      m.values.forEach((v) {
        if (v['active'] ?? true) {
          c.add(v['name']);
        }
      });
    });
    return c;
  }

  /// Retrieves [ADS] from DB
  /// Returns the [Link] of Image
  Future<List<String>> getGalleryADs() async {
    List<String> ads = List<String>();
    await _db.reference().child("ads/outSlider/").once().then((s) {
      if (s.value != null) {
        Map m = s.value;
        m.values.forEach((v) {
          if (v['show']) ads.add(v['link']);
        });
      }
    });
    return ads;
  }

  Future<List<AdModel>> getAllAds() async {
    List<AdModel> c = List<AdModel>();
    await _db.reference().child("ads").once().then((s) {
      s.value.forEach((key, value) {
        if (value['active']) {
          c.add(AdModel.fromMap(key, value));
        }
      });
    });
    return c;
  }

  /// Checks if this [Phone_Number] Exists
  /// Returns [False] if doesn't Exist
  /// Returns [True] if Exist
  Future<bool> isReferExist(String num) async {
    bool exist;
    DatabaseReference userRef = _db.reference().child('users/');
    Query query = userRef.orderByChild("num").equalTo(num);
    await query.once().then((f) {
      f.value == null ? exist = false : exist = true;
    });
    return exist;
  }

  Future<ScratchModel> getScratch(String scratch) async {
    ScratchModel scratchModel;
    await _db.reference().child('scratches/$scratch').once().then((d) {
      if (d.value != null) {
        scratchModel = ScratchModel.fromMap(d.key, d.value);
      }
    });
    return scratchModel;
  }

  Future<bool> useScratch(String scratchId, String userNum) async {
//    String uid = await AuthClient.internal().isLoggedIn().then((f) => f.uid);
    print(scratchId);
    bool _done = false;
    String error;
    await _db
        .reference()
        .child('scratches/$scratchId')
        .runTransaction((t) async {
      if (t != null) {
        if (t.value == null) {
          error = "Doesn't Exist";
        } else if (t.value['used'] == true) {
          error = "Used Before";
        } else {
          t.value['used'] = true;
//        t.value['uid'] = uid;
          t.value['num'] = userNum;
        }
      }
      return t;
    }).then((_) async {
      if (error != null) {
        _done = false;
        throw Exception("$error");
      } else {
        _done = true;
      }
    });
    return _done;
  }

  Future<void> createAccount(UserModel user) async {
    FirebaseUser u = await AuthClient.internal().signUpWithEmailAndPassword(
        '${user.userNum}${Common.internal().dummyDomain}', user.userPass);
    await _db.reference().child('users/${u.uid}/').set(user.toMap());
  }

  Future<String> getUserPin() async {
    String userID = await AuthClient.internal().isLoggedIn().then((u) => u.uid);
    return await _db.reference().child("users/$userID/pin").once().then((s) {
      return (s.value);
    });
  }

  Future<UserModel> getUser() async {
    String userID = await AuthClient.internal().isLoggedIn().then((u) => u.uid);
    return await _db
        .reference()
        .child('users/$userID')
        .once()
        .then((d) => UserModel.fromMap(d.value));
  }

  Future<GeneralAdModel> getGeneralAd() async {
    return await _db.reference().child('ads/g/').once().then((d) {
      //TODO : later
    });
  }
}
