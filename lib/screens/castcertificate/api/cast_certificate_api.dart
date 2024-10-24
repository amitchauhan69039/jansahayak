import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/cast_certificate_model.dart';
import '../../../model/family_farmer_model.dart';
import '../../../model/family_record_model.dart';
import '../../../model/mfmb_model.dart';
import '../../../model/property_svamitva_model.dart';

class CastCertificateApi{

  static Future<CastCertificateModel?> getCastCiertificateData() async {
    String url=EndPoints.getCastCiertificateData+PrefService.getString(PrefKeys.FamilyID);
    Map<String,String> headers={"token":"token@123"};
    Map<String,String> queryParam={
      "MemberId":PrefService.getString(PrefKeys.FamilyMemberID),
      "type":"Caste"
    };

    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers,
        queryParams: queryParam
      );
      print("cast_certificate_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          CastCertificateModel model = castCertificateModelFromJson(responseBody);
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