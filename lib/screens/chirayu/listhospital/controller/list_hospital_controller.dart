import 'package:JanSahayak/jan_sahayak.dart';
import '../../../../model/hospital_type_master_model.dart';
import '../../../../model/list_hospital_model.dart';
import '../../../../model/nearby_hospital_model.dart';

class ListHospitalController extends GetxController {
  bool loader = false;
  HospitalTypeMasterModel? hospitalTypeMasterModel;
  ListHospitalModel? listHospitalModel;
  bool isVisible=false;
  String kmsColor="5";
  String selectedFilterValue="0";
  String searchValue="0";
  String discrict="0";
  String shortCode="0";
  int hospitalTypeValue=0;


  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

  }


  //Call getHospitalTypeMaster Api
  Future<void>  getHospitalTypeMaster() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['list_hospital_screen']);

      try {
        HospitalTypeMasterModel? model = await ListHospitalApi.getHospitalTypeMaster();

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            hospitalTypeMasterModel=model;

          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['list_hospital_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

  //Call getALLHospitalBasedOnDistrictAndSpec Api
  Future<void>  getALLHospitalBasedOnDistrictAndSpec() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['list_hospital_screen']);

      try {
        ListHospitalModel? model = await ListHospitalApi.getALLHospitalBasedOnDistrictAndSpec(discrict, shortCode, searchValue, hospitalTypeValue.toString());

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            listHospitalModel=model;

          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['list_hospital_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

}