import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';

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
                return Column(
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
                                    Visibility(
                                      visible: controller.isMainVisible,
                                      child: Container(
                                        child: Column(
                                          children: [

                                            getFarmerPersonalDetailData(),

                                            getFarmerProducedData(),


                                            getGatePassDetailData(),



                                            getGatePassDetailData(),

                                          ],
                                        ),
                                      ),
                                    ),

                                    Visibility(
                                      visible: controller.noDataVisible=="notVisible"? false: !controller.isMainVisible,
                                      child: Container(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          'No Data Found !!'.tr,
                                          style: styleW400S14.copyWith(
                                              fontSize: 18,
                                              color: ColorRes.black,
                                              fontWeight: FontWeight.w600,
                                              height: 1),
                                        ),
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
                );
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
                print("vakue: $value");
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

    if ( controller.familyRecordModel != null) {
      if (controller.familyRecordModel!.data![0].farmerProduceDetails!.length > 0) {
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
                      'Farmer Produce Details'.tr,
                      textAlign: TextAlign.start,
                      style: styleW400S15.copyWith(
                          fontSize: 15, color: ColorRes.white,wordSpacing:0.1),
                    ),
                  ),

                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.familyRecordModel!.data![0].farmerProduceDetails!.length,
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
                                      color: index%2==0? ColorRes.tealTransColor : ColorRes.redTransColor
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child:  Text(
                                      textAlign: TextAlign.center,
                                      "${index+1}",
                                      style: styleW400S14.copyWith(
                                          fontSize: 14,
                                          color: ColorRes.black,
                                          height: 1),
                                    ),
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
                                          controller.familyRecordModel!.data![0].farmerProduceDetails![index].CommodityName!,
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
                                          controller.familyRecordModel!.data![0].farmerProduceDetails![index].ProduceEntryDate!,
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
                                          controller.familyRecordModel!.data![0].farmerProduceDetails![index].CommodityVarietyName!,
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
                                          controller.familyRecordModel!.data![0].farmerProduceDetails![index].EstimatedProduce!,
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
                  }),
            ],
          ),
        );
      } else {
        return Container();
      }
    }else{
      return Container();
    }

  }

  Widget getFarmerPersonalDetailData() {
    if(controller.familyRecordModel !=null && controller.familyRecordModel!.data!=null) {
      if (controller.familyRecordModel!.data!.length > 0) {
        return Container(
          child: Column(
            children: [
              appSizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: ColorRes.headerBgColor
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'farmer_personal_details'.tr,
                      textAlign: TextAlign.start,
                      style: styleW400S15.copyWith(
                          fontSize: 15,
                          color: ColorRes.white,
                          wordSpacing: 0.1),
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
              ),
            ],
          ),
        );
      }
      else {
        return Container();
      }
    }else{
      return Container();
    }


  }

  Widget getGatePassDetailData() {
    if ( controller.familyRecordModel != null) {
      if (controller.familyRecordModel!.data![0].gatePassDetails!.length > 0) {

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
                      'Gate Pass Details'.tr,
                      textAlign: TextAlign.start,
                      style: styleW400S15.copyWith(
                          fontSize: 15, color: ColorRes.white,wordSpacing:0.1),
                    ),
                  ),

                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.familyRecordModel!.data![0].gatePassDetails!.length ,
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
                                            controller.familyRecordModel!.data![0].gatePassDetails![index].AgencyName!,
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
                                            controller.familyRecordModel!.data![0].gatePassDetails![index].MandiName!,
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
                                            controller.familyRecordModel!.data![0].gatePassDetails![index].GatePassId!,
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
                                            controller.familyRecordModel!.data![0].gatePassDetails![index].GatePassDate!,
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
                                            controller.familyRecordModel!.data![0].gatePassDetails![index].LotNumber!,
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
                                            "${controller.familyRecordModel!.data![0].gatePassDetails![index].ActualWeight!}/${controller.familyRecordModel!.data![0].gatePassDetails![index].GatePassWeight!}",
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
                                            controller.familyRecordModel!.data![0].gatePassDetails![index].DevationWeight!,
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
                                            controller.familyRecordModel!.data![0].gatePassDetails![index].AuctionRecorderId!,
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
                                            controller.familyRecordModel!.data![0].gatePassDetails![index].AuctionDate!,
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
                                            controller.familyRecordModel!.data![0].gatePassDetails![index].AartiyaFirmName!,
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

                  }),
            ],
          ),
        );
      }else{
        return Container();
      }
    }else{
      return Container();
    }


  }

  Widget getPJFormDetailData() {
    if ( controller.familyRecordModel != null) {
      if (controller.familyRecordModel!.data![0].jFormDetails!.length > 0) {

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
                      'JForms Details'.tr,
                      textAlign: TextAlign.start,
                      style: styleW400S15.copyWith(
                          fontSize: 15, color: ColorRes.white,wordSpacing:0.1),
                    ),
                  ),

                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.familyRecordModel!.data![0].jFormDetails!.length ,
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].IFormID!.toString(),
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].JFormID!.toString(),
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].ReadyToLift!.toString(),
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].ReadyToLiftDate!.toString(),
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].eGatepassID!.toString(),
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].eGatepassDate!.toString(),
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].DMMSPApprovalDate!.toString(),
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].IsFileGenerated!.toString(),
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].FileGeneratedDate!.toString(),
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].JFormTotalAmount!.toString(),
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
                                            controller.familyRecordModel!.data![0].jFormDetails![index].JFormNetAmountPayable!.toString(),
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
                                        InkWell(
                                          onTap: (){
                                            Get.to(() => FarmerPaymentDetailScreen(sessionID: controller.yearController.text, jFormID: controller.familyRecordModel!.data![0].FarmerID!.toString()));
                                          },
                                          child: Container(
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

                  }),
            ],
          ),
        );
      }else{
        return Container();
      }
    }else{
      return Container();
    }


  }
}
