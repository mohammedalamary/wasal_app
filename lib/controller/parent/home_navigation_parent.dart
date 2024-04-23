import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/view/screen/parents/home_parent_screen.dart';

import '../../view/screen/parents/account/account_parent.dart';
import '../../view/screen/parents/location_parent_update.dart';
import '../../view/screen/parents/notifaction_parent.dart';
class HomeNavigationParentController extends GetxController{

  int currentPage = 1;
  void changeTabIndex(int index) {
    currentPage = index;
    update();
  }


  List<Widget> screen=[
     HomeParentScreen(),
    const LocationUpdateParentView(),
    const ShowNotificationParentView(),
    AccountParentView(),
  ];

  @override
  void onInit() {
    currentPage=0;
    super.onInit();
  }
}