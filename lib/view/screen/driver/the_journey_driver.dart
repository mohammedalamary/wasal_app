import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import '../../../controller/driver/the_journey_driver_controller.dart';
import '../../../controller/parent/the_journey_parent_controller.dart';

class TheJourneyDriverScreen extends StatelessWidget {
  const TheJourneyDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                GetBuilder<TheJourneyDriverController>(init: TheJourneyDriverController(),builder: (controller)=>
                HandlingDataView(statusRequest: controller.statusRequest!, widget:GoogleMap(
                    markers:controller.markers.value,
                    polylines: controller.polyLines,
                    onMapCreated: (myController){

                      controller.googleMapControllerPar=myController;
                      controller.updateCurrentLocation();
                      controller.initPolyLines();
                      // controller.initMarker();
                    },initialCameraPosition: controller.initialCameraPosition),
                ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
