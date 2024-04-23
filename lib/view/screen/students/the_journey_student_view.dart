import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import '../../../controller/student/the_journey_student.dart';
import '../../../core/constant/color.dart';
import '../../widget/global/custom_text.dart';

class TheJourneyStudentScreen extends StatelessWidget {
  const TheJourneyStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [

                GetBuilder<StudentTheJourneyController>(
                  init: StudentTheJourneyController(),
                  builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest!,
                    widget: GoogleMap(
                      zoomControlsEnabled: false,
                        markers: controller.markers.value,
                        polylines: controller.polyLines,
                        onMapCreated: (myController) {
                          controller.googleMapControllerPar = myController;
                          controller.updateCurrentLocation();
                          controller.initPolyLines();
                          // controller.initMarker();
                        },
                        initialCameraPosition:
                            controller.initialCameraPosition),
                  ),
                ),
                Positioned(
                  top: 62,
                  left: 16,
                  right: 16,
                  child:ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side:  const BorderSide(color: AppColor.grey),
                      shape: const

                      RoundedRectangleBorder(borderRadius:
                      BorderRadius.all(Radius.circular(12)))
                  ),onPressed: (){
                  }, child:  CustomText(text: "الرحلة",),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
