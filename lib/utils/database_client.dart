import 'package:firebase_database/firebase_database.dart';

class DatabaseClient {
  FirebaseDatabase _db = FirebaseDatabase.instance;

  // Making Singleton
  static DatabaseClient _instance = DatabaseClient.internal();

  DatabaseClient.internal();

  factory DatabaseClient() => _instance;

  Future<String> getUserLic() async {
    String lic;
    DatabaseReference ref = _db.reference().child('config/useLic');
    await ref.once().then((d) {
      lic = d.value.toString() ?? "Failed to get Use Lic";
    });
    return lic;
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
        if (v['active']) {
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

//  Future<AdModel> getAd(String city, String gender, String age) async {
//    return await _db
//        .reference()
//        .child("ads/specific")
//        .child("${city}_${gender}_$age")
//        .once()
//        .then((snap1) async {
//      if (snap1.value == null ||
//          !(DateTime.now().millisecondsSinceEpoch >= snap1.value['startDate'] &&
//              DateTime.now().millisecondsSinceEpoch <=
//                  snap1.value['endDate'])) {
//        return await _db
//            .reference()
//            .child("ads/specific")
//            .child("${city}_كلاهما_$age")
//            .once()
//            .then((snap2) async {
//          if (snap2.value == null ||
//              !(DateTime.now().millisecondsSinceEpoch >=
//                      snap2.value['startDate'] &&
//                  DateTime.now().millisecondsSinceEpoch <=
//                      snap2.value['endDate'])) {
//            return await _db
//                .reference()
//                .child("ads/general/")
//                .once()
//                .then((snap3) async {
//              if (snap3.value == null ||
//                  !(DateTime.now().millisecondsSinceEpoch >=
//                          snap3.value['startDate'] &&
//                      DateTime.now().millisecondsSinceEpoch <=
//                          snap3.value['endDate'])) {
//                return null;
//              } else {
//                return AdModel.fromMap(snap3.value);
//              }
//            });
//          } else {
//            return AdModel.fromMap(snap2.value);
//          }
//        });
//      } else {
//        return AdModel.fromMap(snap1.value);
//      }
//    });
//  }

//  /// Checks if this [Phone_Number] Exists
//  /// Returns [False] if doesn't Exist
//  /// Returns [True] if Exist
//  Future<bool> isReferExist(String num) async {
//    bool exist;
//    DatabaseReference userRef = _db.reference().child('users/');
//    Query query = userRef.orderByChild("num").equalTo(num);
//    await query.once().then((f) {
//      f.value == null ? exist = false : exist = true;
//    });
//    return exist;
//  }
//
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
//  /// Checks if this [National_ID] Exists
//  /// Returns [False] if doesn't Exist
//  /// Returns [True] if Exist
//  Future<bool> isUserRegistered(String id) async {
//    bool isRegistered;
//    DatabaseReference userRef = _db.reference().child('users/');
//    Query query = userRef.orderByChild("id").equalTo(id);
//    await query.once().then((f) {
//      f.value == null ? isRegistered = false : isRegistered = true;
//    });
//    return isRegistered;
//  }
//
//  /// Creates New User in DB on registration Success
//  /// Receives [UserModel] and send all it's Data to DB
//  /// No Returns
//  Future<void> createUser(UserModel user) async {
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    DatabaseReference userRef = _dbUsers.reference().child('users/$userID');
//    await userRef.set({
//      'pin': "${user.pin}",
//      'id': "${user.id}",
//      'num': "${user.num}",
//      'name': "${user.name}",
//      'gen': "${user.gender}",
//      'ref': "${user.referer}",
//      'refid': "${user.refererID}",
//      'cash': 0,
//      'level': 0,
//      'directCounter': 0,
//      'unDirectCounter': 0,
//      'secondaryCounter': 0,
//      'subSecondaryCounter': 0,
//      'totalPaid': 0,
//      'isActive': false,
//      'isAgent': false,
//      'isDefined': false,
//      'isPaid': false,
//      'isDisabled': false,
//      'isPending': false,
//      'lastReset': 0,
//      'created At': ServerValue.timestamp,
//      'addr': [
//        "${user.userAddress.homeNum}",
//        "${user.userAddress.streetName}",
//        "${user.userAddress.state}",
//        "${user.userAddress.city}",
//      ],
//      'bir': "${user.userBirth.day}/${user.userBirth.month}",
//      'biry': "${user.userBirth.year}",
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
//  Future<String> defaultPass() async {
//    String pass;
//    DatabaseReference passRef =
//        _db.reference().child('config/accountSec/password');
//    await passRef.once().then((f) {
//      pass = f.value;
//    });
//    return pass;
//  }
//
//  Future<int> useScratch(String scratch) async {
//    String userID = await _authClient.isLoggedIn().then((u) => u.uid);
//    if (userID == null) throw Exception("User NOT Logged In");
//
//    int newPrice;
//    String error;
//
//    DatabaseReference scratchRef = _db.reference().child('scratches/$scratch');
//    await scratchRef.runTransaction((MutableData transaction) async {
//      if (transaction.value == null) {
//        error = "Doesn't Exist";
//      } else if (transaction.value['used'] == true) {
//        error = "Used Before";
//      } else {
//        error = null;
//        transaction.value['used'] = true;
//        transaction.value['uid'] = "$userID";
//        transaction.value['usedDate'] = ServerValue.timestamp;
//        newPrice = transaction.value['price'];
//      }
//      return transaction;
//    }).then((_) async {
//      if (error != null) {
//        throw Exception("$error");
//      }
//    });
//    return newPrice;
//  }
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
