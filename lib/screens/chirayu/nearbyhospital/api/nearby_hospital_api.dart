import 'package:JanSahayak/jan_sahayak.dart';

import '../../../../model/mfmb_model.dart';
import '../../../../model/nearby_hospital_model.dart';

class NearbyHospitalApi{

  static Future<NearbyHospitalModel?> getALLHospitalBasedOnKM(String Kms,String selectedFilterValue,String search,String lat,String long) async {
    String url=EndPoints.getALLHospitalBasedOnKM+Kms;
    Map<String,String> headers={"token":"token@123"};

    Map<String,String> params={
      "Type":selectedFilterValue,
      "sSearch":search,
      "Lat":lat,
      "Long":long
    };
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers,
        queryParams: params
      );
      print("nearby_hospital_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          NearbyHospitalModel model = nearbyHospitalModelFromJson(responseBody);
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