import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screen/students/home_student_view.dart';
import '../../view/screen/students/location_student.dart';
import '../../view/screen/students/notifiction_student.dart';
import '../../view/screen/students/profile_student.dart';
class NavigationStudentController extends GetxController{
  int currentPage = 1;
  void changeTabIndex(int index) {
    currentPage = index;
    update();
  }
  List<Widget> screen=[
    const HomeStudentScreen(),
    const LocationUpdateStudentView(),
     NotificationStudent(),
     ProfileStudent(),
    // const LocationDriverView(),
    // const LocationDriverView(),
    // ProfileDriverView(),
  ];
  @override
  void onInit() {
    currentPage=0;
    super.onInit();
  }
}