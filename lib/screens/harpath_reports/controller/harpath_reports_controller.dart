import 'package:JanSahayak/model/family_record_model.dart';
import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/family_farmer_model.dart';
import '../../../model/harpath_report_model.dart';
import '../../../model/map_service_model.dart';
import '../../../utils/crypto_decrypt_utils.dart';

class HarpathReportsController extends GetxController {
  bool loader = false;
  HarpathReportModel? harpathReportModel;
  bool isTextShow=false;

  @override
  void onInit() {
    super.onInit();
    getHarpathReports();
  }


  //Call Report Api
  Future<void>  getHarpathReports() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['harpath_report']);

      Map<String, dynamic> queryParam = {
        'citizen_id': PrefService.getString(PrefKeys.HARPATH_CITIZEN_ID),
      };

      var data=json.encode(queryParam);
      print("json : ${data}");
      var encr= CryptoDecryptUtils.cryptoJsAesEncryptRequestModel(data);


      try {
        MapServiceModel? model = await HarpathReportsApi.getHarpathReports(encr);

        if (model != null) {
          var ss=jsonEncode(model);
          String decryptedData = CryptoDecryptUtils.cryptoJsAesDecrypt(ss);
          print("JsnData sent otp : ${decryptedData}");

          if(!decryptedData.isEmpty){
            Map<String, dynamic> jsonData = jsonDecode(decryptedData);
            String status =jsonData['status'].toString();
            String message =jsonData['Message'].toString();

            print("Message ${status} mmm ${message}");
            isTextShow=true;


            if(status=="1"){
              harpathReportModel=harpathReportModelFromJson(decryptedData);
              print("JsnData harpathReportModel : ${harpathReportModel.toString()}");
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
      update(['harpath_report']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

}