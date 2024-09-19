import 'package:JanSahayak/model/home_data_model.dart';
import 'package:JanSahayak/screens/home/api/home_api.dart';
import 'package:intl/intl.dart';
import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/department_data_model.dart';
import '../../../model/saral_service_model.dart';

class DepartmentController extends GetxController {
  bool loader = false;
  DepartmentDataModel? data;

  @override
  void onInit() {
    super.onInit();
  }


  //Call Service Api
  Future<void>  getDepartmentData(String id,String search) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['department']);
      Map<String, dynamic> queryParam = {
        'sSearch': search,
      };


      try {
        DepartmentDataModel? model = await DepartmentApi.getDepartmentData(id,queryParam);

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            data=model;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['department']);
    }else{
      toastMsg("No Internet Available.");
    }
  }
}