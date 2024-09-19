import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/saral_service_model.dart';

class SaralApi{

  static Future<SaralServiceModel?> getSaralData(String search) async {
    String url=EndPoints.getSaralData+search;
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
          SaralServiceModel model = saralServiceModelFromJson(responseBody);
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