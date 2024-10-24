import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';
import 'package:flutter_tags/flutter_tags.dart';

import '../../../model/nearby_hospital_model.dart';

class HospitalDetalScreen extends StatefulWidget {
  final NearbyHospitalData nearbyHospitalModel;
  const HospitalDetalScreen({super.key,required this.nearbyHospitalModel});

  @override
  State<HospitalDetalScreen> createState() => _HospitalDetalScreenState();
}

class _HospitalDetalScreenState extends State<HospitalDetalScreen> {
  final NearbyHospitalController controller =
  Get.put(NearbyHospitalController());

  @override
  void initState() {
    super.initState();
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
                    CommonAppbar(title: 'hospital_details'.tr),
                    Flexible(
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: StackedLoader(
                              loading: controller.loader,
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorRes.hospitaTitleBgColor,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child:  Row(
                                          children: [
                                            Image.asset(
                                              AssetRes.chirayu_hospital,
                                              height: 50,
                                              width: 50,
                                            ),
                                            appSizedBox(width: 15),
                                            Expanded(
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color:widget.nearbyHospitalModel.hTYPE=="1" ? ColorRes.publicColor :
                                                            widget.nearbyHospitalModel.hTYPE=="2" ? ColorRes.privateProfitColor :
                                                            widget.nearbyHospitalModel.hTYPE=="3" ? ColorRes.privateNonProfitColor : ColorRes.goiColor ,
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                left: 10, right: 10, top: 3, bottom: 3),
                                                            child: Text(
                                                              textAlign: TextAlign.center,
                                                              widget.nearbyHospitalModel.hTYPE=="1" ? 'Public' :
                                                              widget.nearbyHospitalModel.hTYPE=="2" ? 'Private(For Profit)' :
                                                              widget.nearbyHospitalModel.hTYPE=="3" ? 'Private(Not For Profit)' : 'Government Of India' ,
                                                              style: styleW400S14.copyWith(
                                                                  fontSize: 13,
                                                                  color: ColorRes.white,
                                                                  height: 1),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      appSizedBox(height: 3),
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          maxLines: 4,
                                                          textAlign: TextAlign.left,
                                                          widget.nearbyHospitalModel.hNAME!,
                                                          style: styleW500S15.copyWith(
                                                              fontSize: 14, color: ColorRes.black),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            ),
                                          ],
                                        ),
                                      ),

                                    ),



                                    appSizedBox(height: 10),

                                    Container(
                                      margin: EdgeInsets.only(left: 16),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          'other_details'.tr,
                                          style: styleW600S14.copyWith(
                                              fontSize: 16, color: ColorRes.black),
                                        ),
                                      ),
                                    ),
                                    appSizedBox(height: 10),

                                    Row(
                                      children: [
                                        appSizedBox(width: 25),
                                        Image.asset(
                                          AssetRes.chirayu_email,
                                          height: 20,
                                          width: 20,
                                        ),
                                        appSizedBox(width: 10),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          widget.nearbyHospitalModel.hEMAIL!,
                                          style: styleW300S14.copyWith(
                                              fontSize: 13, color: ColorRes.black),
                                        ),
                                      ],
                                    ),

                                    appSizedBox(height: 10),

                                    Row(
                                      children: [
                                        appSizedBox(width: 25),
                                        Image.asset(
                                          AssetRes.chirayu_phone,
                                          height: 20,
                                          width: 20,
                                        ),
                                        appSizedBox(width: 10),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          widget.nearbyHospitalModel.hCONTACT!,
                                          style: styleW300S14.copyWith(
                                              fontSize: 13, color: ColorRes.black),
                                        ),
                                      ],
                                    ),

                                    appSizedBox(height: 10),

                                    Row(
                                      children: [
                                        appSizedBox(width: 25),
                                        Image.asset(
                                          AssetRes.chirayu_location,
                                          height: 20,
                                          width: 20,
                                        ),
                                        appSizedBox(width: 10),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          widget.nearbyHospitalModel.hDISTRICT!,
                                          style: styleW300S14.copyWith(
                                              fontSize: 13, color: ColorRes.black),
                                        ),
                                      ],
                                    ),

                                    appSizedBox(height: 15),

                                    Divider(
                                      height: 0.5,
                                      color: ColorRes.dividerColor,
                                    ),

                                    appSizedBox(height: 10),

                                    Container(
                                      margin: EdgeInsets.only(left: 16),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          'specialities_details'.tr,
                                          style: styleW600S14.copyWith(
                                              fontSize: 16, color: ColorRes.black),
                                        ),
                                      ),
                                    ),


                                    appSizedBox(height: 10),

                                    Container(
                                      margin: EdgeInsets.only(left: 7,right: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 7,right: 7),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: GridView.builder(
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisExtent: 50.0,
                                                crossAxisSpacing: 7.0,
                                                mainAxisSpacing: 7.0,
                                              ),
                                              shrinkWrap: true,
                                              physics: ScrollPhysics(),
                                              itemCount: widget.nearbyHospitalModel.oSpeciality!.length,
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
                                                          widget.nearbyHospitalModel.oSpeciality![specialIndex].sName!.toUpperCase().tr,
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
                                    ),

                                    appSizedBox(height: 70),

                                  ],
                                ),
                              ),

                            ),
                          ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: ColorRes.navigationBgColor
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetRes.chirayu_map,
                                  height: 20,
                                  width: 20,
                                ),
                                appSizedBox(width: 5),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  'navigate_to_hospital'.tr,
                                  style: styleW300S14.copyWith(
                                      fontSize: 13, color: ColorRes.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )

                        ],
                      ),
                    )
                  ],
                );
              }),
        ));
  }
}
