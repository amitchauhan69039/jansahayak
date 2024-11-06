import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/view_document_model.dart';

class FamilyViewDocumentApi{

  static Future<ViewDocumentModel?> getDocumnt() async {
    String url=EndPoints.GetDocument+PrefService.getString(PrefKeys.FamilyID);
    Map<String,String> headers={"token":"token@123"};


    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers,
      );
      print("family_view_document_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          ViewDocumentModel model = viewDocumentModelFromJson(responseBody);
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