import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/visitors.dart';
import 'package:flutter/scheduler.dart';

class FamilyFamerScreen extends StatefulWidget {
  const FamilyFamerScreen({super.key});

  @override
  State<FamilyFamerScreen> createState() => _FamilyFamerScreenState();
}

class _FamilyFamerScreenState extends State<FamilyFamerScreen> {
  final FamilyFarmerController controller = Get.put(FamilyFarmerController());

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: GetBuilder<FamilyFarmerController>(
              id: 'family_farmer',
              builder: (controller) {
                return StackedLoader(
                    loading: controller.loader,
                    child: Column(
                      children: <Widget>[
                        CommonAppbar(title: 'farmer_record'.tr),
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
                                        Text(
                                          'Select Session *'.tr,
                                          textAlign: TextAlign.start,
                                          style: styleW400S15.copyWith(
                                              fontSize: 16, color: ColorRes.black),
                                        ),

                                        appSizedBox(height: 5),
                                        Container(
                                          child: getDropdown()
                                        ),
                                        appSizedBox(height: 15),
                                        AppButton(
                                          onButtonTap: (){
                                            controller.getRecords();
                                          },
                                          buttonName: 'find_record'.tr,
                                          textColor:ColorRes.white,
                                          backgroundColor:ColorRes.activatedButtonColor,
                                        ),


                                        appSizedBox(height: 15),
                                        Container(
                                          child: Column(
                                            children: [
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
                                                      'List of Members Registered with MFMB'.tr,
                                                      textAlign: TextAlign.start,
                                                      style: styleW400S15.copyWith(
                                                          fontSize: 15, color: ColorRes.white,wordSpacing:0.1),
                                                    ),
                                                  ),

                                                ),
                                              ),

                                              getMFMBData(),

                                            ],
                                          ),
                                        ),


                                        appSizedBox(height: 10),
                                        Container(
                                          child: Column(
                                            children: [
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
                                                      'farmer_personal_details'.tr,
                                                      textAlign: TextAlign.start,
                                                      style: styleW400S15.copyWith(
                                                          fontSize: 15, color: ColorRes.white,wordSpacing:0.1),
                                                    ),
                                                  ),

                                                ),
                                              ),

                                              getFarmerPersonalDetailData(),

                                            ],
                                          ),
                                        ),


                                        appSizedBox(height: 10),
                                        Container(
                                          child: Column(
                                            children: [
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
                                                      'Farmer Produce Details'.tr,
                                                      textAlign: TextAlign.start,
                                                      style: styleW400S15.copyWith(
                                                          fontSize: 15, color: ColorRes.white,wordSpacing:0.1),
                                                    ),
                                                  ),

                                                ),
                                              ),

                                              getFarmerProducedData(),

                                            ],
                                          ),
                                        ),


                                        appSizedBox(height: 10),
                                        Container(
                                          child: Column(
                                            children: [
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
                                                      'Gate Pass Details'.tr,
                                                      textAlign: TextAlign.start,
                                                      style: styleW400S15.copyWith(
                                                          fontSize: 15, color: ColorRes.white,wordSpacing:0.1),
                                                    ),
                                                  ),

                                                ),
                                              ),

                                              getPassDetailData(),

                                            ],
                                          ),
                                        ),



                                        appSizedBox(height: 10),
                                        Container(
                                          child: Column(
                                            children: [
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
                                                      'JForms Details'.tr,
                                                      textAlign: TextAlign.start,
                                                      style: styleW400S15.copyWith(
                                                          fontSize: 15, color: ColorRes.white,wordSpacing:0.1),
                                                    ),
                                                  ),

                                                ),
                                              ),

                                              getPJFormDetailData(),

                                            ],
                                          ),
                                        ),

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

  Widget getDropdown() {
    String getLanguage=PrefService.getString(PrefKeys.selectedLanguage);
    if ( controller.familyFarmerModel != null) {

      if (controller.familyFarmerModel!.data != null) {

        return  Container(
          height: 45,
          width: Get.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorRes.greyColor),
            color: ColorRes.greyColor.withOpacity(0.27),
          ),
          child: DropdownButton(
            value: controller.yearController.text.toString(),
            underline: const SizedBox(),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: ColorRes.appBlackColor,
            ),
            items: controller.familyFarmerModel!.data!.map((items) {
              return DropdownMenuItem(
                value: items.value,
                child: Text(
                  items.text!,
                  style: styleW400S15.copyWith(
                      fontSize: 14, color: ColorRes.black),
                ),
              );
            }).toList(),
            dropdownColor: ColorRes.greyColor,
            borderRadius: BorderRadius.circular(10),
            isExpanded: true,
            isDense: true,
            onChanged: (Object? value) {
              setState(() {
                controller.yearController.text=value.toString();
              });
            },
          ),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  Widget getMFMBData() {
    String getLanguage=PrefService.getString(PrefKeys.selectedLanguage);
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2 ,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: ColorRes.white,
                ),

                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 35,
                        height: 110,
                        decoration: BoxDecoration(
                            color:ColorRes.tealTransColor
                        ),
                      ),
                      appSizedBox(width: 10),

                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appSizedBox(height: 15),
                              Text(
                                textAlign: TextAlign.start,
                                'farmer_id'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1),
                              ),

                              appSizedBox(height: 15),
                              Text(
                                textAlign: TextAlign.start,
                                'farmer_mobile'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                              appSizedBox(height: 15),

                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appSizedBox(height: 15),
                              Text(
                                textAlign: TextAlign.center,
                                'farmer_name'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.center,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
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
            ),
          );

        });
    // if ( controller.familyRecordModel != null) {
    //
    //   if (controller.data!.oCategory != null) {
    //
    //
    //   } else {
    //     return Container();
    //   }
    // } else {
    //   return Container();
    // }
  }

  Widget getFarmerProducedData() {
    String getLanguage=PrefService.getString(PrefKeys.selectedLanguage);
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2 ,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: ColorRes.white,
                ),

                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        height: 110,
                        decoration: BoxDecoration(
                            color:ColorRes.tealTransColor
                        ),
                      ),
                      appSizedBox(width: 10),

                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appSizedBox(height: 15),
                              Text(
                                textAlign: TextAlign.start,
                                'commodity_name'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1),
                              ),

                              appSizedBox(height: 15),
                              Text(
                                textAlign: TextAlign.start,
                                'produce_recived_date'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                              appSizedBox(height: 15),

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
                              appSizedBox(height: 15),
                              Text(
                                textAlign: TextAlign.center,
                                'commodity_variety_name'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.center,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1),
                              ),

                              appSizedBox(height: 15),
                              Text(
                                textAlign: TextAlign.center,
                                'quantity'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.center,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
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
            ),
          );

        });
    // if ( controller.familyRecordModel != null) {
    //
    //   if (controller.data!.oCategory != null) {
    //
    //
    //   } else {
    //     return Container();
    //   }
    // } else {
    //   return Container();
    // }
  }

  Widget getFarmerPersonalDetailData() {
    String getLanguage=PrefService.getString(PrefKeys.selectedLanguage);
    return Container(
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
                      'farmer_s_id'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 10,
                          color: ColorRes.lightTextColor,
                          height: 1),
                    ),
                    appSizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.start,
                      '---'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 14,
                          color: ColorRes.black,
                          height: 1),
                    ),

                    appSizedBox(height: 15),
                    Text(
                      textAlign: TextAlign.start,
                      'farmer_name'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 10,
                          color: ColorRes.lightTextColor,
                          height: 1),
                    ),
                    appSizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.start,
                      '---'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 14,
                          color: ColorRes.black,
                          height: 1),
                    ),
                    appSizedBox(height: 15),


                    Text(
                      textAlign: TextAlign.start,
                      'account_no'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 10,
                          color: ColorRes.lightTextColor,
                          height: 1),
                    ),
                    appSizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.start,
                      '---'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 14,
                          color: ColorRes.black,
                          height: 1),
                    ),
                    appSizedBox(height: 15),


                    Text(
                      textAlign: TextAlign.start,
                      'account_status'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 10,
                          color: ColorRes.lightTextColor,
                          height: 1),
                    ),
                    appSizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.start,
                      '---'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 14,
                          color: ColorRes.black,
                          height: 1),
                    ),
                    appSizedBox(height: 15),


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
                      textAlign: TextAlign.center,
                      'mobile_no'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 10,
                          color: ColorRes.lightTextColor,
                          height: 1),
                    ),
                    appSizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.center,
                      '---'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 14,
                          color: ColorRes.black,
                          height: 1),
                    ),

                    appSizedBox(height: 15),
                    Text(
                      textAlign: TextAlign.center,
                      'father_name'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 10,
                          color: ColorRes.lightTextColor,
                          height: 1),
                    ),
                    appSizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.center,
                      '---'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 14,
                          color: ColorRes.black,
                          height: 1),
                    ),
                    appSizedBox(height: 15),


                    Text(
                      textAlign: TextAlign.center,
                      'ifsc_code'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 10,
                          color: ColorRes.lightTextColor,
                          height: 1),
                    ),
                    appSizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.center,
                      '---'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 14,
                          color: ColorRes.black,
                          height: 1),
                    ),
                    appSizedBox(height: 15),


                    Text(
                      textAlign: TextAlign.center,
                      'a_cupdated_on_mfmb'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 10,
                          color: ColorRes.lightTextColor,
                          height: 1),
                    ),
                    appSizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.center,
                      '---'.tr,
                      style: styleW400S14.copyWith(
                          fontSize: 14,
                          color: ColorRes.black,
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
    );

  }

  Widget getPassDetailData() {
    String getLanguage=PrefService.getString(PrefKeys.selectedLanguage);
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2 ,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  color: ColorRes.white,
                ),

                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'agency_name'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 12,
                                    color: ColorRes.black,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 13,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),
                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'mandi_name'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 12,
                                    color: ColorRes.black,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 13,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),

                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'gatepass_id'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 13,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),

                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'gatepass_date'.tr,
                                style: styleW400S14.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 13,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),

                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'gatepass_lott_no'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 13,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),


                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'actual_weight_gatepass_weight_in_qtl'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 13,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),


                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'devation_weight_in_qtl'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 13,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),


                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'auction_recorder_id'.tr,
                                style: styleW400S14.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 13,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),

                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'auction_date'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 13,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),


                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'arthiya_firm_name'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '---'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 13,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  )
                ),
              ),
            ),
          );

        });

  }

  Widget getPJFormDetailData() {
    String getLanguage=PrefService.getString(PrefKeys.selectedLanguage);
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2 ,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  color: ColorRes.white,
                ),

                child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'iform_id'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      color: ColorRes.black,
                                      fontWeight: FontWeight.w500,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),
                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'jform_id'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      color: ColorRes.black,
                                      fontWeight: FontWeight.w500,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),

                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'ready_to_lift'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),

                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'ifted_date'.tr,
                                  style: styleW400S14.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),

                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'egatepass_id'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),


                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'egatepass_DT'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),


                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'dm_ms_apporval_date'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),


                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'is_file_generated'.tr,
                                  style: styleW400S14.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),

                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'generated_date'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),

                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'generated_file_no'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),


                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'total_amount'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),


                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  'payable_amount'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child:  Text(
                                  textAlign: TextAlign.start,
                                  '---'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.fontLightColor,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),


                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Expanded(
                                flex: 1,
                                child:  Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color:ColorRes.downloadBgColor,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Image.asset(
                                    AssetRes.ic_baseline_download,
                                    width: 20,
                                    height: 20,),
                                      appSizedBox(width: 10),
                                      Text(
                                        textAlign: TextAlign.start,
                                        'download_jform'.tr,
                                        overflow: TextOverflow.ellipsis,
                                        style: styleW400S14.copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                            color: ColorRes.white,
                                            height: 1),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              appSizedBox(width: 10),
                              Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    color:ColorRes.headerBgColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetRes.ic_payments,
                                      width: 20,
                                      height: 20,),
                                    appSizedBox(width: 10),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      'view_payment_details'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: ColorRes.white,
                                          height: 1),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    )
                ),
              ),
            ),
          );

        });

  }
}
