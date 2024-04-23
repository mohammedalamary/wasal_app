
class BusModel {
  int? buId;
  int? scId;
  String? drName;
  int? drIdentity;
  String? drEmail;
  String? neighbourhood;
  int? busNumber;
  int? stNu;
  String? drUsername;
  String? drPass;
  double? drLongitude;
  double? drLatitude;
  int? drPhone;
  int? studentId;

  BusModel({this.buId, this.scId, this.drName, this.drIdentity, this.drEmail, this.neighbourhood, this.busNumber, this.stNu, this.drUsername, this.drPass, this.drLongitude, this.drLatitude, this.drPhone, this.studentId});

  BusModel.fromJson(Map<String, dynamic> json) {
    buId = json["Bu_id"];
    scId = json["Sc_id"];
    drName = json["Dr_name"];
    drIdentity = json["Dr_identity"];
    drEmail = json["Dr_email"];
    neighbourhood = json["neighbourhood"];
    busNumber = json["Bus_number"];
    stNu = json["st_nu"];
    drUsername = json["Dr_username"];
    drPass = json["Dr_pass"];
    drLongitude = json["Dr_longitude"];
    drLatitude = json["Dr_latitude"];
    drPhone = json["Dr_phone"];
    studentId = json["student_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Bu_id"] = buId;
    _data["Sc_id"] = scId;
    _data["Dr_name"] = drName;
    _data["Dr_identity"] = drIdentity;
    _data["Dr_email"] = drEmail;
    _data["neighbourhood"] = neighbourhood;
    _data["Bus_number"] = busNumber;
    _data["st_nu"] = stNu;
    _data["Dr_username"] = drUsername;
    _data["Dr_pass"] = drPass;
    _data["Dr_longitude"] = drLongitude;
    _data["Dr_latitude"] = drLatitude;
    _data["Dr_phone"] = drPhone;
    _data["student_id"] = studentId;
    return _data;
  }
}