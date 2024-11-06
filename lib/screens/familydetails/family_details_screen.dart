import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';

import '../../model/all_record_model.dart';

class FamilyDetailsScreen extends StatefulWidget {
  final Result result;
  const FamilyDetailsScreen({super.key,required this.result});

  @override
  _FamilyDetailsScreenState createState() => _FamilyDetailsScreenState();
}

class _FamilyDetailsScreenState extends State<FamilyDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  final FamilyDetailsController controller = Get.put(FamilyDetailsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppbar(title: 'family_details'.tr),
          ),
          body: GetBuilder<FamilyDetailsController>(
              id: 'family_detail_screen',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize:MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16,right: 16),
                            child: Column(
                              children: [
                                appSizedBox(height: 30),

                                Image.asset(
                                  AssetRes.emblem_of_haryana,
                                  width: 60,
                                  height: 80,
                                ),
                                appSizedBox(height: 10),

                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Citizen Resource Information Department (CRID)'.tr,
                                    style: styleW400S16.copyWith(
                                      fontSize: 14,
                                      color: ColorRes.black,),
                                  ),
                                ),
                                appSizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child:  Text(
                                        textAlign: TextAlign.start,
                                        'family_id'.tr,
                                        style: styleW400S14.copyWith(
                                            fontSize: 15,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      ':'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 12,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                    appSizedBox(width: 10),
                                    Expanded(
                                      flex: 1,
                                      child:  Text(
                                        textAlign: TextAlign.start,
                                        widget.result.familyId!,
                                        style:styleW400S14.copyWith(
                                            fontSize: 15,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                    ),
                                  ],
                                ),


                                appSizedBox(height: 15),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child:  Text(
                                        textAlign: TextAlign.start,
                                        'Family Head Name'.tr,
                                        style: styleW400S14.copyWith(
                                            fontSize: 15,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      ':'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 12,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                    appSizedBox(width: 10),
                                    Expanded(
                                      flex: 1,
                                      child:  Text(
                                        textAlign: TextAlign.start,
                                        widget.result.familyHeadName!,
                                        style:styleW400S14.copyWith(
                                            fontSize: 15,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                    ),
                                  ],
                                ),


                                appSizedBox(height: 15),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child:  Text(
                                        textAlign: TextAlign.start,
                                        'member_count'.tr,
                                        style: styleW400S14.copyWith(
                                            fontSize: 15,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      ':'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 12,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                    appSizedBox(width: 10),
                                    Expanded(
                                      flex: 1,
                                      child:  Text(
                                        textAlign: TextAlign.start,
                                        widget.result.pppMemberDetails!.length.toString(),
                                        style: styleW400S14.copyWith(
                                            fontSize: 15,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                    ),

                                  ],
                                ),

                                appSizedBox(height: 15),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child:  Text(
                                        textAlign: TextAlign.start,
                                        'address'.tr,
                                        style: styleW400S14.copyWith(
                                            fontSize: 15,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      ':'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 12,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                    appSizedBox(width: 10),
                                    Expanded(
                                      flex: 1,
                                      child:  Text(
                                        textAlign: TextAlign.start,
                                        '${widget.result.familyLandMark!},${widget.result.familyWName!},${widget.result.familyDName!}',
                                        style: styleW400S14.copyWith(
                                            fontSize: 15,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                    ),
                                  ],
                                ),

                                appSizedBox(height: 15),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child:  Text(
                                        textAlign: TextAlign.start,
                                        'Family Income'.tr,
                                        style: styleW400S14.copyWith(
                                            fontSize: 15,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.start,
                                      ':'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 12,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                    appSizedBox(width: 10),
                                    Expanded(
                                      flex: 1,
                                      child:  Text(
                                        textAlign: TextAlign.start,
                                        widget.result.familyIncome!,
                                        style: styleW400S14.copyWith(
                                            fontSize: 15,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                    ),
                                  ],
                                ),

                                appSizedBox(height: 15),

                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'List of family Members'.tr,
                                    style: styleW400S16.copyWith(
                                      fontSize: 16,
                                      color: ColorRes.privateNonProfitColor,),
                                  ),
                                ),



                              ],
                            ),
                          ),

                          getFamilyData(),
                          appSizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.only(left: 16,right: 16),
                            child: AppButton(
                              onButtonTap: (){

                                Get.to(() => FamilyViewDocumentScreen());
                              },
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              buttonName: 'Print Family Id'.toUpperCase().tr,
                              textColor:ColorRes.white,
                              backgroundColor:ColorRes.appPrimaryDarkColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              textAlign: TextAlign.start,
                              "DISCLAIMER: The information displayed on this page is NOT proof of verified information in FIDR. This information should NOT be construed as \'verified information\' provided by Citizen Resources Information Department or Haryana Parivar Pehchan Authority, Panchkula, or used for any legal purpose. Users are advised to cross-check authenticity of any information with the concerned Government department.".tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 12,
                                  color: ColorRes.borderColor,
                                  height: 1
                              )
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }


  Widget getFamilyData() {
    if ( widget.result.pppMemberDetails != null) {

      return  ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.result.pppMemberDetails!.length ,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Card(
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: ColorRes.white,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize:MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'name_'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              ':'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                widget.result.pppMemberDetails![index].firstName!,
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),

                        appSizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'Father Name'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              ':'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '${widget.result.pppMemberDetails![index].fatherFirstName!} ${widget.result.pppMemberDetails![index].fatherLastName!}',
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Visibility(
                                visible: widget.result.pppMemberDetails![index].isFnameVerified=="Y",
                                child:Image.asset(
                                  AssetRes.check,
                                  width: 25,
                                  height: 25,
                                )
                            ),
                          ],
                        ),

                        appSizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'Mother Name'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              ':'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                '${widget.result.pppMemberDetails![index].motherFirstName!} ${widget.result.pppMemberDetails![index].motherLastName!}',
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Visibility(
                                visible: widget.result.pppMemberDetails![index].isMnameVerified=="Y",
                                child:Image.asset(
                                  AssetRes.check,
                                  width: 25,
                                  height: 25,
                                )
                            ),
                          ],
                        ),

                        appSizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'dob'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              ':'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                widget.result.pppMemberDetails![index].dob!,
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Visibility(
                                visible: widget.result.pppMemberDetails![index].isDOBVerified=="Y",
                                child:Image.asset(
                                  AssetRes.check,
                                  width: 25,
                                  height: 25,
                                )
                            ),
                          ],
                        ),


                        appSizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'Relation with HOF'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              ':'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                widget.result.pppMemberDetails![index].relationshipWithHHName!,
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Visibility(
                                visible: widget.result.pppMemberDetails![index].isRelationWithHeadVerified=="Y",
                                child:Image.asset(
                                  AssetRes.check,
                                  width: 25,
                                  height: 25,
                                )
                            ),
                          ],
                        ),

                        appSizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'mobile'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              ':'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                widget.result.pppMemberDetails![index].mobileNo!,
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Visibility(
                                visible: widget.result.pppMemberDetails![index].isMobileVerified=="Y",
                                child:Image.asset(
                                  AssetRes.check,
                                  width: 25,
                                  height: 25,
                                )
                            ),
                          ],
                        ),

                        appSizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'gender'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              ':'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                widget.result.pppMemberDetails![index].gender=="M" ? "Male" :
                                widget.result.pppMemberDetails![index].gender=="F" ? "Female" : "Other",
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Visibility(
                                visible: widget.result.pppMemberDetails![index].isGenderVerified=="Y",
                                child:Image.asset(
                                  AssetRes.check,
                                  width: 25,
                                  height: 25,
                                )
                            ),
                          ],
                        ),

                        appSizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'Occupation'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              ':'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                widget.result.pppMemberDetails![index].occupationName!,
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                          ],
                        ),
                        appSizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'Caste'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              ':'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                widget.result.pppMemberDetails![index].casteCategoryName!,
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Visibility(
                                visible: widget.result.pppMemberDetails![index].isCasteVerified=="Y",
                                child:Image.asset(
                                  AssetRes.check,
                                  width: 25,
                                  height: 25,
                                )
                            ),
                          ],
                        ),

                        appSizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                'Is Divyang'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              ':'.tr,
                              style: styleW400S14.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                widget.result.pppMemberDetails![index].isDivyang!,
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                            Visibility(
                              visible: widget.result.pppMemberDetails![index].isDivyang=="Y",
                                child:Image.asset(
                                  AssetRes.check,
                                  width: 25,
                                  height: 25,
                                )
                            ),
                          ],
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            );

          });

    } else {
      return Container();
    }
  }


}