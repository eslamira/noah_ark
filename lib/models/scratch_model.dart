class ScratchModel {
  String scratchId;
  int val;
  bool used;
  String userId;
  String userNum;

  ScratchModel() {
    scratchId = '';
    val = 0;
    used = false;
    userId = '';
    userNum = '';
  }

  ScratchModel.fromMap(this.scratchId, Map m) {
    val = m['val'];
    used = m['used'] ?? false;
    userId = m['uid'];
    userNum = m['num'];
  }
}
