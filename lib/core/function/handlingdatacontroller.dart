import 'package:wasl/core/class/stausrequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    //return map
    return StatusRequest.success;
  }
}
