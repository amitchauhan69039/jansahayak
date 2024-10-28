import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/auth/language_screen.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../model/static_member_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {


    super.initState();
  }

  final ProfileController controller = Get.put(ProfileController());

  List<String> list=['profile'.tr,"goverment_apps".tr,"download".tr,"feedback".tr,"choose_language".tr,"logout".tr,];

  List<String> imageList=[AssetRes.ic_profile_v3,AssetRes.ic_baseline_apps_v3,AssetRes.download_icon_v3,
    AssetRes.ic_feedback_v3,AssetRes.change_language_v3,AssetRes.logout_icon];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppbar(title: 'Profile'.tr),
          ),
          body: GetBuilder<ProfileController>(
              id: 'profile_screen',
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
                                        controller.familyId.text,
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
                                        controller.address.text,
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
                                        controller.memberCount.text,
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
                                    textAlign: TextAlign.start,
                                    'added_family_members_on_janshayak'.tr,
                                    style: styleW400S16.copyWith(
                                      fontSize: 15,
                                      color: ColorRes.appPrimaryDarkColor,),
                                  ),
                                ),

                              ],
                            ),
                          ),

                          getProfileData(),
                          appSizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.only(left: 16,right: 16),
                            child: AppButton(
                              onButtonTap: (){

                                controller.getDataFromFamilyID(context);
                              },
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              buttonName: 'add_new_member_in_family_on_jansahyak'.tr,
                              textColor:ColorRes.white,
                              backgroundColor:ColorRes.appPrimaryDarkColor,
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


  Widget getProfileData() {
    if ( controller.staticMemberData != null) {

      return  ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: controller.staticMemberData!.length ,
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
                                controller.staticMemberData![index]['memberName'],
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
                                controller.staticMemberData![index]['mobile'],
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
                                controller.staticMemberData![index]['gender'],
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
                                controller.staticMemberData![index]['DOB'],
                                style:styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
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