
import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/map_service_model.dart';
import '../../../model/news_details_model.dart';
import '../../../model/news_list_model.dart';
import '../../../model/notifications_model.dart';

class NotificationController extends GetxController {
  bool loader = false;
  NotificationsModel? notificationsModel;

  @override
  void onInit() {
    super.onInit();

  }

  //Call News List Api
  Future<void>  getNotificationList() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['notification_screen']);


      try {
        NotificationsModel? model = await NotificationApi.getNotificationsList();

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            notificationsModel=model;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['notification_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }




}