import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class NotificationStudentData {
  Crud crud;

  NotificationStudentData(this.crud);

  getNotificationData({
    int? schoolId,int? busId}) async {
    var response = await crud.postData(linkUrl:AppLink.getNotificationStudent,data:{
      "schoolId":schoolId.toString(),
      "busId":busId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
