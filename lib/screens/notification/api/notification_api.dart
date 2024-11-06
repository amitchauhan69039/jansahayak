import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/notifications_model.dart';

class NotificationApi{

  static Future<NotificationsModel?> getNotificationsList() async {
    String url=EndPoints.GetNotification+PrefService.getString(PrefKeys.FamilyMemberID);

    Map<String,String> headers={"token":"token@123"};


    try {
      final response = await HttpService.getApi(
        url: url,
        isContentType: true,
        headers: headers
      );
      print("notification_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          NotificationsModel model = notificationsModelFromJson(responseBody);
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

