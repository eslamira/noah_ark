class UserModel {
  String userRef;
  String userNum;
  UserName userName;
  UserBirth userBirth;
  String userGender;
  String userCity;
  String userPass;
  String userPinCode;

  UserModel() {
    userRef = '';
    userNum = '';
    userName = UserName();
    userBirth = UserBirth();
    userGender = '';
    userCity = '';
    userPass = '';
    userPinCode = '';
  }

  UserModel.fromMap(Map m) {
    userRef = m['ref'];
    userNum = m['num'];
    userName = UserName.fromMap(m['name']);
    userBirth = UserBirth.fromMap(m['birth']);
    userGender = m['gen'];
    userCity = m['city'];
    userPinCode = m['pin'];
  }

  toMap() {
    return {
      'ref': userRef,
      'num': userNum,
      'name': userName.toMap(),
      'birth': userBirth.toMap(),
      'gen': userGender,
      'city': userCity,
      'pin': userPinCode,
    };
  }
}

class UserName {
  String firstName;
  String secondName;
  String thirdName;
  String fourthName;

  UserName() {
    firstName = '';
    secondName = '';
    thirdName = '';
    fourthName = '';
  }

  UserName.fromMap(Map m) {
    firstName = m['fName'];
    secondName = m['sName'];
    thirdName = m['tName'];
    fourthName = m['foName'];
  }

  toMap() {
    return {
      'fName': firstName,
      'sName': secondName,
      'tName': thirdName,
      'foName': fourthName,
    };
  }
}

class UserBirth {
  String day;
  String month;
  String year;

  UserBirth() {
    day = '';
    month = '';
    year = '';
  }

  UserBirth.fromMap(Map m) {
    day = m['d'];
    month = m['m'];
    year = m['y'];
  }

  toMap() {
    return {
      'd': day,
      'm': month,
      'y': year,
    };
  }
}
