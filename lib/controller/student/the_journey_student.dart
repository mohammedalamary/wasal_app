import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/class/location_serives.dart';
import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/student/bus_infromation.dart';
import '../../data/model/bus_information_student.dart';
import '../../main.dart';
class StudentTheJourneyController extends GetxController{
  late CameraPosition initialCameraPosition;
  late LocationServices locationServices ;
  late GoogleMapController googleMapControllerPar;
  RxSet<Marker> markers  =<Marker>{}.obs;
  // RxSet<Polyline> polyLines=<Polyline>{}.obs;
  Set<Polyline> polyLines ={};

  BusInformationStudentData  busInformationStudentData = BusInformationStudentData(Get.find());
  List<BusInfoStudent> busInformationList = [];
  StatusRequest? statusRequest =StatusRequest.none;


  @override
  void onInit() {
    locationServices = LocationServices();
    initialCameraPosition =const CameraPosition(target: LatLng(23.75199265380472, 45.39040564386799),zoom: 8);
    getBusInfoData();
    super.onInit();
  }
  @override
  void dispose() {
    googleMapControllerPar.dispose();
    super.dispose();
  }

  getBusInfoData()async{
    busInformationList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await busInformationStudentData.busInfoData(
        studentId: int.parse( sharedPreferences.getString(Global.studentId).toString()),busId:
    int.parse(sharedPreferences.getString(Global.driverId).toString()));
    print(" get Bus Info Student data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        busInformationList.addAll(responseData.map((e) => BusInfoStudent.fromJson(e)).toList());
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  updateCurrentLocation()async{
    try{
      // var locationData  = await locationServices.getLocation();
      // marker set
      double? latitudeAllUser = sharedPreferences.getDouble(Global.latitudeAllUser);
      double? longitudeAllUser = sharedPreferences.getDouble(Global.longitudeAllUser);
      LatLng currentPosition =LatLng(latitudeAllUser!,longitudeAllUser!);
      Marker currentLocationMarker =Marker(markerId: const MarkerId("mu location"),position: currentPosition);
      markers.add(currentLocationMarker);
      var bitmapDescriptor = await BitmapDescriptor.fromBytes( await getImageFromRowData(image:"assets/images/person.png",width: 60));

      var myMarkers = busInformationList.map((placeModel) => Marker(markerId: MarkerId(placeModel.buId.toString(),),
          position: LatLng(placeModel.drLatitude!,placeModel.drLongitude!),icon:
          bitmapDescriptor )).toSet();
      markers.addAll(myMarkers);
      update();
      //  end marker
      CameraPosition cameraPosition = CameraPosition(target: LatLng(latitudeAllUser,longitudeAllUser),zoom: 12);
      googleMapControllerPar.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      // update();
    } on LocationServiceException catch(e){

    }on LocationPermissionException catch(e){

    }catch (e){

    }
  }

  Future<Uint8List>getImageFromRowData({String? image,double? width})async{
    var imageData = await rootBundle.load(image.toString());
    var imageCodec = await ui.instantiateImageCodec(imageData.buffer.asUint8List(),targetWidth: width!.round());
    var imageFrameInfo =await  imageCodec.getNextFrame();
    var imageByData = await imageFrameInfo.image.toByteData(format: ui.ImageByteFormat.png);

    return imageByData!.buffer.asUint8List();
  }
  void initMarker()async{
    var bitmapDescriptor = await BitmapDescriptor.fromBytes( await getImageFromRowData(image:"assets/images/person.png",width: 60));

    var myMarkers = busInformationList.map((placeModel) => Marker(markerId: MarkerId(placeModel.buId.toString(),),
        position: LatLng(placeModel.drLatitude!,placeModel.drLongitude!),icon:
        bitmapDescriptor )).toSet();
    markers.addAll(myMarkers);


  }
  void initPolyLines() async{

    double? latitudeAllUser = sharedPreferences.getDouble(Global.latitudeAllUser);
    double? longitudeAllUser = sharedPreferences.getDouble(Global.longitudeAllUser);
    var myPolyLine = busInformationList.map((polyLine) => Polyline(startCap: Cap.roundCap,zIndex: 1,
      geodesic: true,width: 5,color: Colors.red,polylineId: PolylineId(polyLine.buId.toString()),points: [

        // LatLng(17.483297737400804, 47.115734297231185),
        LatLng(latitudeAllUser!,longitudeAllUser!),

        LatLng(polyLine.drLatitude!, polyLine.drLongitude!),

        // LatLng(15.365424842221499, 44.23044106462256),
      ],)).toSet();
    // Polyline polyline =   Polyline(startCap: Cap.roundCap,zIndex: 1,geodesic: true,width: 5,color: Colors.red,polylineId: const PolylineId("1"),points: [
    //
    //   LatLng(sharedPreferences.getDouble(Global.latitudeAllUser)!,sharedPreferences.getDouble(Global.latitudeAllUser)!),
    //   // LatLng(17.483297737400804, 47.115734297231185),
    //   const LatLng(17.48786672491214, 47.12489177593886),
    //
    //   // LatLng(15.365424842221499, 44.23044106462256),
    // ]);
    //
    // Polyline polyline2 =  Polyline(startCap: Cap.roundCap,zIndex: 2,width:5,color: Colors.red,polylineId: PolylineId("2"),points: [
    //   LatLng(sharedPreferences.getDouble(Global.latitudeAllUser)!,sharedPreferences.getDouble(Global.latitudeAllUser)!),
    //   const LatLng(15.33901092604902, 44.179893319887036),
    // ]);

    polyLines.addAll(myPolyLine);

    // polyLines.add(polyline);
    // polyLines.add(polyline2);
    update();

  }
}