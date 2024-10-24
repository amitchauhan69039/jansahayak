import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';
import 'package:flutter/scheduler.dart';

class FarmerPaymentDetailScreen extends StatefulWidget {
  final String sessionID,jFormID;
  const FarmerPaymentDetailScreen({super.key,required this.sessionID,required this.jFormID});

  @override
  State<FarmerPaymentDetailScreen> createState() => _FarmerPaymentDetailScreenState();
}

class _FarmerPaymentDetailScreenState extends State<FarmerPaymentDetailScreen> {
  final FarmerPaymentDetailController controller = Get.put(FarmerPaymentDetailController());

  @override
  void initState() {
    super.initState();
    controller.getFarmerPaymentDetail(widget.sessionID,widget.jFormID);

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: GetBuilder<FarmerPaymentDetailController>(
              id: 'farmer_payment',
              builder: (controller) {
                return StackedLoader(
                    loading: controller.loader,
                    child: Column(
                      children: <Widget>[
                        CommonAppbar(title: 'payment_record'.tr),
                        Expanded(
                          child: SingleChildScrollView(
                              child: StackedLoader(
                                loading: controller.loader,
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: AppPadding.horizontalPadding,
                                        right: AppPadding.horizontalPadding,
                                        bottom: 1.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        appSizedBox(height: 15),

                                        getFarmerPersonalDetailData(),


                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ],
                    ));
              }),
        ));
  }



  Widget getFarmerPersonalDetailData() {
    if(controller.familyRecordModel!.data!.length>0){

      return Container(
        child: Column(
          children: [
            appSizedBox(height: 10),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color:ColorRes.headerBgColor
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'payment_details'.tr,
                    textAlign: TextAlign.start,
                    style: styleW400S15.copyWith(
                        fontSize: 15, color: ColorRes.white,wordSpacing:0.1),
                  ),
                ),

              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                color: ColorRes.white,
              ),

              child: Container(
                child: Row(
                  children: [
                    appSizedBox(width: 10),

                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appSizedBox(height: 10),
                            Text(
                              textAlign: TextAlign.start,
                              'jform_id'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 10,
                                  color: ColorRes.lightTextColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.start,
                              controller.farmerPaymentDetailModel!.data![0].JFormID!.toString(),
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.black,
                                  height: 1),
                            ),

                            appSizedBox(height: 15),
                            Text(
                              textAlign: TextAlign.start,
                              'DEVIATION WEIGHT (IN QTL.)'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 10,
                                  color: ColorRes.lightTextColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.start,
                              controller.farmerPaymentDetailModel!.data![0].JFormWeightDeviation!.toString(),
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.black,
                                  height: 1),
                            ),
                            appSizedBox(height: 15),


                            Text(
                              textAlign: TextAlign.start,
                              'Bank Name'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 10,
                                  color: ColorRes.lightTextColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.start,
                              controller.farmerPaymentDetailModel!.data![0].BankName!.toString(),
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.black,
                                  height: 1),
                            ),
                            appSizedBox(height: 15),


                            Text(
                              textAlign: TextAlign.start,
                              'payment_initiating_bank'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 10,
                                  color: ColorRes.lightTextColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.start,
                              controller.farmerPaymentDetailModel!.data![0].BankName!.toString(),
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.black,
                                  height: 1),
                            ),
                            appSizedBox(height: 15),

                            Text(
                              textAlign: TextAlign.start,
                              'transaction_date'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 10,
                                  color: ColorRes.lightTextColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.start,
                              controller.farmerPaymentDetailModel!.data![0].TransactionDate!.toString(),
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.black,
                                  height: 1),
                            ),
                            appSizedBox(height: 15),


                            Visibility(
                              visible: controller.status=="Failed" ? true :
                              controller.status=="Bank" ? true :false,
                                child:Column(
                                  children: [
                                    Text(
                                      textAlign: TextAlign.start,
                                      'Failure Reason'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 10,
                                          color: ColorRes.lightTextColor,
                                          height: 1),
                                    ),
                                    appSizedBox(height: 5),
                                    Text(
                                      textAlign: TextAlign.start,
                                      controller.farmerPaymentDetailModel!.data![0].Reason!.toString(),
                                      style: styleW400S14.copyWith(
                                          fontSize: 14,
                                          color: ColorRes.black,
                                          height: 1),
                                    ),
                                    appSizedBox(height: 15),
                                  ],
                                )
                            ),




                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appSizedBox(height: 10),
                            Text(
                              textAlign: TextAlign.start,
                              'created_date'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 10,
                                  color: ColorRes.lightTextColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.start,
                              controller.farmerPaymentDetailModel!.data![0].JFormCreatedDate!.toString(),
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.black,
                                  height: 1),
                            ),



                            appSizedBox(height: 15),
                            Text(
                              textAlign: TextAlign.center,
                              'INCIDENTAL CHARGES (IN )'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 10,
                                  color: ColorRes.lightTextColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.center,
                              controller.farmerPaymentDetailModel!.data![0].JFormIncidentalCharges!.toString(),
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.black,
                                  height: 1),
                            ),
                            appSizedBox(height: 15),


                            Text(
                              textAlign: TextAlign.center,
                              'JForm NetAmount Payable'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 10,
                                  color: ColorRes.lightTextColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.center,
                              controller.farmerPaymentDetailModel!.data![0].JFormNetAmountPayable!.toString(),
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.black,
                                  height: 1),
                            ),
                            appSizedBox(height: 15),


                            Text(
                              textAlign: TextAlign.center,
                              'bank_ref_no'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 10,
                                  color: ColorRes.lightTextColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.center,
                              controller.farmerPaymentDetailModel!.data![0].BankRefNo!.toString(),
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.black,
                                  height: 1),
                            ),
                            appSizedBox(height: 15),



                            Text(
                              textAlign: TextAlign.center,
                              'payment_status'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 10,
                                  color: ColorRes.lightTextColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.center,
                              controller.farmerPaymentDetailModel!.data![0].PaymentStatus!.toString(),
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: controller.status=="Failed" ? ColorRes.highRedColor :
                                  controller.status=="Bank" ?  ColorRes.highRedColor : ColorRes.highTealColor,
                                  height: 1),
                            ),
                            appSizedBox(height: 15),



                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    else{
      return Container();
    }


  }
}
