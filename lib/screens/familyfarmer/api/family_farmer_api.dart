import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/family_farmer_model.dart';
import '../../../model/family_record_model.dart';
import '../../../model/saral_service_model.dart';

class FamilyFarmerApi{

  static Future<FamilyFarmerModel?> getKMSYears() async {
    String url=EndPoints.getKMSYears;
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
      );
      print("home: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          FamilyFarmerModel model = familyFarmerModelFromJson(responseBody);
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

  static Future<FamilyRecordModel?> getRecords(Map<String, dynamic>? queryParam) async {
    String url=EndPoints.getFamilyRecords;
    try {
      final response = await HttpService.getApi(
        url: url,
        isContentType: true,
        queryParams: queryParam
      );
      print("home: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          FamilyRecordModel model = familyRecordModelFromJson(responseBody);
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