//
// class ComplaintModel {
//   int? comId;
//   String? comDate;
//   int? comFrom;
//   int? comTo;
//   String? comText;
//   String? comReply;
//   String? comAttached;
//   int? scId;
//   String? nameComplaint;
//
//   ComplaintModel({this.comId, this.comDate, this.comFrom, this.comTo, this.comText, this.comReply, this.comAttached, this.scId, this.nameComplaint});
//
//   ComplaintModel.fromJson(Map<String, dynamic> json) {
//     comId = json["Com_id"];
//     comDate = json["Com_date"];
//     comFrom = json["Com_from"];
//     comTo = json["Com_to"];
//     comText = json["Com_text"];
//     comReply = json["Com_reply"];
//     comAttached = json["Com_ attached"];
//     scId = json["Sc_id"];
//     nameComplaint = json["name_complaint"];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["Com_id"] = comId;
//     _data["Com_date"] = comDate;
//     _data["Com_from"] = comFrom;
//     _data["Com_to"] = comTo;
//     _data["Com_text"] = comText;
//     _data["Com_reply"] = comReply;
//     _data["Com_ attached"] = comAttached;
//     _data["Sc_id"] = scId;
//     _data["name_complaint"] = nameComplaint;
//     return _data;
//   }
// }


class ComplaintModel {
  int? comId;
  String? comDate;
  int? comFrom;
  int? comTo;
  String? comText;
  String? comReply;
  String? comAttached;
  int? scId;
  int? parentId;
  int? busId;
  String? nameComplaint;
  int? studentId;

  ComplaintModel({this.comId, this.comDate, this.comFrom, this.comTo, this.comText, this.comReply, this.comAttached, this.scId, this.parentId, this.busId, this.nameComplaint, this.studentId});

  ComplaintModel.fromJson(Map<String, dynamic> json) {
    comId = json["Com_id"];
    comDate = json["Com_date"];
    comFrom = json["Com_from"];
    comTo = json["Com_to"];
    comText = json["Com_text"];
    comReply = json["Com_reply"];
    comAttached = json["Com_ attached"];
    scId = json["Sc_id"];
    parentId = json["parent_id"];
    busId = json["bus_id"];
    nameComplaint = json["name_complaint"];
    studentId = json["student_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Com_id"] = comId;
    _data["Com_date"] = comDate;
    _data["Com_from"] = comFrom;
    _data["Com_to"] = comTo;
    _data["Com_text"] = comText;
    _data["Com_reply"] = comReply;
    _data["Com_ attached"] = comAttached;
    _data["Sc_id"] = scId;
    _data["parent_id"] = parentId;
    _data["bus_id"] = busId;
    _data["name_complaint"] = nameComplaint;
    _data["student_id"] = studentId;
    return _data;
  }
}