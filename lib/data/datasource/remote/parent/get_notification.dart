import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class NotificationParentData {
  Crud crud;

  NotificationParentData(this.crud);

  getNotificationData({int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.showNotificationParent,data:{
      "schoolId":schoolId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
