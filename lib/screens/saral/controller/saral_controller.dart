import 'package:JanSahayak/model/home_data_model.dart';
import 'package:JanSahayak/screens/home/api/home_api.dart';
import 'package:intl/intl.dart';
import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/java_token_model.dart';
import '../../../model/saral_auth_model.dart';
import '../../../model/saral_service_model.dart';

class SaralController extends GetxController {
  bool loader = false;
  SaralServiceModel? data;

  @override
  void onInit() {
    super.onInit();
    getSaralData("");
  }


  //Call Service Api
  Future<void>  getSaralData(String search) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['saral']);

      try {
        SaralServiceModel? model = await SaralApi.getSaralData(search);

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            data=model;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['saral']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

  //Call Saral Api
  Future<void>  getSaralAuthData(String header,String headers,String mSaralServiceID) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['subService']);


      try {
        SaralAuthModel? model = await SubServiceApi.getSaralAuthData(header,headers);

        if (model != null) {
          if (model.statusCode == 200) {


            getTokenFromJava(model.token!.trim(), model.referenceNo!, mSaralServiceID);


          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['subService']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

  //Call Api for token
  Future<void>  getTokenFromJava(String authKey,String refNo,String mSaralServiceID) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['subService']);

      var bodyParams={};
      var body={};
      var data1={};
      var serviceid={};
      var hiddenValue={};
      var name={};
      var address={};

      name["name"]=PrefService.getString(PrefKeys.FamilyID);
      name["address"]="haryana";
      hiddenValue[""]=name;
      data1["serviceid"]=mSaralServiceID;
      data1["hiddenValue"]=hiddenValue;

      body["data1"] = data1;

      print("body ${body}");



      bodyParams["content"] = body;
      bodyParams["token"] = authKey;


      Map<String, dynamic> params = {
        "data1":{
          "serviceid": mSaralServiceID,
          "hiddenValue":{
            "":{
              "name":PrefService.getString(PrefKeys.FamilyID),
              "address":"haryana"
            }
          }

        }
      };

      var content=json.encode(params);

      Map<String, String> bodyparams={
        "content":body.toString(),
        "token":authKey
      };





      try {
        JavaTokenModel? model = await SubServiceApi.getTokenFromJava(mSaralServiceID,authKey);

        if (model != null) {

          String mUrl="https://jansahayak.haryana.gov.in/saraltest.aspx?reference_no="+refNo+"&encrypted_details="+model.enycValue!;
          makePhoneCall(mUrl);

        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['subService']);
    }else{
      toastMsg("No Internet Available.");
    }
  }
}