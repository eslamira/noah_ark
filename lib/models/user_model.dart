class UserModel {
  String userRef;
  String userNum;
  UserName userName;
  UserBirth userBirth;
  String userGender;
  String userCity;
  String userPass;
  String userPinCode;
  int cash;
  int directCounter;
  int unDirectCounter;
  int secondaryCounter;
  int subSecondaryCounter;
  bool isActive;
  bool isComplete;
  bool isDefined;

  UserModel() {
    userRef = '';
    userNum = '';
    userName = UserName();
    userBirth = UserBirth();
    userGender = '';
    userCity = '';
    userPass = '';
    userPinCode = '';
    cash = 0;
    directCounter = 0;
    unDirectCounter = 0;
    secondaryCounter = 0;
    subSecondaryCounter = 0;
    isActive = false;
    isComplete = false;
    isDefined = false;
  }

  UserModel.fromMap(Map m) {
    userRef = m['ref'];
    userNum = m['num'];
    userName = UserName.fromMap(m['name']);
    userBirth = UserBirth.fromMap(m['birth']);
    userGender = m['gen'];
    userCity = m['city'];
    userPinCode = m['pin'];
    cash = m['cash'];
    directCounter = m['directCounter'];
    unDirectCounter = m['unDirectCounter'];
    secondaryCounter = m['secondaryCounter'];
    subSecondaryCounter = m['subSecondaryCounter'];
    isActive = m['isActive'];
    isComplete = m['isComplete'];
    isDefined = m['isDefined'];
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
      'cash': cash,
      'directCounter': directCounter,
      'unDirectCounter': unDirectCounter,
      'secondaryCounter': secondaryCounter,
      'subSecondaryCounter': subSecondaryCounter,
      'isActive': isActive,
      'isComplete': isComplete,
      'isDefined': isDefined,
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
