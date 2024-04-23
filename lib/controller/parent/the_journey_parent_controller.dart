import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/class/location_serives.dart';
import '../../core/class/stausrequest.dart';
import '../../core/constant/global.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasource/remote/parent/add_accountforchildern.dart';
import '../../data/model/student.dart';
import '../../main.dart';
import 'dart:ui' as ui;

class TheJourneyParentController extends GetxController{
  late CameraPosition initialCameraPosition;
  late LocationServices locationServices ;
  late GoogleMapController googleMapControllerPar;
  RxSet<Marker> markers  =<Marker>{}.obs;
  RxSet<Polyline> polyLines=<Polyline>{}.obs;
  AddAccountForChildrenData  addAccountForChildrenData = AddAccountForChildrenData(Get.find());
  StatusRequest? statusRequest =StatusRequest.none;
  StatusRequest? statusRequestPre =StatusRequest.none;
  List<StudentModel> studentDataList = [];

  @override
  void onInit() {
    locationServices = LocationServices();
    initialCameraPosition =const CameraPosition(target: LatLng(23.75199265380472, 45.39040564386799),zoom: 10);
    // initPolyLines();
    getStudent();
    super.onInit();
  }
  @override
  void dispose() {
    googleMapControllerPar.dispose();
    super.dispose();
  }

  // @override
  // void onReady() {
  //
  //   // markers =<Marker>{}.obs;
  //   super.onReady();
  // }
  getStudent()async{
    studentDataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await addAccountForChildrenData.getChildrenData(
        parentId:int.parse(sharedPreferences.get(Global.parentId).toString()));


    print(" get student data ===========================   controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response["status"]=="1"){
        List responseData = response["data"];
        studentDataList.addAll(responseData.map((e) => StudentModel.fromJson(e)).toList());
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

      var myMarkers = studentDataList.map((placeModel) => Marker(markerId: MarkerId(placeModel.stId.toString(),),
          position: LatLng(placeModel.stLatitude!,placeModel.stLongitude!),icon:
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
    var bitmapDescriptor = await BitmapDescriptor.fromBytes( await getImageFromRowData(image:"assets/images/person.png",width: 70));

    var myMarkers = studentDataList.map((placeModel) => Marker(markerId: MarkerId(placeModel.stId.toString(),),
        position: LatLng(placeModel.stLatitude!,placeModel.stLongitude!),icon:
        bitmapDescriptor )).toSet();
    markers.addAll(myMarkers);


  }
  void initPolyLines() async{

    double? latitudeAllUser = sharedPreferences.getDouble(Global.latitudeAllUser);
    double? longitudeAllUser = sharedPreferences.getDouble(Global.longitudeAllUser);
    var myPolyLine = studentDataList.map((polyLine) => Polyline(startCap: Cap.roundCap,zIndex: 1,
      geodesic: true,width: 5,color: Colors.red,polylineId: PolylineId(polyLine.stId.toString()),points: [

        // LatLng(17.483297737400804, 47.115734297231185),
        LatLng(latitudeAllUser!,longitudeAllUser!),

        LatLng(polyLine.stLatitude!, polyLine.stLongitude!),

        // LatLng(15.365424842221499, 44.23044106462256),
      ],)).toSet();


    polyLines.addAll(myPolyLine);

    update();

  }
}