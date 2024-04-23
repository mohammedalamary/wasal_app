import 'package:location/location.dart';

class LocationServices {
  Location location = Location();

  Future<void> checkAndRequestLocationService() async {
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        //   Todo: show error bar
        throw LocationServiceException();
      }
    }
    // return true;
  }

  Future<void> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationPermissionException();
    }

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();

      if (permissionStatus != PermissionStatus.granted) {
        //   todo : show error bar
        throw LocationPermissionException();
      }

      // else {
      //   return true;
      // }
    }
    // return true;
  }

  void getRealTimeLocationData({void Function(LocationData)? onData})async{
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    location.onLocationChanged.listen(onData);
  }


  // حلب الموقع مرة واحدة طون التحريك
  Future<LocationData> getLocation()async{
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }
}

class LocationServiceException implements Exception{

}
class LocationPermissionException implements Exception{

}
