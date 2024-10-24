import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/family_farmer_model.dart';
import '../../../model/family_record_model.dart';
import '../../../model/farmer_payment_detail_model.dart';
import '../../../model/marriage_certificate_model.dart';
import '../../../model/saral_service_model.dart';
import 'package:http/http.dart' as http;

class MarriageCertificateApi{



  static Future<MarriageCertificateModel?> getMarriageCertificateDataJava() async {
    String url=EndPoints.getMarriageCertificateJava;
    Uri uri = Uri.parse(url);

    var body=jsonEncode(
        {
          "familyID":PrefService.getString(PrefKeys.FamilyID),
          "memberID":PrefService.getString(PrefKeys.FamilyMemberID)
        });
    print("getMarriageCertificateDataJava: ${body}");
    debugPrint("Url = $url");

    try {
      final response=await http.post(uri,
        body: body,
        headers: {'token': "token@123"},
      );

      print("getMarriageCertificateDataJava: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          MarriageCertificateModel model = marriageCertificateModelFromJson(responseBody);
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