import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';
import 'package:flutter/scheduler.dart';

class OptVerificationScreen extends StatefulWidget {

  final String message, familyId,txn,memberId,user,mobileNumber;
  const OptVerificationScreen({super.key, required this.message, required this.familyId, required this.txn, required this.memberId,required this.user, required this.mobileNumber});

  @override
  State<OptVerificationScreen> createState() => _OptVerificationScreenState();
}

class _OptVerificationScreenState extends State<OptVerificationScreen> {
  final AuthController controller = Get.put(AuthController());

  @override
  void initState() {
    controller.otpUser=widget.user;
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
              id: 'otp_screen',
              builder: (controller) {
                return StackedLoader(
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
                          appSizedBox(height: 40),
                          Container(
                            height: 45,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: Get.back,
                                child: Image.asset(
                                  AssetRes.blueBackIcon,
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              AssetRes.smartphoneIcon,
                              height: 90,
                              width: 80,
                            ),
                          ),
                          Text(
                            'verify_mobile'.tr,
                            textAlign: TextAlign.center,
                            style: styleW500S36.copyWith(
                                fontSize: 16, color: ColorRes.black),
                          ),
                          appSizedBox(height: 90),
                          Text(
                            'otp_text'.tr,
                            textAlign: TextAlign.start,
                            style: styleW400S16.copyWith(
                                fontSize: 24, color: ColorRes.textBlueColor),
                          ),
                          Text(
                            widget.user=="Successfull"?widget.message : widget.user=="Add Member" ?widget.message : "+91 - ${widget.mobileNumber}",
                            textAlign: TextAlign.start,
                            style: styleW400S19.copyWith(
                                fontSize: 15, color: ColorRes.textColor),
                          ),
                          appSizedBox(height: 10),
                          Container(
                              width: double.infinity,
                              height: 55,
                              child: TextField(
                                controller: controller.otpNumberController,
                                keyboardType: TextInputType.number,
                                textAlignVertical: TextAlignVertical.center,
                                style: styleW400S13.copyWith(
                                    fontSize: 18, color: ColorRes.black),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                decoration: InputDecoration(
                                  hintText: 'Enter OTP',
                                  hintStyle: styleW400S13.copyWith(
                                      fontSize: 18,
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
                              )
                          ),
                          appSizedBox(height: 20),
                          AppButton(
                            onButtonTap:()=>{
                              widget.user=="Successfull"?
                              controller.verifyOtp(widget.memberId,widget.txn,widget.familyId,context) :
                              widget.user=="Add Member" ?
                              controller.verifyOtp(widget.memberId,widget.txn,widget.familyId,context):
                                  controller.verifyOtp2(widget.memberId,widget.mobileNumber)
                            },
                            buttonName: 'verify'.tr,
                            textColor:ColorRes.white,
                            backgroundColor:ColorRes.activatedButtonColor,
                          ),

                          appSizedBox(height: 20),
                          Visibility(
                            visible: false,
                            child: AppButton(
                              buttonName: 'resend_otp'.tr,
                              textColor:ColorRes.appPrimaryColor,
                              backgroundColor:ColorRes.white,
                            ),
                          ),

                        ],
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




