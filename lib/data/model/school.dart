
class ModelSchool {
  int? scId;
  String? scName;
  int? scPhone;
  int? scTimeing;
  String? scEmail;
  String? scUsername;
  String? scPass;
  double? scLatitude;
  double? scLongitude;

  ModelSchool({this.scId, this.scName, this.scPhone, this.scTimeing, this.scEmail, this.scUsername, this.scPass, this.scLatitude, this.scLongitude});

  ModelSchool.fromJson(Map<String, dynamic> json) {
    scId = json["Sc_id"];
    scName = json["Sc_name"];
    scPhone = json["Sc_phone"];
    scTimeing = json["Sc_timeing"];
    scEmail = json["Sc_email"];
    scUsername = json["Sc_username"];
    scPass = json["Sc_pass"];
    scLatitude = json["Sc_latitude"];
    scLongitude = json["Sc_longitude"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Sc_id"] = scId;
    _data["Sc_name"] = scName;
    _data["Sc_phone"] = scPhone;
    _data["Sc_timeing"] = scTimeing;
    _data["Sc_email"] = scEmail;
    _data["Sc_username"] = scUsername;
    _data["Sc_pass"] = scPass;
    _data["Sc_latitude"] = scLatitude;
    _data["Sc_longitude"] = scLongitude;
    return _data;
  }
}