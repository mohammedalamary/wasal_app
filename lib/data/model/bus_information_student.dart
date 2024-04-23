
class BusInfoStudent {
  int? buId;
  int? busNumber;
  String? drName;
  double? drLatitude;
  double? drLongitude;
  String? scName;
  int? scId;
  String? neighbourhood;
  int? drPhone;
  BusInfoStudent({this.neighbourhood,this.drPhone,this.buId, this.busNumber, this.drName, this.drLatitude, this.drLongitude, this.scName, this.scId});

  BusInfoStudent.fromJson(Map<String, dynamic> json) {
    buId = json["Bu_id"];
    busNumber = json["Bus_number"];
    drName = json["Dr_name"];
    drLatitude = json["Dr_latitude"];
    drLongitude = json["Dr_longitude"];
    scName = json["Sc_name"];
    scId = json["Sc_id"];
    neighbourhood = json["neighbourhood"];
    drPhone = json["Dr_phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Bu_id"] = buId;
    _data["Bus_number"] = busNumber;
    _data["Dr_name"] = drName;
    _data["Dr_latitude"] = drLatitude;
    _data["Dr_longitude"] = drLongitude;
    _data["Sc_name"] = scName;
    _data["Sc_id"] = scId;
    return _data;
  }
}