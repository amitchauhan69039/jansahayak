import 'package:JanSahayak/model/family_record_model.dart';
import 'package:JanSahayak/jan_sahayak.dart';

import '../../../../model/mfmb_model.dart';
import '../../../../model/nearby_hospital_model.dart';

class NearbyHospitalController extends GetxController {
  bool loader = false;
  NearbyHospitalModel? nearbyHospitalModel;
  bool isVisible=false;
  String kmsColor="5";
  String selectedFilterValue="0";
  String searchValue="0";

  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }


  //Call ALLHospitalBasedOnKM Api
  Future<void>  getALLHospitalBasedOnKM() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['nearby_hospital_screen']);

      try {
        NearbyHospitalModel? model = await NearbyHospitalApi.getALLHospitalBasedOnKM(kmsColor,selectedFilterValue,searchValue,"30.3752","76.7821");

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            nearbyHospitalModel=model;

          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['nearby_hospital_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }
}