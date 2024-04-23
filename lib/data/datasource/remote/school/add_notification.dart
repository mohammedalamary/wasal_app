import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class AddNotificationSchoolData {
  Crud crud;

  AddNotificationSchoolData(this.crud);

  postData({int?schoolId,int? toNotify,int? notifyFrom,String? notifyText,}) async {
    var response = await crud.postData(linkUrl:AppLink.addNotificationSchool,data:{
      "school_id":schoolId.toString(),
      "Notif_from":notifyFrom.toString(),
      "to_Notif":toNotify.toString(),
      "Notif_text":notifyText,
      // "busId":busId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  getNotficationData({int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.showNotifications,data:{
      "schoolId":schoolId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

}
