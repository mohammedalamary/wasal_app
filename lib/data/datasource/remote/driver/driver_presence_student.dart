import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class DriverPresenceStudentData {
  Crud crud;

  DriverPresenceStudentData(this.crud);

  presenceStudent({int? schoolId, int? driverId,String? date}) async {
    var response = await crud.postData(
        linkUrl: AppLink.studentGoToSchoolDriver, data: {
      "driverId": driverId.toString(),
      "schoolId": schoolId.toString(),
      "date":date.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
