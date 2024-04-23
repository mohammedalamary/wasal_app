import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class NotificationDriverData {
  Crud crud;

  NotificationDriverData(this.crud);

  postData({int?driverId,int? toNotify,int? notifyFrom,String? notifyText,int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.addNotificationDriver,data:{
      "driverId":driverId.toString(),
      "Notif_from":notifyFrom.toString(),
      "to_Notif":toNotify.toString(),
      "Notif_text":notifyText,
      "schoolId":schoolId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  getNotificationData({int? driverId,int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.showNotificationDriver,data:{
      "driverId":driverId.toString(),
      "schoolId":schoolId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
