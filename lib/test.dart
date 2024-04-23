import 'package:wasl/controller/test_controller.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test widget"),
          centerTitle: true,
        ),
        body: GetBuilder<TestController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest!,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(controller.data.toString()),
                  );
                }),
          ),
        ));
  }
}
