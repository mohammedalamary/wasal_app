import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/parent/the_journey_parent_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/global/custom_text.dart';

class TheJourneyParentView extends StatelessWidget {
  TheJourneyParentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                GetBuilder<TheJourneyParentController>(init:TheJourneyParentController() ,builder: (controller)=>
                GoogleMap(
                  zoomControlsEnabled: false,
                    markers:controller.markers.value,
                    polylines: controller.polyLines.value,
                    onMapCreated: (myController){
                      controller.googleMapControllerPar=myController;
                      controller.updateCurrentLocation();
                      controller.initPolyLines();
                    },initialCameraPosition: controller.initialCameraPosition),

                ),
                Positioned(
                  top: 62,
                  left: 16,
                  right: 16,
                  child:ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side:   const BorderSide(color: AppColor.grey),
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
