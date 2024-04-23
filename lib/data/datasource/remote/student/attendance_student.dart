import 'package:wasl/core/class/crud.dart';
import 'package:wasl/core/constant/applink.dart';
class AttendanceStudentData {
  Crud crud;

  AttendanceStudentData(this.crud);

  attendanceData({
   int? studentId,int? preparation,String? date}) async {
    var response = await crud.postData(linkUrl:AppLink.attendanceStudent,data:{
      "studentId":studentId.toString(),
      "date":date.toString(),
      "preparation":preparation.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
