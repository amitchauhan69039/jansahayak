import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/submit_rating_model.dart';

class SettingsApi{

  static Future<SubmitRatingModel?> getServiceData(String rating, String remarksValue) async {
    String url=EndPoints.submitRatings+PrefService.getString(PrefKeys.FamilyMemberID);
    Map<String,String> headers={"token":"token@123"};
    Map<String,String> queryParams={
      "Rating":rating,
      "Appfeedback":remarksValue
    };


    try {
      final response = await HttpService.postApi2(
          url: url,
          isContentType: true,
          headers: headers,
        queryParams: queryParams
      );
      print("settings: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          SubmitRatingModel model = submitRatingModelFromJson(responseBody);
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