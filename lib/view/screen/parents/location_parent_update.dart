import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import 'package:wasl/view/widget/global/custombutton.dart';

import '../../../controller/parent/location_update__parentcontroller.dart';
import '../../../core/constant/color.dart';

class LocationUpdateParentView extends StatelessWidget {
  const LocationUpdateParentView({super.key});

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
                child: CustomText(text: "تحديث الموقع",fontSize: 16,)),
            const SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8),
              child: Align(
                  alignment: Alignment.topRight,
                  child: CustomText(text: "تحديد الموقع بدقة : ",fontSize: 16,)),
            ),
            GetBuilder<LocationUpdateParentController>(init:LocationUpdateParentController() ,builder: (controller)=>
                Container(
                  height: 300,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
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
            
            CustomButton(onPressed: (){

            },text: "حفظ",)

          ],
        ),
      ),
    );
  }
}
