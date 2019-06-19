class ScratchModel {
  String scratchId;
  String scratchNum;
  int val;
  bool used;
  String userId;
  String userNum;

  ScratchModel() {
    scratchId = '';
    scratchNum = '';
    val = 0;
    used = false;
    userId = '';
    userNum = '';
  }

  ScratchModel.fromMap(this.scratchId, Map m) {
    scratchNum = m['id'];
    val = m['val'];
    used = m['used'];
    userId = m['uid'];
    userNum = m['num'];
  }
}
