import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/family_farmer_model.dart';
import '../../../model/family_record_model.dart';
import '../../../model/mfmb_model.dart';

class MfmbApi{

  static Future<MfmbModel?> getMFMBCropData() async {
    String url=EndPoints.getMFMBCropData+PrefService.getString(PrefKeys.FamilyMemberID);
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
        url: url,
        isContentType: true,
        headers: headers
      );
      print("mfmb_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          MfmbModel model = mfmbModelFromJson(responseBody);
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