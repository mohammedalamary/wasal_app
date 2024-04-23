
class Notifications {
  int? notifId;
  String? notifDate;
  int? notifFrom;
  int? toNotif;
  String? typeNotif;
  String? notifText;
  int? schoolId;
  int? busId;

  Notifications({this.notifId, this.notifDate, this.notifFrom, this.toNotif, this.typeNotif, this.notifText, this.schoolId, this.busId});

  Notifications.fromJson(Map<String, dynamic> json) {
    notifId = json["Notif_id"];
    notifDate = json["Notif_date"];
    notifFrom = json["Notif_from"];
    toNotif = json["to_Notif"];
    typeNotif = json["Type_notif"];
    notifText = json["Notif_text"];
    schoolId = json["school_id"];
    busId = json["bus_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Notif_id"] = notifId;
    _data["Notif_date"] = notifDate;
    _data["Notif_from"] = notifFrom;
    _data["to_Notif"] = toNotif;
    _data["Type_notif"] = typeNotif;
    _data["Notif_text"] = notifText;
    _data["school_id"] = schoolId;
    _data["bus_id"] = busId;
    return _data;
  }
}