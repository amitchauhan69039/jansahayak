import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/map_service_model.dart';
import '../../../model/sub_service_model.dart';

class HarpathOtpApi{

  static Future<MapServiceModel?> sendOTPToHarpathUSER(MapServiceModel encr) async {
    String url=EndPoints.getHarPathOTP;

    try {
      final response = await HttpService.postHarpathApi(
          url: url,
          isContentType: true,
        body: encr
      );
      print("harpath_otp: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          MapServiceModel model = mapServiceModelFromJson(responseBody);
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

  static Future<MapServiceModel?> registerUserOnHarpath(MapServiceModel encr) async {
    String url=EndPoints.registerHarPathUser;

    try {
      final response = await HttpService.postHarpathApi(
          url: url,
          isContentType: true,
          body: encr
      );
      print("harpath_otp: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          MapServiceModel model = mapServiceModelFromJson(responseBody);
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