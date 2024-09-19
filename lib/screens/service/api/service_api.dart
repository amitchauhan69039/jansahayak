import 'package:JanSahayak/jan_sahayak.dart';

class ServiceApi{

  static Future<ServiceDataModel?> getServiceData() async {
    String url=EndPoints.getServiceData;
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
          ServiceDataModel model = serviceDataModelFromJson(responseBody);
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