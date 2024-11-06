import 'package:JanSahayak/jan_sahayak.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    controller.getNotificationList();
  }

  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppbar(title: 'Notifications'.tr),
          ),
          body: GetBuilder<NotificationController>(
              id: 'notification_screen',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: getFamilyData()
                    ),
                  ),
                );
              })),
    );
  }

  Widget getFamilyData() {
    if (controller.notificationsModel!=null && controller.notificationsModel!.data != null) {

      return  Container(
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.notificationsModel!.data!.length ,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Card(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: ColorRes.white,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize:MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          appSizedBox(width: 10),
                          Text(
                            textAlign: TextAlign.left,
                            controller.notificationsModel!.data![index].e_title!,
                            style: styleW400S18.copyWith(
                                fontSize: 16,
                                color: ColorRes.black,
                                height: 1.1),
                          ),
                          appSizedBox(height: 5),
                          Text(
                            maxLines: 4,
                            textAlign: TextAlign.left,
                            controller.notificationsModel!.data![index].e_description!,
                            style: styleW400S18.copyWith(
                                fontSize: 15,
                                color: ColorRes.black,
                                height: 1.1),
                          ),
                          appSizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      controller.notificationsModel!.data![index].n_date!,
                                      style: styleW400S18.copyWith(
                                          fontSize: 15,
                                          color: ColorRes.borderColor,
                                          height: 1.1),
                                    ),
                                  )
                              )
                            ],
                          ),
                          appSizedBox(width: 10),



                        ],
                      ),
                    ),
                  ),
                ),
              );

            }),
      );

    } else {
      return Container();
    }
  }

}
