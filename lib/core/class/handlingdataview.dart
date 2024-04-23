import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wasl/core/class/stausrequest.dart';
import 'package:wasl/core/constant/color.dart';
import 'package:wasl/core/constant/imagesasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wasl/core/function/custom_dilaog.dart';

import '../constant/message.dart';
class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({Key? key, required this.statusRequest, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      statusRequest == StatusRequest.loading?
            Center(child:Lottie.asset(AppImageAsset.loading,width: 250,height: 250),):
          statusRequest == StatusRequest.offlineFailure?
           Center(child: Lottie.asset(AppImageAsset.offline,width: 250,height: 250),):
              statusRequest == StatusRequest.serverFailure?
               Center(child: Lottie.asset(AppImageAsset.server,width: 250,height: 250),):
                  statusRequest == StatusRequest.failure?
                       Center(child: Lottie.asset(AppImageAsset.noData,width: 250,height: 250,repeat: true)):widget;
  }
}


class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({Key? key, required this.statusRequest, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      statusRequest == StatusRequest.loading?
      const Center(child:SpinKitFadingCircle(
        color: AppColor.primaryColor,
        // duration00: Duration(seconds: 3),
        size:50,
        // controller: AnimationController(vsync: null, duration: const Duration(milliseconds: 1200)),
      ),):
      // Center(child:Lottie.asset(AppImageAsset.loading,width: 250,height: 100),):
      statusRequest == StatusRequest.offlineFailure?
      Center(child: Lottie.asset(AppImageAsset.offline,width: 250,height: 100),):
      statusRequest == StatusRequest.serverFailure?
      Center(child: Lottie.asset(AppImageAsset.server,width: 250,height: 100),)
          :widget;
  }
}

class HandlingDataRequests{
  final StatusRequest? statusRequest;
  HandlingDataRequests({this.statusRequest});
  request(){
    statusRequest == StatusRequest.loading?
          CustomDialogWidget(message: noInternetFound).dialog():
    statusRequest == StatusRequest.offlineFailure?
    CustomDialogWidget(message: noInternetFound).dialog():
    statusRequest == StatusRequest.serverFailure?
    CustomDialogWidget(message: serverError).dialog():null;


  }
}