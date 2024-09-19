import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/visitors.dart';
import 'package:flutter/scheduler.dart';

class GuestRegisterScreen extends StatefulWidget {

  final String mobileNumber;

  const GuestRegisterScreen({super.key,required this.mobileNumber});

  @override
  State<GuestRegisterScreen> createState() => _GuestRegisterScreenState();
}

class _GuestRegisterScreenState extends State<GuestRegisterScreen> {
  final AuthController controller = Get.put(AuthController());

  List<String> list=['select_distric_hint'.tr,"ambala".tr,"bhiwani".tr,"charkhi_dadri".tr,"faridabad".tr,"fatehabad".tr,"gurugram".tr,"hisar".tr,
    "jhajjar".tr, "jind".tr,"kaithal".tr,"karnal".tr,"kurukshetra".tr,"mahendragarh".tr,"nuh".tr,"palwal".tr,"panchkula".tr,
    "panipat".tr,"rewari".tr,"rohtak".tr,"sirsa".tr,"sonipat".tr,"yamunanagar".tr];



  DateTime selectedDate = DateTime.now();
  String dob='enter_dob'.tr;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GetBuilder<AuthController>(
              id: 'register',
              builder: (controller) {
                return StackedLoader(
                    loading: controller.loader,
                    child: Column(
                      children: <Widget>[
                        CommonAppbar(title: 'app_name'.tr),
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
                                        'name'.tr,
                                        textAlign: TextAlign.start,
                                        style: styleW400S15.copyWith(
                                            fontSize: 16, color: ColorRes.black),
                                      ),
                                      appSizedBox(height: 5),
                                      Container(
                                          width: double.infinity,
                                          height: 45,
                                          child: TextField(
                                            controller: controller.nameController,
                                            keyboardType: TextInputType.text,
                                            textAlignVertical: TextAlignVertical.center,
                                            style: styleW400S13.copyWith(
                                                fontSize: 14, color: ColorRes.black),
                                            decoration: InputDecoration(
                                              hintText: 'enter_name'.tr,
                                              hintStyle: styleW400S13.copyWith(
                                                  fontSize: 14,
                                                  color: ColorRes.greyColor),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                      color: ColorRes.borderColor,
                                                      width: 1)),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: ColorRes.borderColor,
                                                    width: 1),
                                              ),
                                            ),
                                          )
                                      ),
                                      appSizedBox(height: 15),
          
                                      Text(
                                        'OTP *'.tr,
                                        textAlign: TextAlign.start,
                                        style: styleW400S15.copyWith(
                                            fontSize: 16, color: ColorRes.black),
                                      ),
                                      appSizedBox(height: 5),
                                      Container(
                                          width: double.infinity,
                                          height: 45,
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
                                              hintText: 'enter_otp'.tr,
                                              hintStyle: styleW400S13.copyWith(
                                                  fontSize: 14,
                                                  color: ColorRes.greyColor),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                      color: ColorRes.borderColor,
                                                      width: 1)),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: ColorRes.borderColor,
                                                    width: 1),
                                              ),
                                            ),
                                          )
                                      ),
                                      appSizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: (){
                                            controller.loginWithPhoneNumber("register");
                                          },
                                          child: Text(
                                            'resend_code'.tr,
                                            textAlign: TextAlign.start,
                                            style: styleW400S16.copyWith(
                                                fontSize: 16, color: ColorRes.appRedColor),
                                          ),
                                        ),
                                      ),
          
                                      appSizedBox(height: 10),
                                      Text(
                                        'district'.tr,
                                        textAlign: TextAlign.start,
                                        style: styleW400S15.copyWith(
                                            fontSize: 16, color: ColorRes.black),
                                      ),
                                      appSizedBox(height: 5),
                                      Container(
                                        height: 40,
                                      child: CommonDropDownContainer(
                                        onChanged: (value) {
                                          setState(() {
                                            controller.districtController.text=value.toString();
                                          });

                                        },
                                        dropDownList:list,
                                        dropDownValue: controller.districtController.text.toString(),
                                        hintText: "",
                                      ),
                                    ),
                                      appSizedBox(height: 10),

                                      Text(
                                        'gender'.tr,
                                        textAlign: TextAlign.start,
                                        style: styleW400S15.copyWith(
                                            fontSize: 16, color: ColorRes.black),
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
                                                          controller.gender = "MALE";
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                          color: controller.gender == "MALE"
                                                              ? ColorRes.selectedTextColor
                                                              : ColorRes.white,
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(10),
                                                              bottomLeft: Radius.circular(10)),
                                                        ),
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            'male'.tr,
                                                            textAlign: TextAlign.center,
                                                            style: styleW400S17.copyWith(
                                                                fontSize: 16,
                                                                color: controller.gender ==
                                                                    "MALE"
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
                                                          controller.gender = "FEMALE";
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                          color: controller.gender == "FEMALE"
                                                              ? ColorRes.selectedTextColor
                                                              : ColorRes.white, ),
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            'female'.tr,
                                                            textAlign: TextAlign.center,
                                                            style: styleW400S17.copyWith(
                                                                fontSize: 14,
                                                                color: controller.gender ==
                                                                    "FEMALE"
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
                                                          controller.gender = "OTHER";
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                          color: controller.gender == "OTHER"
                                                              ? ColorRes.selectedTextColor
                                                              : ColorRes.white,
                                                          borderRadius: BorderRadius.only(
                                                              topRight: Radius.circular(10),
                                                              bottomRight: Radius.circular(10)),
                                                        ),
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            'other'.tr,
                                                            textAlign: TextAlign.center,
                                                            style: styleW400S17.copyWith(
                                                                fontSize: 14,
                                                                color: controller.gender ==
                                                                    "OTHER"
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
          
          
                                      Text(
                                        'dob'.tr,
                                        textAlign: TextAlign.start,
                                        style: styleW400S15.copyWith(
                                            fontSize: 16, color: ColorRes.black),
                                      ),
                                      appSizedBox(height: 5),
                                      InkWell(
                                        onTap:()=>{
                                          setState(() {
                                        controller.selectDate(context);
                                          })

                                        },
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
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 14),
                                                child: Text(
                                                  controller.dobController.text.toString(),
                                                  textAlign: TextAlign.start,
                                                  style: styleW400S15.copyWith(
                                                      fontSize: 16, color: ColorRes.black),
                                                ),
                                              ),
                                            )
                                        ),
                                      ),
                                      appSizedBox(height: 10),
          
                                      Text(
                                        'email'.tr,
                                        textAlign: TextAlign.start,
                                        style: styleW400S15.copyWith(
                                            fontSize: 16, color: ColorRes.black),
                                      ),
                                      appSizedBox(height: 5),
                                      Container(
                                          width: double.infinity,
                                          height: 45,
                                          child: TextField(
                                            controller: controller.emailController,
                                            keyboardType: TextInputType.text,
                                            textAlignVertical: TextAlignVertical.center,
                                            style: styleW400S13.copyWith(
                                                fontSize: 14, color: ColorRes.black),
                                            decoration: InputDecoration(
                                              hintText: 'enter_email'.tr,
                                              hintStyle: styleW400S13.copyWith(
                                                  fontSize: 14,
                                                  color: ColorRes.greyColor),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                      color: ColorRes.borderColor,
                                                      width: 1)),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: ColorRes.borderColor,
                                                    width: 1),
                                              ),
                                            ),
                                          )
                                      ),



                                      appSizedBox(height: 30),
                                      AppButton(
                                        onButtonTap: (){
                                          controller.registerViaMobileNumber(widget.mobileNumber);
                                        },
                                        buttonName: 'submit'.tr,
                                        textColor:ColorRes.white,
                                        backgroundColor:ColorRes.activatedButtonColor,
                                      ),
          
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ),
                        ),
                      ],
                    ));
              }),
        ));
  }

}




