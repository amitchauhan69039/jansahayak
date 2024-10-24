import 'package:JanSahayak/screens/home/api/home_api.dart';
import 'package:intl/intl.dart';
import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/java_token_model.dart';
import '../../../model/map_service_model.dart';
import '../../../model/saral_auth_model.dart';
import '../../../model/sub_service_model.dart';
import '../../../utils/crypto_decrypt_utils.dart';

class HarpathOtpController extends GetxController {
  bool loader = false;
  SaralAuthModel? saralAuthModel;
  TextEditingController otpController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController remainsTimeToResend = TextEditingController();
  String deviceId="";
  String name="";
  String mobile="";
  bool isResendEnable=false;
  int timeLeftInMillis =120000;
  String serverOTP="";

  @override
  Future<void> onInit() async {
    super.onInit();
    remainsTimeToResend.text="Remaing Time : ";
  //   startTimer();
  // //  deviceId=(await getDeviceId())!;
  //   if(PrefService.getString(PrefKeys.USER_ROLE)=="G"){
  //     name=PrefService.getString(PrefKeys.GUEST_NAME);
  //     mobile=PrefService.getString(PrefKeys.GUEST_MOBILE);
  //   }else{
  //     name=PrefService.getString(PrefKeys.FAMILY_MEMBERS_NAME);
  //     mobile=PrefService.getString(PrefKeys.FamilyMobile);
  //   }
  //
  //
  //   Map<String, dynamic> queryParam = {
  //     'name': name,
  //     'mobile': mobile,
  //     "uuid": "12345android"
  //   };
  //   var j=json.encode(queryParam);
  //   print("json : ${j}");
  //  var encr= CryptoDecryptUtils.cryptoJsAesEncryptRequestModel(j);
  //
  //
  //   var ss=jsonEncode(encr);
  //
  //
  //   print("encript : ${encr.ct}  ${encr.s}   ${encr.iv}");
  //   var dec= CryptoDecryptUtils.cryptoJsAesDecrypt(ss);
  //   String decryptedData = CryptoDecryptUtils.cryptoJsAesDecrypt(ss);
  //   print("JsnData : ${decryptedData}");
  //   print("decript : ${dec}");


    sendOTPToHarpathUSER();

  }


  //Call send Otp Api
  Future<void>  sendOTPToHarpathUSER() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['harpath_otp']);
      String name="";
      String mobile="";

      if(PrefService.getString(PrefKeys.USER_ROLE)=="G"){
        name=PrefService.getString(PrefKeys.GUEST_NAME);
        mobile=PrefService.getString(PrefKeys.GUEST_MOBILE);
      }else{
        name=PrefService.getString(PrefKeys.FAMILY_MEMBERS_NAME);
        mobile=PrefService.getString(PrefKeys.FamilyMobile);
      }

      Map<String, dynamic> queryParam = {
        'name': name,
        'mobile': mobile,
        "uuid": "12345android"
      };

      var data=json.encode(queryParam);
      print("json : ${data}");
      var encr= CryptoDecryptUtils.cryptoJsAesEncryptRequestModel(data);



      print("otp encrypt data : ${encr.iv}  c ${encr.ct} salt ${encr.s}");

      try {
        MapServiceModel? model = await HarpathOtpApi.sendOTPToHarpathUSER(encr);

        if (model != null) {

          var ss=jsonEncode(model);
          String decryptedData = CryptoDecryptUtils.cryptoJsAesDecrypt(ss);
          print("JsnData sent otp : ${decryptedData}");

          if(!decryptedData.isEmpty){
            Map<String, dynamic> jsonData = jsonDecode(decryptedData);
            String status =jsonData['status'];
            String message =jsonData['message'];
            if(status=="1"){

              serverOTP =jsonData['otp'].toString();

              print('serverOTP ${serverOTP}');
              String sms_msg =jsonData['sms_msg'];
              toastMsg(sms_msg);
              startTimer();
            }else{

              toastMsg(message);
            }
          }else{
            toastMsg("Api Failure ,Please check entered values !");
          }


        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['harpath_otp']);
    }else{
      toastMsg("No Internet Available.");
    }
  }




  //Call Register Api
  Future<void>  registerUserOnHarpath() async{

    if(otpController.text.toString().isEmpty){
      toastMsg("Please enter valid OTP!");
    }else if(otpController.text==serverOTP){

      if(await isInternetAvailable(context)){
        FocusManager.instance.primaryFocus?.unfocus();
        loader = true;
        update(['harpath_otp']);
        String name="";
        String mobile="";

        if(PrefService.getString(PrefKeys.USER_ROLE)=="G"){
          name=PrefService.getString(PrefKeys.GUEST_NAME);
          mobile=PrefService.getString(PrefKeys.GUEST_MOBILE);
        }else{
          name=PrefService.getString(PrefKeys.FAMILY_MEMBERS_NAME);
          mobile=PrefService.getString(PrefKeys.FamilyMobile);
        }

        Map<String, dynamic> queryParam = {
          'name': name,
          'mobile': mobile,
          'otp': otpController.text,
          "uuid": "12345android"
        };
        var data=json.encode(queryParam);
        var encr= CryptoDecryptUtils.cryptoJsAesEncryptRequestModel(data);

        try {
          MapServiceModel? model = await HarpathOtpApi.registerUserOnHarpath(encr);

          if (model != null) {
            var ss=jsonEncode(model);
            String decryptedData = CryptoDecryptUtils.cryptoJsAesDecrypt(ss);
            print("JsnData registerp : ${decryptedData}");


            if(!decryptedData.isEmpty){
              Map<String, dynamic> jsonData = jsonDecode(decryptedData);
              String status =jsonData['status'].toString();
              String message =jsonData['Message'].toString();
              String citizenId =jsonData['citizen_id'].toString();
              String accessToken =jsonData['access_token'].toString();

              toastMsg(message);
              PrefService.set(PrefKeys.HARPATH_NAME, name);
              PrefService.set(PrefKeys.HARPATH_MOBILE, mobile);
              PrefService.set(PrefKeys.HARPATH_ACCESS_TOKEN, accessToken);
              PrefService.set(PrefKeys.HARPATH_CITIZEN_ID, citizenId);

              Get.to(() => MapScreen());

            }else{
              toastMsg("Api Failure ,Please check entered values !");
            }

          }
        } catch (e) {
          debugPrint("Unexpected response format: ${e.toString()}");
        }

        loader = false;
        update(['harpath_otp']);
      }else{
        toastMsg("No Internet Available.");
      }
    }else{
      toastMsg('Please check your entered OTP !');
    }

  }

  void startTimer() {
    isResendEnable=false;
   // mResendHarpathOTP.setBackgroundColor(Colors.orange[200]); // Replace with your color

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeftInMillis <= 0) {
        timer.cancel();
       // mResendHarpathOTP.setBackgroundColor(Colors.orange[800]); // Replace with your color
        isResendEnable=true;
      } else {
        timeLeftInMillis -= 1000;
        updateTimerText();
      }
      update(['harpath_otp']);
    });
  }

  void updateTimerText() {
    int minutes = (timeLeftInMillis ~/ 1000) ~/ 60;
    int seconds = (timeLeftInMillis ~/ 1000) % 60;

    String timeLeftFormatted = "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    remainsTimeToResend.text = "Remaining time to resend OTP : $timeLeftFormatted";
    update(['harpath_otp']);
  }

}