import 'package:JanSahayak/model/family_record_model.dart';
import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/family_farmer_model.dart';
import '../../../model/mfmb_model.dart';

class MfmbController extends GetxController {
  bool loader = false;
  MfmbModel? mfmbModel;
  bool isVisible=false;

  @override
  void onInit() {
    super.onInit();
    getMFMBCropData();
  }


  //Call KMSYears Api
  Future<void>  getMFMBCropData() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['mfmb_screen']);

      try {
        MfmbModel? model = await MfmbApi.getMFMBCropData();

        if (model != null) {
          if (model.success!.toLowerCase() == "success".toLowerCase()) {
            if(model.Payload!=null){
              isVisible=true;
              mfmbModel=model;
            }else{
              isVisible=false;
            }

          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['mfmb_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }
}