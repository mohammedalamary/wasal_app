
class OurSchool {
  int? stId;
  String? stGrader;
  String? stName;
  String? level;
  int? busNumber;
  String? drName;
  String? scName;

  OurSchool({this.stId, this.stGrader, this.stName, this.busNumber, this.drName, this.scName});

  OurSchool.fromJson(Map<String, dynamic> json) {
    stId = json["St_id"];
    stGrader = json["St_grader"];
    stName = json["St_name"];
    busNumber = json["Bus_number"];
    drName = json["Dr_name"];
    scName = json["Sc_name"];
    level = json["St_level"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["St_id"] = stId;
    _data["St_grader"] = stGrader;
    _data["St_name"] = stName;
    _data["Bus_number"] = busNumber;
    _data["Dr_name"] = drName;
    _data["Sc_name"] = scName;
    return _data;
  }
}