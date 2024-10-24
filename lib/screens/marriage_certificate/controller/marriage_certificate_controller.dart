import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/marriage_certificate_model.dart';

class MarriageCertificateController extends GetxController {
  bool loader = false;
  MarriageCertificateModel? marriageCertificateModel;
  bool isVisible=false;


  @override
  void onInit() {
    super.onInit();
    getMarriageCertificateDataJava();
  }

  //Call Marriage Certificate Api
  Future<void>  getMarriageCertificateDataJava() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['marriage_certificate']);


      try {
        MarriageCertificateModel? model = await MarriageCertificateApi.getMarriageCertificateDataJava();

        if (model != null) {
          if (model.message!.toLowerCase() == "success".toLowerCase()) {
            marriageCertificateModel=model;
            isVisible=true;
            makePhoneCall(model.link!);
          }else{
            isVisible=false;

          }
        }
      } catch (e) {
        isVisible=false;
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['marriage_certificate']);
    }else{
      toastMsg("No Internet Available.");
    }
  }
}