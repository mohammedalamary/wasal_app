import 'package:wasl/controller/test_controller.dart';
import 'package:wasl/core/class/stausrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/controller/test_controller.dart';
import 'package:wasl/core/class/stausrequest.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
        centerTitle: true,
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.statusRequest == StatusRequest.offlineFailure) {
            return const Center(
              child: Text("no internet"),
            );
          } else if (controller.statusRequest == StatusRequest.serverFailure) {
            return const Center(
              child: Text("server  error"),
            );
          } else if (controller.statusRequest == StatusRequest.failure) {
            return const Center(
              child: Text("No Data fount. "),
            );
          } else {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Text("${controller.data.toString()}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
