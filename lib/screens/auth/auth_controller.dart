import 'package:JanSahayak/jan_sahayak.dart';
import 'package:intl/intl.dart';
import '../../model/family_id_member_model.dart';
import '../../model/static_member_model.dart';

class AuthController extends GetxController {
  bool loader = false;
  bool verifyLoader = false;
  String phoneNumberErrorText = "";
  String passwordErrorText = "";
  bool rememberPassword = false;
  String enteredOTP ="";
  String verifyOtpError= "";
  int otpTimer = 120;
  bool isEnable=false;
  bool isDialog=false;
  Timer? timer;
  bool isFamilyID=true;
  bool showTimer = true;
  bool timerStarted = false;
  String otpReceived = "";
  String gender = "MALE";
  String resentOtp = "";
  String otpUser="";
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController pinEditingController = TextEditingController();
  TextEditingController familyIdController = TextEditingController();
  TextEditingController otpNumberController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpNumberVerify2Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController dobController = TextEditingController(text: 'enter_dob'.tr);
  TextEditingController districtController = TextEditingController(text: 'select_distric_hint'.tr);
  List<DropdownEntity>? dropdownList= [];

  
  onResendOtp() async {
    pinEditingController.clear();
    verifyOtpError = "";
    verifyLoader = true;
    update(['verify']);


    // Wait for the resendOtp function to complete
   // await resendOtp();

    verifyLoader = false;
    update(['verify']);
  }

  timerTap() {
    otpTimer = 120;
    showTimer = true;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      otpTimer--;
      if (otpTimer == 0) {
        showTimer = false;
        timer!.cancel();
      }
      update(['verify']);
    });
  }




  Future<void> checkLogin(BuildContext mContext,String screen) async {
    if(isEnable) {
      if (isFamilyID) {
          if (familyIdController.text.toString().isEmpty) {
            toastMsg("Please enter valid family id !");
          } else {

            // Login With Family ID
            loginWithFamilyiD(mContext);
          }
        } else {
          if (mobileController.text.toString().isEmpty && mobileController.text.toString().length != 10 &&
              !validateMobile(mobileController.text.toString())) {

            toastMsg("Please enter valid mobile number !");
          }
          else {
            // LoginWIth Phone Number
           loginWithPhoneNumber(screen);
          }
        }
    }

  }



  //call Api with Phone number
  Future<void> loginWithPhoneNumber(String screen) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      if(screen=="otp"){
        update(['otp_screen2']);
      }else if(screen=="register"){
        update(['register']);

      }else{
        update(['login']);
      }

      try {
        LoginModel? model = await AuthApi.userLogin(
            mobileController.text.toString());

        if (model != null) {
          if (model.status == "Success") {
            if(screen=="otp"){
              toastMsg("OTP has been resent on your mobile !");

            }else if(screen=="register"){

              toastMsg("OTP has been resent on your mobile !");
            }else{
              if (model.message!.contains("Not Registered")) {
                toastMsg(model.message!);
                Get.to(() => GuestRegisterScreen(mobileNumber: mobileController.text.toString()));
              } else {
                toastMsg(model.message.toString());
                Get.to(() => OtpVerify2Screen(mobileNumber: mobileController.text.toString()));
              }
            }

          } else {
            toastMsg(model.message.toString());
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      if(screen=="otp"){
        update(['otp_screen2']);
      }else if(screen=="register"){
        update(['register']);

      }else{
        update(['login']);
      }
    }else{
      toastMsg("No Internet Available.");
    }

  }

  //Call api with family member
  Future<void>  loginWithFamilyiD(BuildContext mContext) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['login']);



      try {
        FamilyIdMemberModel? model = await AuthApi.userLoginWithFamilyId(
            familyIdController.text.toString());

        if (model != null) {
          if (model.status == "Successfull") {
            if (model.result!=null) {
              for(int i=0;i<model.result!.dropdown!.length;i++){
               dropdownList?.add( model.result!.dropdown![i]);
              }
              isDialog=true;

              showFamilyMemberDialog(mContext);
              //Navigator.pop(this.context, true);
            } else {
              toastMsg("No Data found !");
            }
          } else {
            toastMsg(model.message.toString());
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['login']);
    }else{
      toastMsg("No Internet Available.");
    }


  }

  //Call api for otp request
  Future<void>  otpRequestForMEMID(String memberID) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['login']);

      Map<String, dynamic>? queryParams={"PPPID": familyIdController.text.toString().trim()};

      try {
        OtpRequestMemidModel? model = await AuthApi.otpRequestForMEMID(memberID,queryParams);

        if (model != null) {
          if (model.status == "Successfull") {

            Get.to(() => OptVerificationScreen(message: model.result!.message!.toString(),familyId:  familyIdController.text.toString().trim(),
            txn:  model.result!.txn!.toString(),memberId:  memberID,user: "Successfull",mobileNumber: "",));
          } else if(model.status == "Success") {
            Get.to(() => OptVerificationScreen(message: "".toString(),familyId:  familyIdController.text.toString().trim(),
                txn:  "",memberId:  memberID,user: "Success",mobileNumber: model.result!.mobileNo!));

          } else if(model.status == "Failed"){
            toastMsg(model.message.toString());
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['login']);
    }else{
      toastMsg("No Internet Available.");
    }


  }

  //Call api for verify otp
  Future<void>  verifyOtp(String memberID,String txn,String familyId,BuildContext mContext) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['otp_screen']);


      Map<String, dynamic> queryParam = {
        'PPPID': familyId,
        'TranactionId': txn,
        'Tokenid': "hgjdfgjkbb",
        "OTP": otpNumberController.text.toString().trim()
      };


      try {
        VerifyOtpModel? model = await AuthApi.verifyOtp(memberID,queryParam);

        if (model != null) {
          if (model.output?.toLowerCase() == "Successfull".toLowerCase() || model.output?.toLowerCase() == "Success".toLowerCase()) {
            if(!model.data!.isEmpty){
              PrefService.set(PrefKeys.FamilyID, model.data![0].pppid);
              PrefService.set(PrefKeys.FamilyEmail, model.data![0].familyemail);
              PrefService.set(PrefKeys.FamilyMobile, model.data![0].familymobile);
              PrefService.set(PrefKeys.FamilyMemberID, model.data![0].memberid);
              PrefService.set(PrefKeys.FAMILY_MEMBERS_NAME, model.data![0].familyname);
              PrefService.set(PrefKeys.DISTRICT, model.data![0].address);
              PrefService.set(PrefKeys.SEX, model.data![0].gender);
              PrefService.set(PrefKeys.AGE, model.data![0].dob);
              PrefService.set(PrefKeys.USER_ROLE,"P");
              PrefService.set(PrefKeys.INIT_F, "0");

              int position=0;
              List<StaticMemberModel> list=[];
              for(int i=0;i<model.data!.length;i++){
                list.add(StaticMemberModel(memberID: model.data![i].memberid!,memberName: model.data![i].familyname!,id: model.data![i].userId!,
                    pppid: model.data![i].pppid!,gender: model.data![i].gender!,mobile: model.data![i].familymobile!,
                    Address: model.data![i].address!,DOB: model.data![i].dob!));

                if(memberID.trim()==model.data![i].memberid!){
                  PrefService.set(PrefKeys.MEMBER_POSITION, position);
                }

                position++;
              }
              print("LISTtttttttt : ${list.toString()}");

              StaticMemberData staticMemberData=StaticMemberData(list);

              String membersStringList = jsonEncode(staticMemberData);

              print("LISTtttttttt1212 :${membersStringList}");

              PrefService.set(PrefKeys.FAMILY_MEMBERS, membersStringList);

              if(otpUser=="Successfull"){
                Get.offAll(()=> const HomeScreen());
              }else{
                Navigator.pop(mContext);
              }


            }else{
              toastMsg(" getData ELSE ${model.reason}");
            }
          } else  {
            toastMsg( "Please Enter Valid OTP");
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['otp_screen']);
    }else{
      toastMsg("No Internet Available.");
    }


  }

  Future<void>  verifyOtp2(String memberID,String mobile) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['otp_screen']);


      Map<String, dynamic> queryParam = {
        'Mobile_Email': mobile,
        'Name': "",
        'Tokenid': "hgjdfgjkbb",
      };


      try {
        VerifyOtpModel? model = await AuthApi.verifyOtp2(otpNumberController.text.toString().trim(),queryParam);

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            if(!model.data!.isEmpty){
              PrefService.set(PrefKeys.FamilyID, model.data![0].pppid);
              PrefService.set(PrefKeys.FamilyEmail, model.data![0].familyemail);
              PrefService.set(PrefKeys.FamilyMobile, model.data![0].familymobile);
              PrefService.set(PrefKeys.FamilyMemberID, model.data![0].memberid);
              PrefService.set(PrefKeys.FAMILY_MEMBERS_NAME, model.data![0].familyname);
              PrefService.set(PrefKeys.DISTRICT, model.data![0].address);
              PrefService.set(PrefKeys.SEX, model.data![0].gender);
              PrefService.set(PrefKeys.AGE, model.data![0].dob);
              PrefService.set(PrefKeys.USER_ROLE,"P");
              PrefService.set(PrefKeys.INIT_F, "0");

              int position=0;
              List<StaticMemberModel> list=[];
              for(int i=0;i<model.data!.length;i++){
                list.add(StaticMemberModel(memberID: model.data![i].memberid!,memberName: model.data![i].familyname!,id: model.data![i].userId!,
                    pppid: model.data![i].pppid!,gender: model.data![i].gender!,mobile: model.data![i].familymobile!,
                    Address: model.data![i].address!,DOB: model.data![i].dob!));

                if(memberID.trim()==model.data![i].memberid!){
                  PrefService.set(PrefKeys.MEMBER_POSITION, position);
                }
                position++;
              }
              print("LISTtttttttt : ${list.toString()}");

              StaticMemberData staticMemberData=StaticMemberData(list);

              String membersStringList = jsonEncode(staticMemberData);

              print("LISTtttttttt1212 :${membersStringList}");

              PrefService.set(PrefKeys.FAMILY_MEMBERS, membersStringList);


              Get.offAll(()=> const HomeScreen());

            }else{
              toastMsg(" getData ELSE ${model.reason}");
            }
          } else  {
            toastMsg( "Please Enter Valid OTP");
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['otp_screen']);
    }else{
      toastMsg("No Internet Available.");
    }


  }


  //Call api for register mobile number
  Future<void>  registerViaMobileNumber(String mobileNumber) async{

    if (nameController.text.toString().isEmpty) {
      toastMsg("Please enter your name !");
    }else  if (otpController.text.toString().isEmpty) {
      toastMsg("Please enter otp !");
    }else  if (districtController.text.toString()=='select_distric_hint'.tr) {
      toastMsg("Please select district !");
    }else  if (dobController.text.toString()=='enter_dob'.tr) {
      toastMsg("Please eselect date of birth !");
    }else  if (emailController.text.toString().isEmpty) {
      toastMsg("Please enter email !");
    }else{
      if(await isInternetAvailable(context)){
        FocusManager.instance.primaryFocus?.unfocus();
        loader = true;
        update(['register']);


        Map<String, dynamic> queryParam = {
          'Name': nameController.text.toString().trim(),
          'Email': emailController.text.toString().trim(),
          'District': districtController.text.toString().trim(),
          "dob": dobController.text.toString().trim(),
          "Code": otpController.text.toString().trim(),
          "Token": "jkdfkjdf"
        };


        try {
          RegisterMobileModel? model = await AuthApi.registerViaMobileNumber(mobileNumber,queryParam);

          if (model != null) {
            if (model.output=="success") {
              if(model.data!=null){

                PrefService.set(PrefKeys.GUEST_ID, model.data![0].id);
                PrefService.set(PrefKeys.GUEST_EMAIL, model.data![0].email);
                PrefService.set(PrefKeys.GUEST_NAME, model.data![0].name);
                PrefService.set(PrefKeys.GUEST_MOBILE, mobileNumber);
                PrefService.set(PrefKeys.GUEST_DISTRICT, model.data![0].address);
                PrefService.set(PrefKeys.GUEST_GENDER, model.data![0].gender);
                PrefService.set(PrefKeys.GUEST_DOB, model.data![0].dOB);
                PrefService.set(PrefKeys.USER_ROLE,"G");
                PrefService.set(PrefKeys.INIT_F, "0");

                Get.offAll(()=> const HomeScreen());

              }else{
                toastMsg("No Data found !");
              }
            } else  {
              toastMsg( " ${model.data!}");
            }
          }
        } catch (e) {
          debugPrint("Unexpected response format: ${e.toString()}");
        }

        loader = false;
        update(['register']);
      }else{
        toastMsg("No Internet Available.");
      }
    }
  }

  //Call api for verify Guest User otp
  Future<void>  verifyOtpGuestUserRequest(String mobileNumber) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['otp_screen2']);


      Map<String, String> queryParam = {
        'Mobile_Email': mobileNumber,
        'Tokenid': "hgjdfgjkbb",
      };


      try {
        RegisterMobileModel? model = await AuthApi.verifyOtpGuestUserRequest(otpNumberVerify2Controller.text.toString().trim(),queryParam);

        if (model != null) {
          print("mdoel");
          if (model.output!.toLowerCase() == "success".toLowerCase()) {

            if(model.data!=null){

              if(model.data!.length>0){

                if(model.data![0]!=null){

                  PrefService.set(PrefKeys.GUEST_ID, model.data![0].id);
                  PrefService.set(PrefKeys.GUEST_EMAIL, model.data![0].email);
                  PrefService.set(PrefKeys.GUEST_NAME, model.data![0].name);
                  PrefService.set(PrefKeys.GUEST_MOBILE, mobileNumber);
                  PrefService.set(PrefKeys.GUEST_DISTRICT, model.data![0].address);
                  PrefService.set(PrefKeys.GUEST_GENDER, model.data![0].gender);
                  PrefService.set(PrefKeys.GUEST_DOB, model.data![0].dOB);
                  PrefService.set(PrefKeys.USER_ROLE,"G");
                  PrefService.set(PrefKeys.INIT_F, "0");

                  Get.offAll(()=> const HomeScreen());
                }
              }
            }

          } else  {
            toastMsg( "Please Enter Valid OTP");
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['otp_screen2']);
    }else{
      toastMsg("No Internet Available.");
    }


  }


  checkOtpMatch(String enteredOTP) {
    Get.offAll(()=> HomeScreen());
  }

  Future<bool> onWillPop() async {

    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }



  Future<void>  showFamilyMemberDialog(BuildContext mContext) async{
    final alert = AlertDialog(
        contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 45,
                color: ColorRes.appPrimaryDarkColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(mContext);
                        },
                        child: Image.asset(
                          AssetRes.whiteBackIcon,
                          height: 25,
                          width: 25,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Family members',
                            style: styleW700S14.copyWith(
                                fontSize: 12,
                                color: ColorRes.white),
                          ),
                        ),
                      )

                    ],
                  ),

                ),
              ),
              Column(
                children:dropdownList!.map((item) =>
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 4,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                appSizedBox(width: 10),
                                Image.asset(
                                  AssetRes.profileIcon,
                                  height: 30,
                                  width: 30,
                                ),
                                appSizedBox(width: 10),
                                Text(
                                  textAlign: TextAlign.center,
                                  item.text!,
                                  style: styleW700S43.copyWith(
                                      fontSize: 15,
                                      color: ColorRes.black),
                                ),
                                Expanded(
                                    child:Align(
                                      alignment: Alignment.centerRight,
                                      child: AppBorderButton(
                                        onButtonTap:()=>{
                                        otpRequestForMEMID(item.value!)
                                        },
                                        buttonName: "Select".tr.toUpperCase(),
                                        buttonHeight: 25,
                                        buttonWidth: 60,
                                        fontSize: 10,
                                        backgroundColor: ColorRes.buttonBgColor,
                                        textColor: ColorRes.buttonTextColor,
                                        borderWidth: 1,
                                        borderColor: ColorRes.buttonBorderColor,
                                      ),
                                    )
                                ),
                                appSizedBox(width: 20)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                ).toList(),
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


  selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
    );
    dobController.text = DateFormat('dd-MM-yyyy').format(picked!);
    update(['register']);
  }
}
