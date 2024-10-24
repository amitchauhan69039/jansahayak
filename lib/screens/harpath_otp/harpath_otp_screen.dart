import 'package:JanSahayak/jan_sahayak.dart';

import '../../utils/global_data.dart';

class HarpathOtpScreen extends StatefulWidget {
  const HarpathOtpScreen({super.key});

  @override
  State<HarpathOtpScreen> createState() => _HarpathOtpScreenState();
}

class _HarpathOtpScreenState extends State<HarpathOtpScreen>{
  final HarpathOtpController controller = Get.put(HarpathOtpController());

  @override
  void initState() {
    super.initState();
    if(PrefService.getString(PrefKeys.USER_ROLE)=="G"){

      controller.mobileController.text='${PrefService.getString(PrefKeys.GUEST_NAME)}: ${PrefService.getString(PrefKeys.GUEST_MOBILE)}';
    }else{
      controller.mobileController.text='${PrefService.getString(PrefKeys.FAMILY_MEMBERS_NAME)}: ${PrefService.getString(PrefKeys.FamilyMobile)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GetBuilder<HarpathOtpController>(
            id: 'harpath_otp',
            builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: StackedLoader(
                  loading: controller.loader,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: ColorRes.harpathBgColor
                          ),

                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                      AssetRes.whiteBackIcon,
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ),
                              appSizedBox(height: 20),
                              Image.asset(
                                AssetRes.harpathLogo,
                                width: 70,
                                height: 70,
                              ),
                              appSizedBox(height: 5),
                              Text(
                                'Harpath Haryana'.tr,
                                textAlign: TextAlign.center,
                                style: styleW400S17.copyWith(
                                    fontSize: 16,
                                    color: ColorRes.white),
                              ),
                              appSizedBox(height: 10),

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  elevation: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: ColorRes.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: ColorRes.transparentPinkBgColor,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'LOGIN'.tr,
                                              textAlign: TextAlign.center,
                                              style: styleW400S13.copyWith(
                                                  fontSize: 16,
                                                  color: ColorRes.darkGrey2Color),
                                            ),
                                          ),
                                        ),
                                        appSizedBox(height: 15),


                                        Container(
                                          margin: EdgeInsets.only(left: 30,right: 30),
                                          child: Column(
                                            children: [

                                              Container(
                                                  width: double.infinity,
                                                  height: 45,
                                                  child: TextField(
                                                    controller: controller.mobileController,
                                                    keyboardType: TextInputType.number,
                                                    textAlignVertical: TextAlignVertical.center,
                                                    style: styleW400S13.copyWith(
                                                        fontSize: 14, color: ColorRes.harpathBgColor),
                                                    decoration: InputDecoration(
                                                      hintText: 'name:94161'.tr,
                                                      hintStyle: styleW400S13.copyWith(
                                                          fontSize: 14,
                                                          color: ColorRes.greyColor),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(7),
                                                          borderSide: BorderSide(
                                                              color: ColorRes.borderColor,
                                                              width: 1)),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(7),
                                                        borderSide: BorderSide(
                                                            color: ColorRes.borderColor,
                                                            width: 1),
                                                      ),
                                                    ),
                                                  )
                                              ),

                                              appSizedBox(height: 15),

                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'OTP'.tr,
                                                  textAlign: TextAlign.center,
                                                  style: styleW400S13.copyWith(
                                                      fontSize: 13,
                                                      color: ColorRes.darkGrey2Color),
                                                ),
                                              ),

                                              appSizedBox(height: 5),


                                              Container(
                                                  width: double.infinity,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                      color:ColorRes.lightGreyColor
                                                  ),
                                                  child: TextField(
                                                    controller: controller.otpController,
                                                    keyboardType: TextInputType.number,
                                                    textAlignVertical: TextAlignVertical.center,
                                                    style: styleW400S13.copyWith(
                                                        fontSize: 14, color: ColorRes.black),
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter.digitsOnly,
                                                      LengthLimitingTextInputFormatter(4),
                                                    ],
                                                    decoration: InputDecoration(
                                                      hintText: '****'.tr,
                                                      hintStyle: styleW400S13.copyWith(
                                                          fontSize: 14,
                                                          color: ColorRes.greyColor),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(5),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                    ),
                                                  )
                                              ),
                                              appSizedBox(height: 10),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: InkWell(
                                                  onTap: (){

                                                  },
                                                  child: Text(
                                                    controller.remainsTimeToResend.text,
                                                    textAlign: TextAlign.start,
                                                    style: styleW400S13.copyWith(
                                                        fontSize: 13, color: ColorRes.darkGrey2Color),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),


                                        appSizedBox(height: 15),

                                        Container(
                                          margin: EdgeInsets.only(left:20,right:20),
                                          child:Column(
                                            children: [
                                              AppButton(
                                                onButtonTap: (){
                                                  if(controller.isResendEnable){

                                                    controller.sendOTPToHarpathUSER();
                                                  }

                                                },
                                                buttonName: 'resend_otp'.tr,
                                                textColor:ColorRes.white,
                                                backgroundColor:controller.isResendEnable ? ColorRes.harpathBgColor :ColorRes.harpathlightOrgColor,
                                              ),

                                              appSizedBox(height: 15),

                                              AppButton(
                                                onButtonTap: (){

                                                  controller.registerUserOnHarpath();
                                                },
                                                buttonName: 'LOGIN'.tr,
                                                textColor:ColorRes.white,
                                                backgroundColor:ColorRes.harpathBgColor,
                                              ),
                                            ],
                                          )
                                        ),
                                        appSizedBox(height: 15),
                                      ],
                                    ),
                                  ),

                                ),
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

}