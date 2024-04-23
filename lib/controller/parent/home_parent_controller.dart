import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasl/main.dart';
import '../../core/class/location_serives.dart';
import '../../core/constant/global.dart';

class HomeParentController extends GetxController{
  late CameraPosition initialCameraPosition;
  late LocationServices locationServices ;
  late GoogleMapController googleMapController;
   RxSet<Marker> markers  =<Marker>{}.obs;

  @override
  void onInit() {
    locationServices = LocationServices();
    initialCameraPosition =const CameraPosition(target: LatLng(23.75199265380472, 45.39040564386799),zoom: 4);
    super.onInit();

  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  void onReady() {

    // markers =<Marker>{}.obs;
    super.onReady();
  }

  updateCurrentLocation()async{
    try{
      var locationData  = await locationServices.getLocation();
      // marker set
      double? latitudeAllUser = sharedPreferences.getDouble(Global.latitudeAllUser);
      double? longitudeAllUser = sharedPreferences.getDouble(Global.longitudeAllUser);
      LatLng currentPosition =LatLng(latitudeAllUser!,longitudeAllUser!);
      Marker currentLocationMarker =Marker(markerId: const MarkerId("mu location"),position: currentPosition);
      markers.add(currentLocationMarker);
      update();

      //  end marker
      CameraPosition cameraPosition = CameraPosition(target: LatLng(latitudeAllUser,longitudeAllUser),zoom: 15);
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    } on LocationServiceException catch(e){

    }on LocationPermissionException catch(e){

    }catch (e){

    }
  }

}
  // void initMapStyle() async{
  //   var nightMapStyle=  await DefaultAssetBundle.of(Get.context!).load("assets/map_style/nigh_map_style.json");
  //   var nightMapStyleString = utf8.decode(nightMapStyle.buffer.asUint8List()); // convert byteData to string
  //   googleMapController?.setMapStyle(nightMapStyleString);
  // }


