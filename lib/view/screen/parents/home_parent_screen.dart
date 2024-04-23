import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasl/view/screen/parents/profile_parent.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import '../../../controller/parent/home_parent_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/global.dart';
import '../../../core/constant/routes.dart';
import '../../../main.dart';
import '../../widget/global/custom_user_info.dart';
import '../../widget/school/homecard.dart';

class HomeParentScreen extends StatelessWidget {
   HomeParentScreen({super.key});
final controller = Get.put(HomeParentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
        ),
        // القائمة الجانبية للمدرسة
        drawer: const Drawer(
          backgroundColor: AppColor.primaryColor,
          child:ProfileParent(),
        ),
        body: Column(
          children: [
          const SizedBox(height: 14,),
          CustomUserInfo(userName: sharedPreferences.getString(Global.parentName),
              typeUser:sharedPreferences.getString(Global.typeUser)),
          // CustomText(text: sharedPreferences.getString(Global.latitudeAllUser.toString())),
          const SizedBox(height: 16,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 130, // الارتفاع
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 16
                ),
                children:  [
                  HomeCardWidget(
                    backgroundColor: 0xffCBE2CE,
                    title: "الحضور والغياب",
                    textColor: 0xffD1F0DD,
                    onTap: (){
                      Get.toNamed(AppRoutes.attendanceAndDepartureParent);

                    },
                  ),
                  HomeCardWidget(
                    backgroundColor: 0xffE6CEAC,
                    title: "قائمة الابناء والطلبات",
                    textColor: 0xffE6CEAC,
                    onTap: (){
                      print("-------------------- j");
                      Get.toNamed(AppRoutes.listOfPotsAndOrdersParentView);
                    },
                  ),
                  HomeCardWidget(
                    backgroundColor: 0xffFFFBA4,
                    title: " الشكاوئ",
                    textColor: 0xffD1F0DD,
                    onTap: (){
                      Get.toNamed(AppRoutes.showComplaintsParentView);
                    },
                  ),

                  HomeCardWidget(
                    backgroundColor: 0xffB7F0FF,
                    title: "اضافة حساب للابناء",
                    textColor: 0xffD1F0DD,
                    onTap: (){
                      Get.toNamed(AppRoutes.addAccountForChildrenParent);
                    },
                  ),
                ],
              ),
            ),
          ),


          const SizedBox(height: 16,),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 100,
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(22)),
                // color: Colors.blue
                border: Border.all(color: AppColor.grey,)
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                    child: GetBuilder<HomeParentController>(builder: (controller)=>
                        GoogleMap(
                          zoomControlsEnabled: false,
                            markers:controller.markers.value,
                            onMapCreated: (myController){
                              controller.googleMapController=myController;
                              controller.updateCurrentLocation();
                            },initialCameraPosition: controller.initialCameraPosition),

                    ),
                  ),

                  GetBuilder<HomeParentController>(builder: (contr)=>
                      Positioned(
                        bottom: -7,
                        left: 0,
                        right: 0,
                        child:ElevatedButton(style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: AppColor.grey),

                            shape: const
                            RoundedRectangleBorder(borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)))
                        ),onPressed: (){
                          // contr.updateCurrentLocation();
                          Get.toNamed(AppRoutes.theJourneyParentView);

                          // تغيير الموقع
                          // CameraPosition newLocation = const CameraPosition(target: LatLng(14.953163766403886, 44.25096173694774));
                          // googleMapController.animateCamera(CameraUpdate.newCameraPosition(newLocation,));


                        }, child:  CustomText(text: "الرحلة",)),
                      )
                  ),

                ],
              ),
            ),
          ),
            const SizedBox(height: 16,),

        ],)
    );
  }
}
