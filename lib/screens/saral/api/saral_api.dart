import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/java_token_model.dart';
import '../../../model/saral_auth_model.dart';
import '../../../model/saral_service_model.dart';
import 'package:http/http.dart' as http;

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

  static Future<SaralAuthModel?> getSaralAuthData(String client_id,String headerParameter, String serviceID) async {
    String url=EndPoints.getSaralAuthData;
    Map<String,String> headers={"client_id":client_id,
      "header_parameter1":headerParameter
    };
    try {
      final response = await HttpService.postApi2(
        url: url,
        isContentType: true,
        headers: headers,
      );
      print("SaralAuthData: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          SaralAuthModel model = saralAuthModelFromJson(responseBody);

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

  static Future<JavaTokenModel?> getTokenFromJava(String mSaralServiceID,String authKey) async {
    String url=EndPoints.getTokenFromJava;
    Uri uri = Uri.parse(url);
    var content=jsonEncode({
      "data1":{
        "serviceid": mSaralServiceID,
        "hiddenValue":{
          "":{
            "name":PrefService.getString(PrefKeys.FamilyID),
            "address":"haryana"
          }
        }
      }
    });
    var body=jsonEncode(
        {
          "content":content,
          "token":authKey
        });
    print("getTokenFromJava11: ${body}");
    debugPrint("Url = $url");

    try {
      final response=await http.post(uri,
        body: body,
        headers: {'Content-Type': "application/json"},
      );

      print("getTokenFromJava: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          JavaTokenModel model = javaTokenModelFromJson(responseBody);
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