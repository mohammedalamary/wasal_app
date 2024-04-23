import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screen/driver/home_driver_screen.dart';
import '../../view/screen/driver/location_driver.dart';
import '../../view/screen/driver/profile_driver.dart';
import '../../view/screen/driver/show_notifications_driver.dart';
class NavigationDriverController extends GetxController{
  int currentPage = 1;
  void changeTabIndex(int index) {
    currentPage = index;
    update();
  }
  List<Widget> screen=[
    const HomeDriverScreen(),
    const LocationDriverView(),
     ShowNotificationDriver(),
     ProfileDriverView(),
  ];
  @override
  void onInit() {
    currentPage=0;
    super.onInit();
  }
}