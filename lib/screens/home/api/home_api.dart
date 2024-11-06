import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/all_record_model.dart';
import '../../../model/family_id_serach_model.dart';
import '../../../model/home_data_model.dart';

class HomeApi{

  static Future<HomeDataModel?> getHomeData() async {
    String url=EndPoints.getHomeData;
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers
      );
      print("home: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          HomeDataModel model = homeDataModelFromJson(responseBody);
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

  static Future<FamilyIdSerachModel?> familyIdSearchForTXN() async {
    String url=EndPoints.familyIdSearchForTXN+PrefService.getString(PrefKeys.FamilyID);
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers
      );
      print("home: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          FamilyIdSerachModel model = familyIdSerachModelFromJson(responseBody);
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

  static Future<AllRecordModel?> getFamilyIdDetails(String otp,String txn) async {
    String url=EndPoints.GetFamilyDetail+PrefService.getString(PrefKeys.FamilyID);

    double ss=0.0;
    Map<String,String> params={
      "TranactionId":txn,
      "OTP":otp
    };
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          queryParams: params,
          headers: headers
      );
      print("home: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          AllRecordModel model = allRecordModelFromJson(responseBody);
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