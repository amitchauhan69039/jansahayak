
import 'dart:async';

import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/holiday_event_model.dart';


class CalendarController extends GetxController {

  bool loader = false;
  HolidayEventModel? holidayEventModel;
  String currentDay="";
  String currentMonth="";
  String currentYear="";
  int currentIntDay=0;
  var daysOfMonth=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  var weekdays =["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];


  @override
  void onInit() {
    super.onInit();
    getHolidayEvents();
  }

  //Call News List Api
  Future<void>  getHolidayEvents() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['calendar_screen']);


      try {
        HolidayEventModel? model = await CalendarApi.getHolidayEvents();

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            holidayEventModel=model;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['calendar_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

}