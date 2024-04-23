import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Global {

  Global._();
  static  int verifyType =0;
  static  String onBoarding ="0";
  static  String userId ="userId";
  static  String userName ="userName";
  static  String userEmail ="userEmail";
  static  String userPhone ="userPhone";
  static  String step ="0";
  static  String typeUser ="typeUser";
  static String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  // get location in this variables
  static  RxDouble latitude  = 0.0.obs;
  static  RxDouble longitude = 0.0.obs;
  static  String latitudeAllUser = "latitudeAllUser";
  static  String longitudeAllUser = "longitudeAllUser";

  static  const  String  schoolId = "schoolId";
  static  const  String  schoolName = "schoolName";
  static  const  String  schoolEmail = "schoolEmail";
  static  const  String  password = "password";

  static  const  String  parentId = "parentId";
  static  const  String  parentName = "parentName";
  static  const  String  parentEmail = "parentEmail";
  // static  const  String  password = "password";

// driver data
  static  const  String  driverId = "driverId";
  static  const  String   driverName = "driverName";
  static  const  String   driverEmail = "driverEmail";
  //  student data
  static  const  String studentId = "studentId";
  static  const  String   studentName = "studentName";
  static  const  String   studentEmail = "studentEmail";
}