import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/model/holiday_event_model.dart';

class CalendarApi {

  static Future<HolidayEventModel?> getHolidayEvents() async {
    String url=EndPoints.GetHolidayEvents;

    Map<String,String> headers={"token":"token@123"};


    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          headers: headers
      );
      print("calendar_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          HolidayEventModel model = holidayEventModelFromJson(responseBody);
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