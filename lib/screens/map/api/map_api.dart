import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/map_service_model.dart';

class MapApi{


  static Future<MapServiceModel?> getmap() async {
    String url=EndPoints.getMapService;

    try {
      final response = await HttpService.getApi(
        url: url,
        isContentType: true,
      );
      print("news_list_screen: ${response?.body}");

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

  static Future<MapServiceModel?> getRoadName(MapServiceModel encr) async {
    String url=EndPoints.getRoadAttributes;
    Map<String, String> headers = {
      'token':  PrefService.getString(PrefKeys.HARPATH_ACCESS_TOKEN),
    };


    try {
      final response = await HttpService.postHarpathApi(
          url: url,
          header:headers,
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

  static Future<MapServiceModel?> postReportData(MapServiceModel encr) async {
    String url=EndPoints.registerComplaint;
    Map<String, String> headers = {
      'token':  PrefService.getString(PrefKeys.HARPATH_ACCESS_TOKEN),
    };


    try {
      final response = await HttpService.postHarpathApi(
          url: url,
          header:headers,
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

