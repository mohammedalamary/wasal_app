import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasl/view/widget/auth/customtextformauth.dart';
import 'package:wasl/view/widget/global/custom_icon_appbar.dart';
import 'package:wasl/view/widget/global/custom_text.dart';

import '../../../controller/driver/complaints_show_driver_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/validinput.dart';
import '../../widget/global/customadd_account_children.dart';

class ComplaintsShowDriver extends StatelessWidget {
   ComplaintsShowDriver({super.key});
  final controller = Get.put(ComplaintShowDriverController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        // iconTheme: const IconThemeData(color: Colors.black, size: 32),
        title: CustomText(text: "عرض الشكوئ "),
        // centerTitle: true,
        leading: const CustomAppBarIcon(),
      ),
      body: ListView(
        shrinkWrap: true,
        // physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 32,),
          CustomAddAccountChildren(title:  "اضافة شكوئ",onTap: (){
            Get.toNamed(AppRoutes.addComplaintsDriverView);
          },),
          const SizedBox(height: 12,),

          GetBuilder<ComplaintShowDriverController>(builder: (controller)=>
          HandlingDataView(statusRequest: controller.statusRequest!,
              widget: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.complaintDriverList.length,itemBuilder: (BuildContext context, int index) {
              return  GestureDetector(
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
                        CustomText(text:controller.complaintDriverList[index].comFrom==1? "شكوئ من ولي امر الى سائق":
                        controller.complaintDriverList[index].comFrom==2?"شكوئ من سائق الى مدرسة":"شكوئ من طالب الى سائق"
                        ),
                        // SizedBox(height: 10,),
                        const Divider(color: AppColor.grey,thickness: 1,endIndent: 30,indent: 30),
                        CustomText(text:controller.complaintDriverList[index].nameComplaint),

                        Align(
                            alignment: Alignment.topRight,
                            child: CustomText(text: "محتوى الشكوئ:")),

                        CustomText(text: controller.complaintDriverList[index].comText),
                        // const Divider(color: AppColor.grey,thickness: 1,endIndent: 30,indent: 30),
                        const SizedBox(height: 8,),

                        Align(
                            alignment: Alignment.topRight,
                            child: CustomText(text: " الرد على الشكوى",textColor: AppColor.primaryColor,)),
                    Align(
                      alignment: Alignment.topRight,child: CustomText(text: controller.complaintDriverList[index].comReply??"لم يتم الرد حتا الان")),

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

                                GetBuilder<ComplaintShowDriverController>(builder: (controller)=>
                                    HandlingDataRequest(statusRequest: controller.statusRequestReplay!,widget: Align(alignment: Alignment.topLeft,
                                      child: MaterialButton(shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),onPressed: (){
                                        controller.replayComplaint(complaintId: controller.complaintDriverList[index].comId);
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

              },)),
          ),

        ],
      ),
    );

  }
}
