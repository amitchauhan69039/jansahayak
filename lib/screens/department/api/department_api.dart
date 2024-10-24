import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/department_data_model.dart';

class DepartmentApi{

  static Future<DepartmentDataModel?> getDepartmentData(String id,Map<String, dynamic>? queryParam) async {
    String url=EndPoints.getDepartmentData+id;
    Map<String,String> headers={"token":"token@123"};
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers,
          queryParams: queryParam
      );
      print("home: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          DepartmentDataModel model = departmentDataModelFromJson(responseBody);
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