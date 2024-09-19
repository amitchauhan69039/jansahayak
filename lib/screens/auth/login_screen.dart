import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/visitors.dart';
import 'package:flutter/scheduler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController controller = Get.put(AuthController());

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: GetBuilder<AuthController>(
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
                            appSizedBox(height: 40),
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
                            appSizedBox(height: 130),
                            Text(
                              'government_of_haryana_n_welcomes_you'.tr,
                              textAlign: TextAlign.start,
                              style: styleW400S16.copyWith(
                                  fontSize: 22, color: ColorRes.textBlueColor),
                            ),
                            appSizedBox(height: 5),
                            Container(
                                width: double.infinity,
                                height: 55,
                                child: Card(
                                  elevation: 2.0,
                                  child: Container(
                                    height: 55,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                controller.isFamilyID = true;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: controller.isFamilyID == true
                                                    ? ColorRes.selectedTextColor
                                                    : ColorRes.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10)),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'FAMILY ID'.tr,
                                                  textAlign: TextAlign.center,
                                                  style: styleW400S17.copyWith(
                                                      fontSize: 16,
                                                      color: controller.isFamilyID ==
                                                              true
                                                          ? ColorRes.white
                                                          : ColorRes
                                                              .selectedTextColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                controller.isFamilyID = false;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: controller.isFamilyID == false
                                                    ? ColorRes.selectedTextColor
                                                    : ColorRes.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(10),
                                                    bottomRight: Radius.circular(10)),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'MOBILE NUMBER'.tr,
                                                  textAlign: TextAlign.center,
                                                  style: styleW400S17.copyWith(
                                                      fontSize: 14,
                                                      color: controller.isFamilyID ==
                                                              false
                                                          ? ColorRes.white
                                                          : ColorRes
                                                              .selectedTextColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            appSizedBox(height: 10),
                            Visibility(
                                visible: controller.isFamilyID,
                                child: Column(
                                  children: [
                                    Text(
                                      'reg_text'.tr,
                                      textAlign: TextAlign.start,
                                      style: styleW400S17.copyWith(
                                          fontSize: 13, color: ColorRes.black),
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
                                          onChanged: (text) {
                                            setState(() {
                                            if(text.length>=6){
                                                controller.isEnable=true;
                                            }else{
                                              controller.isEnable=false;
                                            }
                                            });
                                          },
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
                                  ],
                                )),
                            appSizedBox(height: 5),
                            Visibility(
                              visible: !controller.isFamilyID,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'enter_mobile_text'.tr,
                                    textAlign: TextAlign.start,
                                    style: styleW400S17.copyWith(
                                        fontSize: 13, color: ColorRes.black),
                                  ),
                                  appSizedBox(height: 5),
                                  Container(
                                      width: double.infinity,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          width: 2,
                                          color: ColorRes.borderColor,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "  +91 - ",
                                            style: styleW400S13.copyWith(
                                                fontSize: 24, color: ColorRes.black),
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: controller.mobileController,
                                              keyboardType: TextInputType.number,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              onChanged: (text) {
                                                setState(() {
                                                if(text.length==10){
                                                    controller.isEnable=true;
                                                }else{
                                                  controller.isEnable=false;
                                                }
                                                });
                                              },
                                              style: styleW400S13.copyWith(
                                                  fontSize: 24,
                                                  color: ColorRes.black),
                                              decoration:
                                                  new InputDecoration.collapsed(
                                                hintText: '0000000000',
                                                hintStyle: styleW400S13.copyWith(
                                                    fontSize: 24,
                                                    color: ColorRes.greyColor),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AppButton(
                                      onButtonTap:()=>{
                                        controller.checkLogin(context,"login")
                                      },
                                      buttonName: 'next'.tr,
                                      textColor: controller.isEnable ? ColorRes.white : ColorRes.disabledTextColor,
                                      backgroundColor:controller.isEnable? ColorRes.activatedButtonColor: ColorRes.disabledButtonColor,
                                    ),
                                    appSizedBox(height: 5),
                                    Text(
                                      'Powered By CRID'.tr,
                                      textAlign: TextAlign.center,
                                      style: styleW400S13.copyWith(
                                          fontSize: 10,
                                          color:  ColorRes.textBlueColor),
                                    ),
                                    appSizedBox(height: 5),

                                  ],
                                ),
                              ),
                            ),

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




