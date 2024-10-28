import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/model/download_model.dart';

import '../../../model/family_id_member_model.dart';
import '../../../model/submit_rating_model.dart';

class ProfileApi {

  static Future<FamilyIdMemberModel?> getDataFromFamilyID(String familyId) async {
    String url = EndPoints.loginWithFamilyID + familyId;
    Map<String, String> headers = {"token": "token@123"};
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers
      );
      print("profile_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          FamilyIdMemberModel model = familyIdMemberModelFromJson(responseBody);
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