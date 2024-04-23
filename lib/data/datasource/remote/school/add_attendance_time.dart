import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class AddAttendanceTimeData {
  Crud crud;

  AddAttendanceTimeData(this.crud);

  postData({int? schoolId,int? timeType,String? outSchool,String? presenIn}) async {
    var response = await crud.postData(linkUrl:AppLink.addTime,data:{
      "schoolId":schoolId.toString(),
      "timeType":timeType.toString(),
      "presenIn":presenIn.toString(),
      "outSchool":outSchool,
    });
    return response.fold((l) => l, (r) => r);
  }
}
