import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/java_token_model.dart';
import '../../../model/map_service_model.dart';
import '../../../model/news_details_model.dart';
import '../../../model/news_list_model.dart';
import '../../../model/saral_auth_model.dart';
import '../../../model/saral_service_model.dart';
import 'package:http/http.dart' as http;

class NewsListApi{

  static Future<NewsListModel?> getNewsList(String date,String language) async {
    String url=EndPoints.getNewsDPRO;
    Map<String,String> body={
      "news_press_date":date,
      "lang_code":language

    };

    try {
      final response = await HttpService.postApi(
          url: url,
          isContentType: true,
          body: body,
      );
      print("news_list_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          NewsListModel model = newsListModelFromJson(responseBody);
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


  static Future<NewsDetailsModel?> getNewsDetails(String nid,String vid) async {
    String url=EndPoints.getNewsDetails;
    Map<String,String> body={
      "nid":nid,
      "vid":vid

    };

    try {
      final response = await HttpService.postApi(
        url: url,
        isContentType: true,
        body: body,
      );
      print("news_list_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          NewsDetailsModel model = newsDetailsModelFromJson(responseBody);
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



}

