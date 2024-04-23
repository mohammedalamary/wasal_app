
class ParentStudent {
  int? stId;
  String? stName;
  int? stActive;
  String? stLevel;
  String? paName;
  String? grader;
  int? paId;

  ParentStudent({this.stId,this.grader, this.stName, this.stActive, this.stLevel, this.paName, this.paId});

  ParentStudent.fromJson(Map<String, dynamic> json) {
    stId = json["St_id"];
    stName = json["St_name"];
    stActive = json["St_active"];
    stLevel = json["St_level"];
    paName = json["Pa_name"];
    paId = json["Pa_id"];
    grader = json["St_grader"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["St_id"] = stId;
    _data["St_name"] = stName;
    _data["St_active"] = stActive;
    _data["St_level"] = stLevel;
    _data["Pa_name"] = paName;
    _data["Pa_id"] = paId;
    return _data;
  }
}