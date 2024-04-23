import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/constant/color.dart';
import '../../../../controller/driver/navigation_driver.dart';
import '../../../../controller/student/navigation_student_controller.dart';
class HomeStudentNavigation extends StatelessWidget {
  const HomeStudentNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationStudentController>(
        init: NavigationStudentController(),
        builder: (controller) => Scaffold(
            body: controller.screen.elementAt(controller.currentPage),
            bottomNavigationBar: GetBuilder<NavigationStudentController>(
              builder: (controller) => CurvedNavigationBar(
                index: controller.currentPage,
                color: AppColor.primaryColor,
                buttonBackgroundColor: AppColor.primaryColor,
                backgroundColor: AppColor.white,
                // letIndexChange: (controller.currentPage)=>true,
                items: const <Widget>[
                  Icon(
                    Icons.home,
                    size: 30,
                  ),
                  Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                  Icon(
                    Icons.notification_important_outlined,
                    size: 30,
                  ),
                  Icon(
                    Icons.person_rounded,
                    size: 30,
                  ),
                  // Icon(Icons.compare_arrows, size: 30, color: (pressedButtonNo = 2)? Colors.Green : Colors.Black,),
                ],
                onTap: (index) {
                  controller.currentPage = index;
                  controller.changeTabIndex(index);
                  print("------------ index ${controller.currentPage}");
                  print("------------ index ${index}");
                },
              ),
            )));
  }

  Widget buildDrawarTitle({String? title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title ?? "",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Divider(
          endIndent: 12,
          thickness: 1,
          color: Colors.black,
        )
      ],
    );
  }
}
