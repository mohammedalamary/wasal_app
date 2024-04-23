import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/schools/account_school.dart';
import '../../view/screen/schools/home_page_school.dart';
import '../../view/screen/schools/school_location.dart';
import '../../view/screen/schools/show_notification_school.dart';

class HomeNavigationSchool extends GetxController{

  int currentPage = 1;
  void changeTabIndex(int index) {
    currentPage = index;
    update();
  }


List<Widget> screen=[

  const HomePageSchool(),
  const SchoolNotificationsView(),
     ShowNotificationSchool(),
   AccountSchool(),

];

  @override
  void onInit() {
    currentPage=0;
    super.onInit();
  }
}