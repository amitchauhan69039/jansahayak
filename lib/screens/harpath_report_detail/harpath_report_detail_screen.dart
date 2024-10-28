import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';

import '../../model/harpath_report_model.dart';

class HarpathReportDetailScreen extends StatefulWidget {
  final ComplaintsData complaintsData;
  const HarpathReportDetailScreen({super.key,required this.complaintsData});

  @override
  State<HarpathReportDetailScreen> createState() => _HarpathReportDetailScreenState();
}

class _HarpathReportDetailScreenState extends State<HarpathReportDetailScreen> {
  final HarpathReportsController controller = Get.put(HarpathReportsController());

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppbar(title: 'Reported Roads List'.tr),
          ),
          body: GetBuilder<HarpathReportsController>(
              id: 'harpath_report',
              builder: (controller) {
                return  SingleChildScrollView(
                    child: StackedLoader(
                      loading: controller.loader,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 1.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appSizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      'Complaint Id'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 15,
                                          color: ColorRes.fontLightColor,
                                          height: 1),
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.start,
                                    ':'.tr,
                                    style: styleW400S14.copyWith(
                                        fontSize: 12,
                                        color: ColorRes.black,
                                        fontWeight: FontWeight.w500,
                                        height: 1),
                                  ),
                                  appSizedBox(width: 10),
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      widget.complaintsData.id.toString(),
                                      style: styleW400S14.copyWith(
                                          fontSize: 16,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                  ),
                                ],
                              ),

                              appSizedBox(height: 15),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      'Road Name'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 15,
                                          color: ColorRes.fontLightColor,
                                          height: 1),
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.start,
                                    ':'.tr,
                                    style: styleW400S14.copyWith(
                                        fontSize: 12,
                                        color: ColorRes.black,
                                        fontWeight: FontWeight.w500,
                                        height: 1),
                                  ),
                                  appSizedBox(width: 10),
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      widget.complaintsData.road_name!,
                                      style: styleW400S14.copyWith(
                                          fontSize: 16,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                  ),
                                ],
                              ),

                              appSizedBox(height: 15),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      'Feedback'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 15,
                                          color: ColorRes.fontLightColor,
                                          height: 1),
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.start,
                                    ':'.tr,
                                    style: styleW400S14.copyWith(
                                        fontSize: 12,
                                        color: ColorRes.black,
                                        fontWeight: FontWeight.w500,
                                        height: 1),
                                  ),
                                  appSizedBox(width: 10),
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      widget.complaintsData.feedback_type!,
                                      style: styleW400S14.copyWith(
                                          fontSize: 16,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                  ),
                                ],
                              ),


                              appSizedBox(height: 15),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      'Complaint Resolution Time'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 15,
                                          color: ColorRes.fontLightColor,
                                          height: 1),
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.start,
                                    ':'.tr,
                                    style: styleW400S14.copyWith(
                                        fontSize: 12,
                                        color: ColorRes.black,
                                        fontWeight: FontWeight.w500,
                                        height: 1),
                                  ),
                                  appSizedBox(width: 10),
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      widget.complaintsData.complaint_resolution_time!,
                                      style: styleW400S14.copyWith(
                                          fontSize: 16,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                  ),
                                ],
                              ),


                              appSizedBox(height: 15),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      'Complaint Status'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 15,
                                          color: ColorRes.fontLightColor,
                                          height: 1),
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.start,
                                    ':'.tr,
                                    style: styleW400S14.copyWith(
                                        fontSize: 12,
                                        color: ColorRes.black,
                                        fontWeight: FontWeight.w500,
                                        height: 1),
                                  ),
                                  appSizedBox(width: 10),
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      widget.complaintsData.status==0? 'Open' :'Closed',
                                      style: styleW400S14.copyWith(
                                          fontSize: 16,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                  ),
                                ],
                              ),

                              appSizedBox(height: 15),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      'Status Message'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 15,
                                          color: ColorRes.fontLightColor,
                                          height: 1),
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.start,
                                    ':'.tr,
                                    style: styleW400S14.copyWith(
                                        fontSize: 12,
                                        color: ColorRes.black,
                                        fontWeight: FontWeight.w500,
                                        height: 1),
                                  ),
                                  appSizedBox(width: 10),
                                  Expanded(
                                    flex: 1,
                                    child:  Text(
                                      textAlign: TextAlign.start,
                                      widget.complaintsData.status_message!,
                                      style: styleW400S14.copyWith(
                                          fontSize: 16,
                                          color: ColorRes.black,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ),
                                  ),
                                ],
                              ),



                              appSizedBox(height: 15),

                              Text(
                                textAlign: TextAlign.start,
                                'Complaint Photo'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.fontLightColor,
                                    height: 1),
                              ),

                              appSizedBox(height: 15),
                              InkWell(
                                onTap: (){
                                  mShowFullImage(context);
                                },
                                child: FadeInImage(
                                  image: NetworkImage(widget.complaintsData.completed_photo!),
                                  placeholder: AssetImage(AssetRes.photo),
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                      AssetRes.photo,
                                      width: 100,
                                      height: 100,);
                                  },
                                  width: 100,
                                  height: 100,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    )
                );
              })),
    );
  }


  void mShowFullImage(BuildContext context) {
    Dialog settingsDialog = Dialog(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeInImage(
              image: NetworkImage(widget.complaintsData.completed_photo!),
              placeholder:
              AssetImage(AssetRes.photo),
              imageErrorBuilder:
                  (context, error, stackTrace) {
                return Image.asset(
                  AssetRes.photo,
                );
              },
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return settingsDialog;
      },
    );
  }


}
