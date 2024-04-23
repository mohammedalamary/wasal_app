import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/color.dart';
import 'package:wasl/core/constant/global.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:wasl/main.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../../controller/school/home_navigation_school.dart';
import '../../../widget/school/custombuildcontainer.dart';
import '../../../widget/school/homecard.dart';
import '../profile_school.dart';

class NavigationSchool extends StatelessWidget {
   NavigationSchool({super.key});
final controller = Get.put(HomeNavigationSchool());
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeNavigationSchool>(init: HomeNavigationSchool(),builder: (controller)=>
        Scaffold(
          body: controller.screen.elementAt(controller.currentPage),


          bottomNavigationBar:GetBuilder<HomeNavigationSchool>(builder: ( controller) =>



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
