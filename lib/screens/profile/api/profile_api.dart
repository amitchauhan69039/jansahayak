import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/model/download_model.dart';

import '../../../model/submit_rating_model.dart';

class ProfileApi{

  static Future<DownloadModel?> getDownload() async {
    String url=EndPoints.getDownload;
    Map<String,String> headers={"token":"token@123"};


    try {
      final response = await HttpService.getApi(
        url: url,
        isContentType: true,
        headers: headers,
      );
      print("settings: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          DownloadModel model = downloadModelFromJson(responseBody);
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