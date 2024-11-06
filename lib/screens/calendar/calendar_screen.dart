import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

import '../../model/holiday_event_model.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // DateTime _currentDate = DateTime.now();
  // DateTime _currentDate2 = DateTime.now();
  // String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  // DateTime _targetDateTime = DateTime.now();


  DateTime _currentDate =DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  List<MarkedDate> markedDates=[
    MarkedDate(color: ColorRes.white, date: DateTime(2024, 11, 10), textStyle: TextStyle(color: ColorRes.redColor)),
    MarkedDate(color: ColorRes.white, date: DateTime(2024, 11, 27), textStyle: TextStyle(color: ColorRes.redColor)),
    MarkedDate(color: ColorRes.white, date: DateTime(2024, 11, 28), textStyle: TextStyle(color: ColorRes.redColor)),
  ];


  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2024, 11, 11): [
        new Event(
          date: new DateTime(2024, 11, 11),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2024, 11, 12),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2024, 11, 13),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );


  @override
  void initState() {
    super.initState();
  }

  final CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<CalendarController>(
              id: 'calendar_screen',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: getData(context),
                    ),
                  ),
                );
              })),
    );
  }


  Widget getData(BuildContext mContext){
    final now = new DateTime.now();
    controller.currentMonth = DateFormat('M').format(now);
    controller.currentDay = DateFormat('d').format(now);
    controller.currentYear = DateFormat('y').format(now);
    print("day :${DateFormat('E').format(now)}");






    controller.currentIntDay=int.parse(controller.currentDay);
    _markedDateMap.clear();
    markedDates.clear();
    if(controller.holidayEventModel!=null){
      for(int i=0;i<controller.holidayEventModel!.data!.oEventModel!.length;i++){
        var dateFormat=DateFormat('M/dd/yyyy').parse(controller.holidayEventModel!.data!.oEventModel![i].eventStartDate!);
        var month=DateFormat('M').format(dateFormat);
        var year=DateFormat('y').format(dateFormat);
        var month2=DateFormat('M').format(_targetDateTime);
        var year2=DateFormat('y').format(_targetDateTime);

        if(month==month2 && year==year2){
          print("month : $month $month2 $year $year2");
          var day=DateFormat('d').format(dateFormat);
          if(controller.holidayEventModel!.data!.oEventModel![i].eventType=="GH"){
            markedDates.add(MarkedDate(color: ColorRes.white,
                date: DateTime(int.parse(year), int.parse(month), int.parse(day)),
                textStyle: TextStyle(color: ColorRes.ghColor)));

          }else if(controller.holidayEventModel!.data!.oEventModel![i].eventType=="RH"){

            markedDates.add(MarkedDate(color: ColorRes.white,
                date: DateTime(int.parse(year), int.parse(month), int.parse(day)),
                textStyle: TextStyle(color: ColorRes.rhColor)));
          }else if(controller.holidayEventModel!.data!.oEventModel![i].eventType=="SD"){
            markedDates.add(MarkedDate(color: ColorRes.white,
                date: DateTime(int.parse(year), int.parse(month), int.parse(day)),
                textStyle: TextStyle(color: ColorRes.sdColor)));

          }


          _markedDateMap.add(
              new DateTime(int.parse(year), int.parse(month), int.parse(day)),
              new Event(
                date: new DateTime(int.parse(year), int.parse(month), int.parse(day)),
                title: 'Event $i',
                icon: _eventIcon,
              ));
        }
       // print("day :${DateFormat('M').format(month)}");


      }

     return  Column(
       mainAxisSize:MainAxisSize.min,
       children: [
         Container(
           width: double.infinity,
           height: 210,
           child:  FadeInImage(
             image: NetworkImage(controller.holidayEventModel!.data!.oCalenderModel!.imgUrl!,
             ),
             fit: BoxFit.fill,
             placeholder: AssetImage(AssetRes.launchIcon),
             imageErrorBuilder:
                 (context, error, stackTrace) {
               return Image.asset(
                 AssetRes.launchIcon,
                 width: double.infinity,
                 height: 210,);
             },
             width: double.infinity,
             height: 210,
           ),
         ),

         appSizedBox(height: 7),
         Container(
           height: 30,
           child: Row(
             children: [
               Expanded(
                 flex: 1,
                   child: Container(
                     height: 30,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(topRight:  Radius.circular(30), bottomRight:   Radius.circular(30)),
                       color: ColorRes.redColor,
                     ),
                     child: Align(
                       alignment: Alignment.center,
                       child: Text(
                         textAlign: TextAlign.start,
                         DateFormat('MMMM y').format(_targetDateTime),
                         style: styleW500S15.copyWith(fontSize: 14, color: ColorRes.white, height: 1),
                     ),
                   )
               ),
               ),
               Expanded(
                 flex: 1,
                 child: Container(
                     height: 30,
                     child: Align(
                       alignment: Alignment.centerRight,
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           InkWell(
                             onTap: (){
                               setState(() {
                                 _targetDateTime = DateTime(
                                     _targetDateTime.year, _targetDateTime.month - 1);
                                 _currentMonth =
                                     DateFormat.yMMM().format(_targetDateTime);
                                 print("cuurt : ${_currentMonth}");
                               });
                             },
                             child: Container(
                               height: 25,
                               width: 30,
                               decoration: BoxDecoration(
                                 color: ColorRes.previousColor
                               ),
                               child: Align(
                                 alignment: Alignment.center,
                                 child: Image.asset(
                                   AssetRes.previous_icon,
                                   width: 20,
                                   height: 20),
                               ),
                             ),
                           ),
                           appSizedBox(width: 4),
                           InkWell(
                             onTap: (){
                               setState(() {
                                 _targetDateTime = DateTime(
                                     _targetDateTime.year, _targetDateTime.month + 1);
                                 _currentMonth =
                                     DateFormat.yMMM().format(_targetDateTime);
                               });
                             },
                             child: Container(
                               height: 25,
                               width: 30,
                               decoration: BoxDecoration(
                                   color: ColorRes.forwardColor
                               ),
                               child: Align(
                                 alignment: Alignment.center,
                                 child: Image.asset(
                                     AssetRes.forward_icon,
                                     width: 20,
                                     height: 20),
                               ),
                             ),
                           ),
                           appSizedBox(width: 8),
                         ],
                       )
                     )
                 ),
               ),
             ],
           ),
         ),

         appSizedBox(height: 20),

         CalendarCarousel<Event>(
           onDayPressed: (DateTime date, List<Event> events) {
             var month2=DateFormat('M').format(date);
             var year2=DateFormat('y').format(date);
             var day2=DateFormat('d').format(date);
             for(int i=0;i<controller.holidayEventModel!.data!.oEventModel!.length;i++) {
                 var dateFormat = DateFormat('M/dd/yyyy').parse(controller.holidayEventModel!.data!.oEventModel![i].eventStartDate!);
                 var month = DateFormat('M').format(dateFormat);
                 var year = DateFormat('y').format(dateFormat);
                 var day = DateFormat('d').format(dateFormat);
                 if(day==day2 && year==year2 && month==month2){
                   print("ddd $day $month $year");
                   showEventDialog(mContext,controller.holidayEventModel!.data!.oEventModel![i]);
                 }
    }
            // this.setState(() => _currentDate = date);
           },
           customDayBuilder: (   /// you can provide your own build function to make custom day containers
               bool isSelectable,
               int index,
               bool isSelectedDay,
               bool isToday,
               bool isPrevMonthDay,
               TextStyle textStyle,
               bool isNextMonthDay,
               bool isThisMonthDay,
               DateTime day,
               ) {

             /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
             /// This way you can build custom containers for specific days only, leaving rest as default.

           },

           customGridViewPhysics: NeverScrollableScrollPhysics(),
           showHeader: false,
           weekFormat: false,
           weekendTextStyle: TextStyle(
             color: ColorRes.ghColor,
           ),
           height: 330.0,
           minSelectedDate: _currentDate.subtract(Duration(days: 20000)),
           maxSelectedDate: _currentDate.add(Duration(days: 20000)),
           markedDateShowIcon: false,
           markedDateMoreShowTotal: false,
           multipleMarkedDates: MultipleMarkedDates(markedDates: markedDates),
           markedDateCustomTextStyle: TextStyle(color: ColorRes.redColor),
           weekdayTextStyle: TextStyle(color: ColorRes.black),
           onCalendarChanged: (DateTime date) {
             this.setState(() {
               _targetDateTime = date;
               _currentMonth = DateFormat.yMMM().format(_targetDateTime);
             });
           },
           selectedDateTime: _currentDate2,
           targetDateTime: _targetDateTime,
           daysHaveCircularBorder: true, /// null for not rendering any border, true for circular border, false for rectangular border
         ),


        Padding(
            padding: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color:ColorRes.ghColor
                            ),
                          ),
                          appSizedBox(width: 10),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.start,
                              '''Gazetted Holiday (राजपत्रित अवकाश)''',
                              style: styleW500S15.copyWith(fontSize: 14, color: ColorRes.textColor, height: 1.3),
                            ),
                          ),

                        ],
                      )
                  ),

                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color:ColorRes.rhColor
                            ),
                          ),
                          appSizedBox(width: 10),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.start,
                              'Restricted Holiday (वैकल्पिक अवकाश)',
                              style: styleW500S15.copyWith(fontSize: 14, color: ColorRes.textColor, height: 1.3),
                            ),
                          ),

                        ],
                      )
                  )
                ],
              ),

              appSizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color:ColorRes.sdColor
                    ),
                  ),
                  appSizedBox(width: 5),
                  Text(
                    textAlign: TextAlign.start,
                    'Special Day (विशिष्ट दिवस)',
                    style: styleW500S15.copyWith(fontSize: 14, color: ColorRes.textColor, height: 2),
                  ),

                ],
              )

            ],
          ),
        ),

         appSizedBox(height: 20),
       ],
     );
    }else{
      return Container();

    }
  }


  Future<void>  showEventDialog(BuildContext mContext,OEventModel oEventModel) async{
    var dateFormat = DateFormat('M/dd/yyyy').parse(oEventModel.eventStartDate!);
    var date = DateFormat('dd-MMMM-yyyy').format(dateFormat);
    final alert = AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  color: ColorRes.appPrimaryDarkColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appSizedBox(height: 10),
                      Text(
                        textAlign: TextAlign.center,
                        PrefService.getString(PrefKeys.selectedLanguage)=="en" ? oEventModel.eventTitleEnd! : oEventModel.eventTitleHin!,
                        style: styleW500S15.copyWith(
                            fontSize: 14,
                            color: ColorRes.white),
                      ),
                      appSizedBox(height: 10),
                      Text(
                        textAlign: TextAlign.center,
                        PrefService.getString(PrefKeys.selectedLanguage)=="en" ? "Date : ${date}" : "तारीख : ${date}"!,
                        style: styleW500S15.copyWith(
                            fontSize: 16,
                            color: ColorRes.white),
                      ),
                      appSizedBox(height: 10),
                    ],
                  )
                ),

                appSizedBox(height: 10),
                InkWell(
                  onTap: (){
                    Navigator.pop(mContext);
                  },
                  child: Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                      color:ColorRes.activatedButtonColor,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.start,
                        'close'.tr,
                        overflow: TextOverflow.ellipsis,
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: ColorRes.white,
                            height: 1),
                      ),
                    ),
                  ),
                ),

                appSizedBox(height: 10),

              ],
            ),
          ),
        )
    );

    showDialog(
      context:  mContext,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}