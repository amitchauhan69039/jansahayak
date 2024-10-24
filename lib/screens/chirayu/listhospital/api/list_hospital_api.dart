import 'package:JanSahayak/jan_sahayak.dart';
import '../../../../model/hospital_type_master_model.dart';
import '../../../../model/list_hospital_model.dart';
import '../../../../model/nearby_hospital_model.dart';

class ListHospitalApi{

  static Future<HospitalTypeMasterModel?> getHospitalTypeMaster() async {
    String url=EndPoints.getHospitalTypeMaster;
    Map<String,String> headers={"token":"token@123"};


    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers,
      );
      print("list_hospital_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          HospitalTypeMasterModel model = hospitalTypeMasterModelFromJson(responseBody);
          return model;
        } catch (e) {
          throw Exception("Unexpected response format: $responseBody");
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  static Future<ListHospitalModel?> getALLHospitalBasedOnDistrictAndSpec(String discrict,String shortCode,String search,String type) async {
    String url=EndPoints.getALLHospitalBasedOnDistrictAndSpec+discrict;
    Map<String,String> headers={"token":"token@123"};
    Map<String,String> params={
      "Type":type,
      "sSearch":search,
      "Spec":shortCode
    };


    try {
      final response = await HttpService.getApi(
        url: url,
        isContentType: true,
        headers: headers,
        queryParams: params
      );
      print("list_hospital_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          ListHospitalModel model = listHospitalModelFromJson(responseBody);
          return model;
        } catch (e) {
          throw Exception("Unexpected response format: $responseBody");
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }


}