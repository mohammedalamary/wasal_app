import 'package:get/get.dart';

import '../constant/message.dart';

validateInput({String? val,int? min, int? max,  String ?type}) {
  // if (type == "username") {
  //   if (!GetUtils.isUsername(val!)) {
  //     return "not valid username";
  //   }
  // }
  //
  // if (type == "phone") {
  //   if (!GetUtils.isPhoneNumber(val!)) {
  //     return "not valid phone";
  //   }
  // }
  //
  // if (type == "email") {
  //   if (!GetUtils.isEmail(val!)) {
  //     return "not valid email";
  //   }
  // }

  if (val!.isEmpty) {
    return messageInputEmpty;
  }
  if (val.length < min!) {
    return "$messageInputMin $min";
  }
  if (val.length > max!) {
    return "$messageInputMax $max";
  }
}