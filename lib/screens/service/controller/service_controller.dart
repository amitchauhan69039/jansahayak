import 'package:JanSahayak/screens/home/api/home_api.dart';
import 'package:intl/intl.dart';
import 'package:JanSahayak/jan_sahayak.dart';

class ServiceController extends GetxController {
  bool loader = false;
  ServiceData? data;

  @override
  void onInit() {
    super.onInit();
    getServiceData();
  }


  //Call Service Api
  Future<void>  getServiceData() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['service']);



      try {
        ServiceDataModel? model = await ServiceApi.getServiceData();

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {

            data=model.data!;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['service']);
    }else{
      toastMsg("No Internet Available.");
    }


  }
}