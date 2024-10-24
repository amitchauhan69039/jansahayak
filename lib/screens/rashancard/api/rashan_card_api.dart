import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/family_farmer_model.dart';
import '../../../model/family_record_model.dart';
import '../../../model/rashan_card_model.dart';

class RashanCardApi{

  static Future<RashanCardModel?> getRashanCardData() async {
    String url=EndPoints.getRationCardData+PrefService.getString(PrefKeys.FamilyID);
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers
      );
      print("rashan_card: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          RashanCardModel model = rashanCardModelFromJson(responseBody);
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