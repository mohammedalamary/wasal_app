import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../controller/school/school_location_controller.dart';
import '../../../core/constant/color.dart';
class SchoolNotificationsView extends StatelessWidget {
  const SchoolNotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return          SafeArea(

      child: Scaffold(

        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const SizedBox(height: 32,),
            Align(
                alignment: Alignment.center,
                child: CustomText(text: "موقع المدرسة",fontSize: 16,)),

            const SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8),
              child: Align(
                  alignment: Alignment.topRight,
                  child: CustomText(text: " تحديد موقع المدرسة بدقة : ",fontSize: 12,)),
            ),
            GetBuilder<SchoolLocationController>(init:SchoolLocationController() ,builder: (controller)=>
                SizedBox(
                  height: 400,
                  // padding: EdgeInsets.all(12),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                    height: 100,
                    decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(22)),
                        // color: Colors.blue
                        border: Border.all(color: AppColor.grey,)
                    ),

                    child: GoogleMap(
                        zoomControlsEnabled: false,
                        markers:controller.markers.value,
                        // polylines: controller.polyLines.value,
                        onMapCreated: (myController){
                          controller.googleMapController=myController;
                          controller.updateCurrentLocation();
                        },initialCameraPosition: controller.initialCameraPosition),
                  ),
                )),

            const SizedBox(height: 16,),


          ],
        ),
      ),
    );
  }
}
