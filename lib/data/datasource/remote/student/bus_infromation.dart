import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class BusInformationStudentData {
  Crud crud;

  BusInformationStudentData(this.crud);

  busInfoData({
    int? busId,int? studentId}) async {
    var response = await crud.postData(linkUrl:AppLink.busInformationStudent,data:{
      "busId":busId.toString(),
      "studentId":studentId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
