import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/auth/language_screen.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  final SettingsController controller = Get.put(SettingsController());

  List<String> list=['profile'.tr,"goverment_apps".tr,"download".tr,"feedback".tr,"choose_language".tr,"logout".tr,];

  List<String> imageList=[AssetRes.ic_profile_v3,AssetRes.ic_baseline_apps_v3,AssetRes.download_icon_v3,
    AssetRes.ic_feedback_v3,AssetRes.change_language_v3,AssetRes.logout_icon];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<SettingsController>(
              id: 'settings',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: AssetImage(AssetRes.backgroundImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisSize:MainAxisSize.min,
                          children: [
                            appSizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white
                                  ),
                                  child: getSettingsData(),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  Widget getSettingsData() {
    if(list!=null){
      return Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length ,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  if(index==0){
                    if(PrefService.getString(PrefKeys.USER_ROLE)=="G") {
                      Get.to(() => CommonFamilyNotVerfiedScreen());

                    }else {
                      //showFeedbackDialog(context);
                    }


                  }else if(index==1){
                    String url = "https://play.google.com/store/apps/developer?id=Dept.+of+IT,+Electronics+%26+Communication,+Haryana&hl=en-IN";
                    makePhoneCall(url);
                  }else if(index==2){
                    Get.to(() => DownloadScreen());

                  }else if(index==3){

                    if(PrefService.getString(PrefKeys.USER_ROLE)=="G") {
                      Get.to(() => CommonFamilyNotVerfiedScreen());

                    }else {
                      showFeedbackDialog(context);
                    }


                  }else if(index==4){
                    Get.to(() => LanguageScreen2());
                  }else if(index==5){

                    signOut(context);
                  }
                },
                child: Container(
                  height: 70,
                  child: Column(
                    children: [
                      Container(
                        height: 69,
                        child: Row(
                          children: [
                            appSizedBox(width: 20),
                            Image.asset(
                              imageList[index],
                              width: 25,
                              height: 25,
                            ),

                            appSizedBox(width: 10),
                            Expanded(
                              child:Text(
                                textAlign: TextAlign.left,
                                list[index],
                                style: styleW400S18.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1.1),
                              ),
                            ),
                            appSizedBox(width: 10),

                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: ColorRes.greyColor
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  AssetRes.ic_right_arrow,
                                  width: 16,
                                  height: 16,
                                ),
                              ),
                            ),
                            appSizedBox(width: 20),
                          ],
                        ),
                      ),
                      Divider(
                        height:0.5,
                        color: ColorRes.divider2Color,
                      ),

                    ],
                  ),
                ),
              );

            }),
      );
    }else{
      return Container();
    }

  }


  Future<void>  signOut(BuildContext mContext) async{
    final alert = AlertDialog(
        contentPadding: EdgeInsets.zero,

        content: Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('are_you_sure_you_want_to_sign_out'.tr,
                    style: styleW500S15),
                appSizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: Get.back,
                      child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 35,
                          // padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorRes.appRedColor,
                          ),
                          child: Text('cancel'.tr,
                              style: styleW500S15.copyWith(
                                  color: ColorRes.white))),
                    ),
                    appSizedBox(width: 2.5.w),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Get.back();
                        await PrefService.set(PrefKeys.USER_ROLE, "");
                        Get.offAll(() => const LoginScreen());
                      },
                      child: AppButton(
                          buttonName: 'yes'.tr,
                          buttonHeight: 35,
                          buttonWidth: 70,
                          borderRadius: 5,
                          textColor: ColorRes.white,
                          backgroundColor: ColorRes.appPrimaryColor),
                    ),
                  ],
                )



              ],
            ),
          ),
        )
    );

    showDialog(
      context:  mContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void>  showFeedbackDialog(BuildContext mContext) async{
    final alert = AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 45,
                  color: ColorRes.appPrimaryDarkColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        'feedback'.tr,
                        style: styleW700S14.copyWith(
                            fontSize: 16,
                            color: ColorRes.white),
                      ),
                    ),
            
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Image.asset(
                        AssetRes.ic_feedback,
                        width: 50,
                        height: 50,
                      ),
            
                      appSizedBox(height: 15),
            
            
                      Text(
                        textAlign: TextAlign.center,
                        'rating_txt'.tr,
                        style: styleW400S18.copyWith(
                            fontSize: 14,
                            color: ColorRes.black),
                      ),
            
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 40.0,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: ColorRes.selectedTextColor,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            controller.rating.text=rating.toString();

                          });
                          print(rating);
                        },
                      ),
            
                      appSizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          textAlign: TextAlign.center,
                          'remarks'.tr,
                          style: styleW400S18.copyWith(
                              fontSize: 15,
                              color: ColorRes.black),
                        ),
                      ),
            
                      appSizedBox(height: 10),
            
                      Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(7),
                              border: Border.all(
                                width: 1,
                                color: ColorRes.borderColor,
                                style: BorderStyle.solid,
                              ),
                              color: ColorRes.white),
                          child:  Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                controller: controller.remarksValue,
                                maxLines: null, // Set this
                                expands: true, // and this
                                keyboardType: TextInputType.multiline,
                                textAlignVertical:
                                TextAlignVertical.center,
                                onChanged: (text) {},
                                style: styleW400S13.copyWith(
                                    fontSize: 16,
                                    color: ColorRes.black),
                                decoration:
                                new InputDecoration.collapsed(
                                  hintText: 'enter_remarks'.tr,
                                  hintStyle:
                                  styleW400S13.copyWith(
                                      fontSize: 15,
                                      color:
                                      ColorRes.greyColor),
                                ),
                              ),
                            ),
                          ),
                      ),
            
                      appSizedBox(height: 15),
            
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child:  InkWell(
                              onTap: (){
                                Navigator.pop(mContext);
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color:ColorRes.appPrimaryDarkColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    'skip'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: styleW400S14.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: ColorRes.white,
                                        height: 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          appSizedBox(width: 15),
                          Expanded(
                            flex: 1,
                            child:  InkWell(
                              onTap: (){
                                controller.submitRating(mContext);
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color:ColorRes.activatedButtonColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    'submit'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: styleW400S14.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: ColorRes.white,
                                        height: 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          appSizedBox(height: 15),
                        ],
                      ),
                    ],
                  ),
                )
            
            
              ],
            ),
          ),
        )
    );

    showDialog(
      context:  mContext,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }




}