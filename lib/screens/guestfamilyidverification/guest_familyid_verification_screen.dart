import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/visitors.dart';
import 'package:flutter/scheduler.dart';

class GuestFamilyidVerificationScreen extends StatefulWidget {
  const GuestFamilyidVerificationScreen({super.key});

  @override
  State<GuestFamilyidVerificationScreen> createState() => _GuestFamilyidVerificationScreenState();
}

class _GuestFamilyidVerificationScreenState extends State<GuestFamilyidVerificationScreen> {
  final AuthController controller = Get.put(AuthController());

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CommonAppbar(title: 'family_id_verification'.tr),
            ),
            body: GetBuilder<AuthController>(
              id: 'login',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: AppPadding.horizontalPadding,
                          right: AppPadding.horizontalPadding,
                          bottom: 1.h),
                      child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                appSizedBox(height: 80),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        AssetRes.jan_sahay_logo,
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text(
                                        'JAN SAHAYAK',
                                        style: styleW700S14.copyWith(
                                            fontSize: 18,
                                            color: ColorRes.appPrimaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                                appSizedBox(height: 10),
                                Text(
                                  'access_these_services'.tr,
                                  textAlign: TextAlign.start,
                                  style: styleW400S15.copyWith(
                                      fontSize: 15, color: ColorRes.black),
                                ),
                                appSizedBox(height: 20),
                                Text(
                                  'family_id_aadhar'.tr,
                                  textAlign: TextAlign.start,
                                  style: styleW400S15.copyWith(
                                      fontSize: 15, color: ColorRes.black),
                                ),
                                appSizedBox(height: 10),
                                Container(
                                    width: double.infinity,
                                    height: 65,
                                    child: TextField(
                                      controller: controller.familyIdController,
                                      keyboardType: TextInputType.text,
                                      textAlignVertical: TextAlignVertical.center,
                                      style: styleW400S13.copyWith(
                                          fontSize: 24, color: ColorRes.black),
                                      decoration: InputDecoration(
                                        hintText: 'e.g 8AFGTY09',
                                        hintStyle: styleW400S13.copyWith(
                                            fontSize: 24,
                                            color: ColorRes.greyColor),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: ColorRes.borderColor,
                                                width: 2)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: ColorRes.borderColor,
                                              width: 2),
                                        ),
                                      ),
                                    )),


                                appSizedBox(height: 30),
                                AppButton(
                                  onButtonTap:()=>{
                                    if(controller.familyIdController.text.toString().isEmpty){
                                      toastMsg("Please enter some value !")
                                    }else{
                                      controller.loginWithFamilyiD(context)
                                    }

                                  },
                                  buttonName: 'verify'.tr,
                                  textColor:ColorRes.white,
                                  backgroundColor:ColorRes.activatedButtonColor,
                                ),
                                appSizedBox(height: 5),

                              ],
                            ),
                          ]
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
