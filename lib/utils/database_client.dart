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

//  Future<double> getUserCash() async {
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    return await _db.reference().child("users/$userID/cash").once().then((s) {
//      return double.parse(s.value.toString());
//    });
//  }
//
//  Future<String> getUserName(String id) async {
//    return await _db.reference().child("users/$id/name").once().then((s) {
//      return s.value ?? "حدث خطأ";
//    });
//  }
//
//  Future<String> getUserNum(String id) async {
//    return await _db.reference().child("users/$id/num").once().then((s) {
//      return s.value ?? "حدث خطأ";
//    });
//  }
//
//  /// returns the [RefID] ID in Database.
//  Future<String> getRefId(String num) async {
//    String ref;
//    DatabaseReference userRef = _db.reference().child('users/');
//    Query query = userRef.orderByChild("num").equalTo(num);
//    await query.once().then((f) {
//      Map m = f.value;
//      ref = m.keys.first;
//    });
//    return ref;
//  }
//
//  Future<bool> isBlockedUser(String num, String type) async {
//    return await _db
//        .reference()
//        .child("config/isDisabled/$type")
//        .orderByChild("value")
//        .equalTo(num)
//        .once()
//        .then((snapshot) {
//      return snapshot.value == null ? false : true;
//    });
//  }
//
//  /// Returns [UserModel] of [CurrentUser]
//  /// Return [Exception] if not Logged In
//  Future<UserModel> retrieveUserData() async {
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    if (userID == null) throw Exception("User NOT Logged In");
//    DatabaseReference userRef = _db.reference().child('users/$userID');
//    return await userRef.once().then((s) {
//      if (s.value != null) UserModel.shared(s);
//    });
//  }
//
//
//  /// Retrieves all [ScratchModel]s From DB
//  /// Returns List of [ScratchCard]s
//  /// Returns [Exception] if User Not LoggedIn
//  /// Requires Special [Indexing] => sort by [usedDate] descending + [uid]
//  Future<List<ScratchCard>> getScratchHistory() async {
//    List<ScratchCard> historyData = List<ScratchCard>();
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    if (userID == null) throw Exception("User NOT Logged In");
//
//    DatabaseReference userRef = _db.reference().child('scratches/');
//    Query query = userRef.orderByChild("uid").equalTo(userID);
//
//    await query.once().then((q) {
//      if (q.value != null) {
//        Map m = q.value;
//        m.keys.forEach((k) {
//          historyData
//            ..add(
//              ScratchCard(
//                ScratchModel.fromMap(k, m[k]),
//              ),
//            );
//        });
//      }
//    });
//    return historyData;
//  }
//
//  /// Updates [CurrentUser]'s [PinCode]
//  /// Return [Exception] if not Logged In
//  Future<void> updatePin(String pin) async {
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    if (userID == null) throw Exception("User NOT Logged In");
//    DatabaseReference userRef = _dbUsers.reference().child('users/$userID');
//    await userRef.update({'pin': pin});
//  }
//
//  Future<List<DirectUserCard>> getDirectAccounts() async {
//    List<DirectUserCard> historyData = List<DirectUserCard>();
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    if (userID == null) throw Exception("User NOT Logged In");
//
//    DatabaseReference userRef = _dbUsers.reference().child('users/');
//    Query query = userRef.orderByChild("ref").equalTo(userID);
//
//    await query.once().then((q) {
//      if (q.value != null) {
//        q.value.forEach((key, value) {
//          historyData
//            ..add(
//              DirectUserCard(DirectUserModel.fromMap(key, value)),
//            );
//        });
//      }
//    });
//    return historyData;
//  }
//
//  Future<int> getUserPoints() async {
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    if (userID == null) throw Exception("User NOT Logged In");
//    int userPoints = 0;
//
//    userPoints += await _db
//        .reference()
//        .child("/users/$userID/directCounter")
//        .once()
//        .then((count) => count.value);
//    userPoints += await _db
//        .reference()
//        .child("/users/$userID/unDirectCounter")
//        .once()
//        .then((count) => count.value);
//    userPoints += await _db
//        .reference()
//        .child("/users/$userID/secondaryCounter")
//        .once()
//        .then((count) => count.value);
//    userPoints += await _db
//        .reference()
//        .child("/users/$userID/subSecondaryCounter")
//        .once()
//        .then((count) => count.value);
//    userPoints -= await _db
//        .reference()
//        .child("/users/$userID/usedPoints")
//        .once()
//        .then((count) => count.value ?? 0);
//
//    return userPoints;
//  }
//
//  Future<bool> requestButtonEnabled() async {
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    if (userID == null) throw Exception("User NOT Logged In");
//
//    bool enabled;
//    int days;
//
//    DatabaseReference configRef =
//        _db.reference().child('config/prizeDrawDelay');
//    await configRef.once().then((s) {
//      if (s.value == null) {
//        days = 7;
//      } else {
//        days = s.value;
//      }
//    });
//
//    DatabaseReference userRef =
//        _db.reference().child('users/$userID/lastPrizeDate');
//    await userRef.once().then((f) {
//      if (f.value != null) {
//        DateTime last = DateTime.fromMillisecondsSinceEpoch(f.value);
//        DateTime now = DateTime.now();
//        Duration def = now.difference(last);
//        if (def.inDays > days) {
//          enabled = true;
//        } else {
//          enabled = false;
//        }
//      } else {
//        enabled = true;
//      }
//    });
//
//    return enabled;
//  }
//
//  Future<int> getDelayNum() async {
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    if (userID == null) throw Exception("User NOT Logged In");
//
//    int days;
//    int lastP;
//
//    await _db
//        .reference()
//        .child('users/$userID/lastPrizeDate')
//        .once()
//        .then((s) {
//      if (s.value == null) {
//        lastP = DateTime.now().millisecondsSinceEpoch;
//      } else {
//        lastP = s.value;
//      }
//    });
//
//    DatabaseReference configRef =
//        _db.reference().child('config/prizeDrawDelay');
//    await configRef.once().then((s) {
//      if (s.value == null) {
//        days = 7;
//      } else {
//        days = s.value -
//            DateTime.now()
//                .difference(DateTime.fromMillisecondsSinceEpoch(lastP))
//                .inDays;
//      }
//    });
//    return days;
//  }
//
//  Future<PostInfoCard> getPostalInfo(bool isAgent) async {
//    return _db.reference().child("config/postalMethod").once().then((s) {
//      return PostInfoCard(
//        PostInfoModel.fromMap(s.key, s.value),
//        isAgent,
//      );
//    });
//  }
//
//  /// Takes [date], [name], [opNumber] and [amount] sends Postal Request to DB
//  /// Return [Exception] if not Logged In
//  Future<void> sendPostalRequest(DateTime date, String name, String opNumber,
//      bool agent, int percent) async {
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    if (userID == null) throw Exception("User NOT Logged In");
//
//    await _db.reference().child("postalRequests").push().set({
//      "date": date.millisecondsSinceEpoch,
//      "uid": "$userID",
//      "name": "$name",
//      "isAgent": agent,
//      "percent": percent,
//      "opNumber": "$opNumber",
//      "status": "pending",
//      "placeDate": ServerValue.timestamp,
//    });
//  }
//
//  Future<void> saveUserToken(String token) async {
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    if (userID == null) throw Exception("User NOT Logged In");
//
//    await _db.reference().child('Notify/$userID').set('$token');
//  }
}
