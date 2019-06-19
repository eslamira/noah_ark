class AdModel {
  String id;
  String picLink;
  DateTime dateTime;
  Duration duration;
  bool watched;
  bool active;

  AdModel.fromMap(this.id, Map m) {
    picLink = m['picLink'];
    dateTime = DateTime.fromMillisecondsSinceEpoch(m['dateTime'] ?? 0);
    duration = Duration(seconds: m['duration'] ?? 20);
    watched = m['watched'];
    // TODO: Need Better Algorithm for this(watched) ex: get all watched json and check if watched or not(arr.contains).
    active = m['active'];
    // not needed at all, we can filter on retrieving method
  }
}
