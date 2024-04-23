import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/color.dart';
import '../../../controller/parent/home_navigation_parent.dart';
class HomeNavigationParent extends StatelessWidget {
  HomeNavigationParent({super.key});
  final controller = Get.put(HomeNavigationParentController());
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeNavigationParentController>(init: HomeNavigationParentController(),builder: (controller)=>
        Scaffold(
            body: controller.screen.elementAt(controller.currentPage),

            bottomNavigationBar:GetBuilder<HomeNavigationParentController>(builder: ( controller) =>



                CurvedNavigationBar(
                  index: controller.currentPage,
                  color: AppColor.primaryColor,
                  buttonBackgroundColor: AppColor.primaryColor,
                  backgroundColor: AppColor.white,
                  // letIndexChange: (controller.currentPage)=>true,
                  items:  const <Widget>[
                    Icon(Icons.home, size: 30, ),
                    Icon(Icons.location_on, size: 30,),
                    Icon(Icons.notification_important_outlined, size: 30, ),
                    Icon(Icons.person_rounded, size: 30, ),
                    // Icon(Icons.compare_arrows, size: 30, color: (pressedButtonNo = 2)? Colors.Green : Colors.Black,),
                  ],
                  onTap: (index) {
                    controller.currentPage =index ;
                    controller.changeTabIndex(index);
                    print("------------ index ${ controller.currentPage }");
                    print("------------ index ${index }");
                  },
                ),)
        )

    );




  }


}
