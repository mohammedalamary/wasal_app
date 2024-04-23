import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class OurContactSchoolData {
  Crud crud;

  OurContactSchoolData(this.crud);

  getStudentDat({int? schoolId}) async {
    var response = await crud.postData(linkUrl:AppLink.ourContactSchool,data:{
      "schoolId":schoolId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
