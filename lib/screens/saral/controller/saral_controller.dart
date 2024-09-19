import 'package:JanSahayak/model/home_data_model.dart';
import 'package:JanSahayak/screens/home/api/home_api.dart';
import 'package:intl/intl.dart';
import 'package:JanSahayak/jan_sahayak.dart';

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
}