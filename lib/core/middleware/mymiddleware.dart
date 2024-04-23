import 'package:wasl/core/constant/global.dart';
import 'package:wasl/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/main.dart';

class MyMiddleWare extends GetMiddleware {
  // @override
  // int? get priority => 2;
  @override
  RouteSettings? redirect(String? route) {
    if(sharedPreferences.getString(Global.step) == "1"){
      return const RouteSettings(name:AppRoutes.login);
    }
    print("onBoarding  -------------- ${sharedPreferences.getString(Global.step)}");
    //الاولوية لل 2
    if(sharedPreferences.getString(Global.step) == "2"){
      return const RouteSettings(name:AppRoutes.navigationSchool);
    }
    if(sharedPreferences.getString(Global.step) == "3"){
      return const RouteSettings(name:AppRoutes.homeNavigationParent);
    }if(sharedPreferences.getString(Global.step) == "4"){
      return const RouteSettings(name:AppRoutes.homeNavigationDriver);
    }if(sharedPreferences.getString(Global.step) == "5"){
      return const RouteSettings(name:AppRoutes.homeStudentNavigation);
    }


  }
}
