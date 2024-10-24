import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/family_farmer_model.dart';
import '../../../model/family_record_model.dart';
import '../../../model/mfmb_model.dart';
import '../../../model/property_svamitva_model.dart';

class PropertySvamitvaApi{

  static Future<PropertySvamitvaModel?> getPIDDetails() async {
    String url=EndPoints.getPIDData+PrefService.getString(PrefKeys.FamilyID);
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers
      );
      print("property_svamitva_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          PropertySvamitvaModel model = propertySvamitvaModelFromJson(responseBody);
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