import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/family_farmer_model.dart';
import '../../../model/family_record_model.dart';
import '../../../model/map_service_model.dart';

class HarpathReportsApi{

  static Future<MapServiceModel?> getHarpathReports(MapServiceModel encr) async {
    String url=EndPoints.getHarpathReports;
    Map<String, String> headers = {
      'token':  PrefService.getString(PrefKeys.HARPATH_ACCESS_TOKEN),
    };


    try {
      final response = await HttpService.postHarpathApi(
          url: url,
          header:headers,
          isContentType: true,
          body: encr
      );
      print("harpath_reports: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          MapServiceModel model = mapServiceModelFromJson(responseBody);
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