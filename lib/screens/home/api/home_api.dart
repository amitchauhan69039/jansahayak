import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/home_data_model.dart';

class HomeApi{

  static Future<HomeDataModel?> getHomeData() async {
    String url=EndPoints.getHomeData;
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
          HomeDataModel model = homeDataModelFromJson(responseBody);
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