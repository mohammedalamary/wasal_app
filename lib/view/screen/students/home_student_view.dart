import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasl/view/widget/global/custom_user_info.dart';
import '../../../controller/student/home_student_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/global.dart';
import '../../../core/constant/routes.dart';
import '../../../main.dart';
import '../../widget/global/custom_text.dart';
import '../../widget/school/homecard.dart';
import 'notifiction_student.dart';

class HomeStudentScreen extends StatelessWidget {
  const HomeStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
        ),
        body: ListView(children: [
          const SizedBox(height: 14,),
          CustomUserInfo(userName: sharedPreferences.getString(Global.studentName), typeUser:sharedPreferences.getString(Global.typeUser)),
          const SizedBox(height: 16,),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                // reverse: true, // التصميم يرجع من الاسفل
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
                      Get.toNamed(AppRoutes.attendanceStudentView);
                    },
                  ),
                     HomeCardWidget(
                    backgroundColor: 0xffE6CEAC,
                    title: "معلومات سائق",
                    textColor: 0xffE6CEAC,
                    onTap: (){
                      Get.toNamed(AppRoutes.driverInformationForTheStudent);
                    },
                  ),
                  HomeCardWidget(
                    backgroundColor: 0xffFFFBA4,
                    title: " الشكاوئ",
                    textColor: 0xffD1F0DD,
                    onTap: (){
                      Get.toNamed(AppRoutes.showComplaintsStudentView);
                    },
                  ),

                   HomeCardWidget(
                    backgroundColor: 0xffB7F0FF,
                    title: "الاشعارات",
                    textColor: 0xffD1F0DD,
                    onTap: (){
                      Get.to(const NotificationStudent());
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 260,
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
                  child: GetBuilder<HomeStudentController>(init: HomeStudentController(),builder: (controller)=>
                      GoogleMap(
                          zoomControlsEnabled: false,
                          markers:controller.markers.value,
                          onMapCreated: (myController){
                            controller.googleMapController=myController;
                            controller.updateCurrentLocation();
                          },initialCameraPosition: controller.initialCameraPosition),

                  ),
                ),

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
                    // Get.to(const TheJourneyDriverScreen());
                    Get.toNamed(AppRoutes.theJourneyStudentScreen);
                  }, child:  CustomText(text: "الرحلة",)),
                )

              ],
            ),
          ),
        ],)
    );
  }
}
