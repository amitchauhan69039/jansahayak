import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';

class NearbyHospitalScreen extends StatefulWidget {
  const NearbyHospitalScreen({super.key});

  @override
  State<NearbyHospitalScreen> createState() => _NearbyHospitalScreenState();
}

class _NearbyHospitalScreenState extends State<NearbyHospitalScreen> {
  final NearbyHospitalController controller =
      Get.put(NearbyHospitalController());

  @override
  void initState() {
    super.initState();
    controller.getALLHospitalBasedOnKM();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<NearbyHospitalController>(
          id: 'nearby_hospital_screen',
          builder: (controller) {
            return Column(
              children: [
                CommonAppbar(title: 'list_hospital'.tr),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: StackedLoader(
                      loading: controller.loader,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            width: 1,
                                            color: ColorRes.borderColor,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            appSizedBox(width: 10),
                                            Expanded(
                                              child: TextField(
                                                controller:
                                                controller.searchController,
                                                keyboardType: TextInputType.text,
                                                textAlignVertical:
                                                TextAlignVertical.center,
                                                onChanged: (text) {
                                                  setState(() {
                                                    controller.searchValue=text;
                                                    if(text.length>=3){
                                                      controller.getALLHospitalBasedOnKM();
                                                    }
                                                  });
                                                },
                                                style: styleW400S13.copyWith(
                                                    fontSize: 16,
                                                    color: ColorRes.black),
                                                decoration:
                                                new InputDecoration.collapsed(
                                                  hintText: 'search_hospital',
                                                  hintStyle:
                                                  styleW400S13.copyWith(
                                                      fontSize: 16,
                                                      color:
                                                      ColorRes.greyColor),
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                              AssetRes.searchIcon,
                                              height: 20,
                                              width: 20,
                                            ),
                                            appSizedBox(width: 10),
                                          ],
                                        )),
                                  ),
                                  appSizedBox(width: 5),
                                  Column(
                                    children: [
                                      appSizedBox(height: 10),
                                      Image.asset(
                                        AssetRes.chirayu_setting,
                                        height: 20,
                                        width: 20,
                                      ),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        'filters'.tr,
                                        style: styleOpenW100S12.copyWith(
                                            fontSize: 10, color: ColorRes.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              appSizedBox(height: 15),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        controller.kmsColor = "5";
                                        controller.getALLHospitalBasedOnKM();
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.kmsColor == "5"
                                            ? ColorRes.hospitalCardColor
                                            : ColorRes.hospitalCard2Color,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            textAlign: TextAlign.start,
                                            '5 KM'.tr,
                                            overflow: TextOverflow.ellipsis,
                                            style: styleW400S14.copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: ColorRes.hospitalDarkGreyTextColor,
                                                height: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  appSizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        controller.kmsColor = "10";
                                        controller.getALLHospitalBasedOnKM();
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.kmsColor == "10"
                                            ? ColorRes.hospitalCardColor
                                            : ColorRes.hospitalCard2Color,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            textAlign: TextAlign.start,
                                            '10 KM'.tr,
                                            overflow: TextOverflow.ellipsis,
                                            style: styleW400S14.copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: ColorRes.hospitalDarkGreyTextColor,
                                                height: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  appSizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        controller.kmsColor = "15";
                                        controller.getALLHospitalBasedOnKM();
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.kmsColor == "15"
                                            ? ColorRes.hospitalCardColor
                                            : ColorRes.hospitalCard2Color,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            textAlign: TextAlign.start,
                                            '15 KM'.tr,
                                            overflow: TextOverflow.ellipsis,
                                            style: styleW400S14.copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: ColorRes.hospitalDarkGreyTextColor,
                                                height: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  appSizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        controller.kmsColor = "25";
                                        controller.getALLHospitalBasedOnKM();
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.kmsColor == "25"
                                            ? ColorRes.hospitalCardColor
                                            : ColorRes.hospitalCard2Color,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            textAlign: TextAlign.start,
                                            '25 KM'.tr,
                                            overflow: TextOverflow.ellipsis,
                                            style: styleW400S14.copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: ColorRes.hospitalDarkGreyTextColor,
                                                height: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  appSizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        controller.kmsColor = "50";
                                        controller.getALLHospitalBasedOnKM();
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.kmsColor == "50"
                                            ? ColorRes.hospitalCardColor
                                            : ColorRes.hospitalCard2Color,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            textAlign: TextAlign.start,
                                            '50 KM'.tr,
                                            overflow: TextOverflow.ellipsis,
                                            style: styleW400S14.copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: ColorRes.hospitalDarkGreyTextColor,
                                                height: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              appSizedBox(height: 15),
                             getFarmerProducedData(),
                            ],
                          ),
                        ),
                      ),
                  
                    ),
                  ),
                )
              ],
            );
          }),
    ));
  }

  Widget getFarmerProducedData() {
    if(controller.nearbyHospitalModel!=null && controller.nearbyHospitalModel!.data!.length >0){
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.nearbyHospitalModel!.data!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                elevation: 5,
                child: InkWell(
                  onTap: (){
                    Get.to(() => HospitalDetalScreen(nearbyHospitalModel: controller.nearbyHospitalModel!.data![index]));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: ColorRes.hospitalCardbgColor,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color:controller.nearbyHospitalModel!.data![index].hTYPE=="1" ? ColorRes.publicColor :
                                  controller.nearbyHospitalModel!.data![index].hTYPE=="2" ? ColorRes.privateProfitColor :
                                  controller.nearbyHospitalModel!.data![index].hTYPE=="3" ? ColorRes.privateNonProfitColor : ColorRes.goiColor ,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 3, bottom: 3),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                      controller.nearbyHospitalModel!.data![index].hTYPE=="1" ? 'Public' :
                                      controller.nearbyHospitalModel!.data![index].hTYPE=="2" ? 'Private(For Profit)' :
                                      controller.nearbyHospitalModel!.data![index].hTYPE=="3" ? 'Private(Not For Profit)' : 'Government Of India' ,
                                    style: styleW400S14.copyWith(
                                        fontSize: 13,
                                        color: ColorRes.white,
                                        height: 1),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AssetRes.chirayu_location,
                                            height: 20,
                                            width: 20,
                                          ),
                                          Text(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            '10KM'.tr,
                                            style: styleOpenW100S12.copyWith(
                                                fontSize: 10, color: ColorRes.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          appSizedBox(height: 10),



                          Row(
                            children: [
                              appSizedBox(width: 25),
                              Image.asset(
                                AssetRes.chirayu_hospital,
                                height: 20,
                                width: 20,
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  maxLines: 4,
                                  textAlign: TextAlign.left,
                                  controller.nearbyHospitalModel!.data![index].hNAME!,
                                  style: styleW500S15.copyWith(
                                      fontSize: 14, color: ColorRes.black),
                                ),
                              ),
                            ],
                          ),
                          appSizedBox(height: 10),

                          Divider(
                            height: 0.5,
                            color: ColorRes.dividerColor,
                          ),

                          appSizedBox(height: 10),

                          Row(
                            children: [
                              appSizedBox(width: 15),
                              Image.asset(
                                AssetRes.chirayu_hospital_spciality,
                                height: 20,
                                width: 20,
                              ),
                              appSizedBox(width: 10),
                              Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                'Specialities Details'.tr,
                                style: styleW500S15.copyWith(
                                    fontSize: 14, color: ColorRes.black),
                              ),
                            ],
                          ),

                          appSizedBox(height: 10),


                          Container(
                            height: 40,
                            margin: EdgeInsets.only(left: 7,right: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: controller.nearbyHospitalModel!.data![index].oSpeciality!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, specialIndex) {
                                    return Card(
                                      elevation: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          color: ColorRes.hospitalCardHzBgColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              controller.nearbyHospitalModel!.data![index].oSpeciality![specialIndex].sName!.toUpperCase().tr,
                                              style: styleW400S18.copyWith(
                                                  fontSize: 12, color: ColorRes.hospitalDarkGreyTextColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),


                          appSizedBox(height: 10),
                          Row(
                            children: [
                              appSizedBox(width: 15),
                              Image.asset(
                                AssetRes.chirayu_phone,
                                height: 20,
                                width: 20,
                              ),
                              appSizedBox(width: 10),
                              InkWell(
                                onTap: (){
                                  makePhoneCall('tel:${controller.nearbyHospitalModel!.data![index].hCONTACT!}');

                                },
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  controller.nearbyHospitalModel!.data![index].hCONTACT!,
                                  style: styleW500S15.copyWith(
                                      fontSize: 14, color: ColorRes.black),
                                ),
                              ),
                            ],
                          ),





                          appSizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    }else{
      return Container(
        child: Text(
          textAlign: TextAlign.center,
          'No Data Found !!'.tr,
          style: styleW400S14.copyWith(
              fontSize: 18,
              color: ColorRes.black,
              fontWeight: FontWeight.w600,
              height: 1),
        ),
      );
    }

  }
}
