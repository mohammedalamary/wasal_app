
class DriverPresenceStudent {
  int? stId;
  String? stName;
  int? stActive;
  int? prAllowed;
  int? scId;
  int? busId;
  String? stLongitude;
  String? stLatitude;
  String? date;

  DriverPresenceStudent({this.stId, this.stName, this.stActive, this.prAllowed, this.scId, this.busId, this.stLongitude, this.stLatitude, this.date});

  DriverPresenceStudent.fromJson(Map<String, dynamic> json) {
    stId = json["St_id"];
    stName = json["St_name"];
    stActive = json["St_active"];
    prAllowed = json["Pr_allowed"];
    scId = json["sc_id"];
    busId = json["bus_id"];
    stLongitude = json["St_longitude"];
    stLatitude = json["St_latitude"];
    date = json["Date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["St_id"] = stId;
    _data["St_name"] = stName;
    _data["St_active"] = stActive;
    _data["Pr_allowed"] = prAllowed;
    _data["sc_id"] = scId;
    _data["bus_id"] = busId;
    _data["St_longitude"] = stLongitude;
    _data["St_latitude"] = stLatitude;
    _data["Date"] = date;
    return _data;
  }
}