import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class UpdateAccountStudentData {
  Crud crud;

  UpdateAccountStudentData(this.crud);

  postData({String? pass,String? email,String? name,int? studentId}) async {
    var response = await crud.postData(linkUrl:AppLink.updateAccountStudent,data:{
      "email":email,
      "password":pass,
      "name":name,
      "studentId":studentId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
