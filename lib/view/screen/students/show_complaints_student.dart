import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/student/show_complaints_student_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/global/custom_icon_appbar.dart';
import '../../widget/global/custom_text.dart';
import '../../widget/global/customadd_account_children.dart';
class ShowComplaintsStudentView extends StatelessWidget {
  ShowComplaintsStudentView({super.key});
  final controller = Get.put(ShowComplaintsStudentController());

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading:const CustomAppBarIcon(),
        title: CustomText(text: "الشكاوئ"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 30,),
          CustomAddAccountChildren(title:  "اضافة شكوئ",onTap: (){
            Get.toNamed(AppRoutes.addComplaintsStudentView);
          },),
          //
          //
          const SizedBox(height: 12,),
          GetBuilder<ShowComplaintsStudentController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: ListView.builder(
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.complaintListData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColor.grey),
                            color: index.isEven?const Color(0xffE2D6E2):Color(0xffC7D6DD)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Align(
                              alignment: Alignment.center,
                              child: CustomText(text: controller.complaintListData[index].comTo==1?"شكوى من طالب  الى مدرسة":
                           "شكوئ من طالب الى سائق"
                              ),
                            ),
                            // SizedBox(height: 10,),
                            // const Divider(color: AppColor.grey,thickness: 1,endIndent: 30,indent: 30),
                            CustomText(text: "محتوى الشكوئ:"),
                            CustomText(text: controller.complaintListData[index].comText),
                            const Divider(color: AppColor.grey,thickness: 1,endIndent: 30,indent: 30),

                            CustomText(text: "الرد على الشكوئ"),
                            controller.complaintListData[index].comReply!.isEmpty?
                            CustomText(text:"لم يتم الرد على الشكوئ بعد...نرجو تحلي الصبر"):
                            CustomText(text: controller.complaintListData[index].comReply.toString()),

                            GetBuilder<ShowComplaintsStudentController>(builder: (controller)=>
                                HandlingDataRequest(statusRequest: controller.statusRequestDeleteCompliant!,widget: Align(alignment: Alignment.topLeft,
                                  child: MaterialButton(shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),onPressed: (){
                                    controller.checkDelete();
                                    controller.complaintId = controller.complaintListData[index].comId!.toInt();
                                    print("compliant id is ${controller.complaintId}");
                                  },color: AppColor.primaryColor, child: CustomText(text: "حدف")),
                                ),)
                            ),

                          ],
                        ),
                      );
                    },)))

          // GetBuilder<AddComplaintsParentController>(builder: (controller)=>HandlingDataRequest(
          //   statusRequest: controller.statusRequest!, widget: CustomButton(onPressed: (){
          //   controller.addComplaint();
          //
          // },text: "ارسال الشكوئ"),)),


        ],
      ),
    );
  }
}
