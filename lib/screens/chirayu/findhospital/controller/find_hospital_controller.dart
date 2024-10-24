import 'package:JanSahayak/model/family_record_model.dart';
import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/model/speciality_model.dart';

import '../../../../model/district_model.dart';

class FindHospitalController extends GetxController {
  bool loader = false;
  DistrictModel? districtModel;
  SpecialityModel? specialityModel;
  String specialityString="";
  TextEditingController districtController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  String year="";
  bool isMainVisible=false;
  String noDataVisible="notVisible";
  String farmerId="---";
  String farmerMobileNo="---";
  String farmerName="---";
  String farmerFatherName="---";
  String farmerAccountNo="---";
  String farmerIfscCode="---";
  String farmerAccountStatus="---";
  String farmerMFMB="---";
  String accountStatus="0";

  @override
  void onInit() {
    super.onInit();
    getALLDistrict();
    getALLSpecialities();
  }


  //Call All District Api
  Future<void>  getALLDistrict() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['find_hospital']);



      try {
        DistrictModel? model = await FindHospitalApi.getALLDistrict();

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {

            districtModel=model;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['find_hospital']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

  //Call Service Api
  Future<void>  getALLSpecialities() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['find_hospital']);



      try {
        SpecialityModel? model = await FindHospitalApi.getALLSpecialities();

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {

            specialityModel=model;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['find_hospital']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

}