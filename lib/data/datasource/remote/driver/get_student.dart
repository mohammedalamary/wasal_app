import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class GetStudentDriverData {
  Crud crud;

  GetStudentDriverData(this.crud);

  getStudentData({int? schoolId, int? driverId}) async {
    var response = await crud.postData(
        linkUrl: AppLink.getStudentDriver, data: {
      "driverId": driverId.toString(),
      "schoolId": schoolId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
