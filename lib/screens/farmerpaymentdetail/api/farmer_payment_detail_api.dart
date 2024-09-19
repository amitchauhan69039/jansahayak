import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/family_farmer_model.dart';
import '../../../model/family_record_model.dart';
import '../../../model/farmer_payment_detail_model.dart';
import '../../../model/saral_service_model.dart';

class FarmerPaymentDetailApi{



  static Future<FarmerPaymentDetailModel?> getFarmerPaymentDetail(Map<String, dynamic>? queryParam) async {
    String url=EndPoints.getFarmerPaymentDetail;
    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          queryParams: queryParam
      );
      print("getFarmerPaymentDetail: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          FarmerPaymentDetailModel model = farmerPaymentDetailModelFromJson(responseBody);
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