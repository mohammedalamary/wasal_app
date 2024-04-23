
class ComplaintsParent {
  int? paId;
  String? paName;
  int? paIdentity;
  int? paPhone;
  String? paEmail;
  String? paUsername;
  String? paPass;
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

  ComplaintsParent({this.paId, this.paName, this.paIdentity, this.paPhone, this.paEmail, this.paUsername, this.paPass, this.comId, this.comDate, this.comFrom, this.comTo, this.comText, this.comReply, this.comAttached, this.scId, this.parentId, this.busId, this.nameComplaint});

  ComplaintsParent.fromJson(Map<String, dynamic> json) {
    paId = json["Pa_id"];
    paName = json["Pa_name"];
    paIdentity = json["Pa_identity"];
    paPhone = json["Pa_phone"];
    paEmail = json["Pa_email"];
    paUsername = json["Pa_username"];
    paPass = json["Pa_pass"];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Pa_id"] = paId;
    _data["Pa_name"] = paName;
    _data["Pa_identity"] = paIdentity;
    _data["Pa_phone"] = paPhone;
    _data["Pa_email"] = paEmail;
    _data["Pa_username"] = paUsername;
    _data["Pa_pass"] = paPass;
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
    return _data;
  }
}