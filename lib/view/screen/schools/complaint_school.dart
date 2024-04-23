import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/core/class/handlingdataview.dart';
import 'package:wasl/view/widget/auth/customtextformauth.dart';
import 'package:wasl/view/widget/global/custom_text.dart';
import '../../../controller/school/complaint_school_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/validinput.dart';

class ComplaintSchoolView extends StatelessWidget {
  ComplaintSchoolView({super.key});

  final controller = Get.put(ComplaintSchoolController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 26,
              ),
              color: AppColor.primaryColor),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "عرض الشكاوى ",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 30,
          ),
          GetBuilder<ComplaintSchoolController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: ListView.builder(
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.complaintData.length,
                    itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        if(controller.detailsIndex.value==index){
                          controller.showDetails.toggle();
                          controller.detailsIndex.value=index;
                        }else{
                          controller.showDetails.value=true;
                          controller.detailsIndex.value=index;
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColor.grey),
                        ),
                        child: Column(

                          children: [

                            CustomText(text: controller.complaintData[index].comFrom==1?"شكوى من ولي امر الى مدرسة":
                            controller.complaintData[index].comFrom==2?"شكوى من سائق الى المدرسة":"شكوئ من طالب الى المدرسة"
                            ),
                            // SizedBox(height: 10,),
                            const Divider(color: AppColor.grey,thickness: 1,endIndent: 30,indent: 30),
                            CustomText(text: controller.complaintData[index].nameComplaint??""),

                            Align(
                                alignment: Alignment.topRight,
                                child: CustomText(text: "محتوى الشكوئ:")),
                            CustomText(text: controller.complaintData[index].comText),

                            Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: AppColor.greyLess,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: CustomText(text: "الرد على الشكوئ"))),


                            Obx(() => controller.showDetails.value&&controller.detailsIndex.value==index?Container(

                              color: Colors.grey.shade200,
                              child: Form(
                                key: controller.formState,
                                child: Column(
                                  children:  [
                                    CustomTextFormField(
                                      controller: controller.replyComplaintController,
                                      labelText: "الرد على الشكوئ",
                                      hintText: "اكتب الرد هناء",
                                      maxLines: 5,
                                      validator: (val){
                                        return validateInput(min: 6,max: 100,val:val);
                                      },
                                    ),

                                    // CustomTextFormField(),

                                    GetBuilder<ComplaintSchoolController>(builder: (controller)=>
                                        HandlingDataRequest(statusRequest: controller.statusRequestReplay!,widget: Align(alignment: Alignment.topLeft,
                                      child: MaterialButton(shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),onPressed: (){
                                        controller.replayComplaint(complaintId: controller.complaintData[index].comId);
                                      },color: AppColor.primaryColor, child: CustomText(text: "ارسال")),
                                    ),)
                                    ),


                                  ],
                                ),
                              ),
                            ):const SizedBox()),

                          ],
                        ),
                      ),
                    );
                  },)))
        ],
      ),
    );
  }
}
