import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/model/speciality_model.dart';

import '../../../../model/district_model.dart';

class FindHospitalApi{

  static Future<DistrictModel?> getALLDistrict() async {
    String url=EndPoints.getALLDistrict;
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers,
      );
      print("find_hospital: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          DistrictModel model = districtModelFromJson(responseBody);
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



  static Future<SpecialityModel?> getALLSpecialities() async {
    String url=EndPoints.getALLSpecialities;
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
        url: url,
        isContentType: true,
        headers: headers,
      );
      print("find_hospital: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          SpecialityModel model = specialityModelFromJson(responseBody);
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