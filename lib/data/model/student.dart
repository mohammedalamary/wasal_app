
class StudentModel {
  int? stId;
  int? paId;
  int? scId;
  int? busId;
  String? stName;
  int? stIdentity;
  String? stBirthday;
  int? stGuarantee;
  int? prAllowed;
  int? stActive;
  String? stUsername;
  String? stPass;
  dynamic stLongitude;
  dynamic stLatitude;
  // String? stGrade;
  String? parentName;
  int? parentIdentity;
  int? parentPhone;
  String? stGrader;
  String? stLevel;
  String? stEmail;

  StudentModel({this.stId, this.paId, this.scId,
    this.stName, this.stIdentity, this.stBirthday,
    this.stGuarantee, this.prAllowed, this.stActive, this.stUsername, this.stPass, this.stLongitude,
    this.stLatitude,this.busId,  this.parentName, this.parentIdentity, this.parentPhone, this.stGrader, this.stLevel, this.stEmail});

  StudentModel.fromJson(Map<String, dynamic> json) {
    stId = json["St_id"];
    paId = json["pa_id"];
    scId = json["sc_id"];
    busId = json["bus_id"];
    stName = json["St_name"];
    stIdentity = json["St_identity"];
    stBirthday = json["St_birthday"];
    stGuarantee = json["St_guarantee"];
    prAllowed = json["Pr_allowed"];
    stActive = json["St_active"];
    stUsername = json["St_username"];
    stPass = json["St_pass"];
    stLongitude = json["St_longitude"];
    stLatitude = json["St_latitude"];
    // stGrade = json["St_grade"];
    parentName = json["parent_name"];
    parentIdentity = json["parent_identity"];
    parentPhone = json["parent_phone"];
    stGrader = json["St_grader"];
    stLevel = json["St_level"];
    stEmail = json["St_email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["St_id"] = stId;
    _data["pa_id"] = paId;
    _data["sc_id"] = scId;
    _data["St_name"] = stName;
    _data["St_identity"] = stIdentity;
    _data["St_birthday"] = stBirthday;
    _data["St_guarantee"] = stGuarantee;
    _data["bus_id"] = busId;
    _data["Pr_allowed"] = prAllowed;
    _data["St_active"] = stActive;
    _data["St_username"] = stUsername;
    _data["St_pass"] = stPass;
    _data["St_longitude"] = stLongitude;
    _data["St_latitude"] = stLatitude;
    // _data["St_grade"] = stGrade;
    _data["parent_name"] = parentName;
    _data["parent_identity"] = parentIdentity;
    _data["parent_phone"] = parentPhone;
    _data["St_grader"] = stGrader;
    _data["St_level"] = stLevel;
    _data["St_email"] = stEmail;
    return _data;
  }
}