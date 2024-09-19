import 'package:JanSahayak/model/family_record_model.dart';
import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/family_farmer_model.dart';

class FamilyFarmerController extends GetxController {
  bool loader = false;
  FamilyFarmerModel? familyFarmerModel;
  FamilyRecordModel? familyRecordModel;
  TextEditingController yearController = TextEditingController();
  String year="";

  @override
  void onInit() {
    super.onInit();
    getKMSYears();
  }


  //Call KMSYears Api
  Future<void>  getKMSYears() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['family_farmer']);

      try {
        FamilyFarmerModel? model = await FamilyFarmerApi.getKMSYears();

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            yearController.text=model.data![0].value!;
            familyFarmerModel=model;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['family_farmer']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

  //Call KMSYears Api
  Future<void>  getRecords() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['family_farmer']);

      Map<String, dynamic> queryParam = {
        'SessionID': yearController.text,
        'PPPID': PrefService.getString(PrefKeys.FamilyID)
      };
      String memberID=PrefService.getString(PrefKeys.FamilyMemberID);
      if(memberID.length>4){

        var lastFourDigits = memberID.substring(memberID.length - 4);
        queryParam['MemID']=lastFourDigits;
      }else{
        queryParam['MemID']="";
      }

      try {
        FamilyRecordModel? model = await FamilyFarmerApi.getRecords(queryParam);

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            familyRecordModel=model;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['family_farmer']);
    }else{
      toastMsg("No Internet Available.");
    }
  }
}