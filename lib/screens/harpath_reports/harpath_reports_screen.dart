import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';

class HarpathReportsScreen extends StatefulWidget {
  const HarpathReportsScreen({super.key});

  @override
  State<HarpathReportsScreen> createState() => _HarpathReportsScreenState();
}

class _HarpathReportsScreenState extends State<HarpathReportsScreen> {
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
                              left: 5,
                              right: 5,
                              bottom: 1.h),
                          child: getFarmerProducedData(context),
                        ),
                      ),
                    )
                );
              })),
    );
  }


  Widget getFarmerProducedData(BuildContext mContext) {

    if ( controller.harpathReportModel != null) {
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.harpathReportModel!.complaints!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: InkWell(
                onTap: (){
                  Get.to(() => HarpathReportDetailScreen(complaintsData: controller.harpathReportModel!.complaints![index]));
                },
                child: Container(
                
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: ColorRes.white,
                  ),
                
                  child: Row(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            minHeight: 50,
                            minWidth:35,
                            maxWidth: 35,
                            maxHeight: 240),
                        decoration: BoxDecoration(
                            color: index%2==0? ColorRes.tealTransColor : ColorRes.redTransColor
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child:  Text(
                            textAlign: TextAlign.center,
                            "${index+1}",
                            style: styleW400S14.copyWith(
                                fontSize: 14,
                                color: ColorRes.black,
                                height: 1),
                          ),
                        ),
                      ),
                      appSizedBox(width: 15),
                
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                'Complaint Id'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.start,
                                controller.harpathReportModel!.complaints![index].id!.toString(),
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                
                              appSizedBox(height: 15),
                
                
                              Text(
                                textAlign: TextAlign.start,
                                'Road Name'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.start,
                                controller.harpathReportModel!.complaints![index].road_name!,
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                              appSizedBox(height: 15),
                
                              Text(
                                textAlign: TextAlign.start,
                                'Feedback'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.start,
                                controller.harpathReportModel!.complaints![index].feedback_type!,
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                              appSizedBox(height: 15),
                
                
                              Text(
                                textAlign: TextAlign.start,
                                'Complaint Resolution Time'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.start,
                                controller.harpathReportModel!.complaints![index].complaint_resolution_time!,
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                              appSizedBox(height: 15),
                
                              Text(
                                textAlign: TextAlign.start,
                                'Complaint Status'.tr,
                                style: styleW400S14.copyWith(
                                    fontSize: 10,
                                    color: ColorRes.lightTextColor,
                                    height: 1),
                              ),
                              appSizedBox(height: 5),
                              Text(
                                textAlign: TextAlign.start,
                                controller.harpathReportModel!.complaints![index].status==0 ? 'Open' : 'Closed',
                                style: styleW400S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                              appSizedBox(height: 10),
                
                            ],
                          ),
                        ),
                      ),
                
                    ],
                  ),
                ),
              ),
            );
          });
    }else{
      if(controller.isTextShow){
        return Container(
          width: MediaQuery.of(mContext).size.width,
          height: MediaQuery.of(mContext).size.height,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.center,
              'No Record Found !!'.tr,
              style: styleW400S14.copyWith(
                  fontSize: 20,
                  color: ColorRes.black,
                  fontWeight: FontWeight.w600,
                  height: 1),
            ),
          ),
        );
      }else{
        return Container();
      }

    }

  }

}
