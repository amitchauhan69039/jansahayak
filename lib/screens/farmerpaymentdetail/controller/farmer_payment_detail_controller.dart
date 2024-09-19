import 'package:JanSahayak/model/family_record_model.dart';
import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/family_farmer_model.dart';
import '../../../model/farmer_payment_detail_model.dart';

class FarmerPaymentDetailController extends GetxController {
  bool loader = false;
  FarmerPaymentDetailModel? farmerPaymentDetailModel;
  FamilyRecordModel? familyRecordModel;
  TextEditingController yearController = TextEditingController();
  String year="";
  bool isMainVisible=false;
  String farmerId="---";
  String farmerMobileNo="---";
  String farmerName="---";
  String farmerFatherName="---";
  String farmerAccountNo="---";
  String farmerIfscCode="---";
  String farmerAccountStatus="---";
  String farmerMFMB="---";
  String accountStatus="0";
  String status="";

  @override
  void onInit() {
    super.onInit();
  }

  //Call KMSYears Api
  Future<void>  getFarmerPaymentDetail(String sessionID,String jFormID) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['family_farmer']);

      Map<String, dynamic> queryParam = {
        'SessionID': sessionID,
        'JFormID': jFormID
      };


      try {
        FarmerPaymentDetailModel? model = await FarmerPaymentDetailApi.getFarmerPaymentDetail(queryParam);

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            farmerPaymentDetailModel=model;
            if(model.data!.length>0){
              if(model.data![0].PaymentStatus=="Failed"){
                status="Failed";

              }else if(model.data![0].PaymentStatus=="Final Payment Response Awaited from Bank"){

                status="Bank";
              }else{
                status="Empty";

              }
            }else{
              isMainVisible=false;
            }
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