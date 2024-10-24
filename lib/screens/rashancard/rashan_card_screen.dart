import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';
import 'package:JanSahayak/screens/rashancard/view_rashan_card_screen.dart';

class RashanCardScreen extends StatefulWidget {
  const RashanCardScreen({super.key});

  @override
  State<RashanCardScreen> createState() => _RashanCardScreenState();
}

class _RashanCardScreenState extends State<RashanCardScreen> {
  final RashanCardController controller = Get.put(RashanCardController());

  @override
  void initState() {
    super.initState();
    controller.getRashanCardData('rashan_card');

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: GetBuilder<RashanCardController>(
              id: 'rashan_card',
              builder: (controller) {
                return Column(
                  children: <Widget>[
                    CommonAppbar(title: 'ration_card_details'.tr),
                    Expanded(
                      child: StackedLoader(
                        loading: controller.loader,
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: getRashanCardData(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ));
  }

  Widget getRashanCardData() {
    if(controller.rashanCardModel!=null && controller.rashanCardModel!.fpsId != null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: ColorRes.white,
        ),

        child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        textAlign: TextAlign.start,
                        'family_id'.tr,
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            color: ColorRes.black,
                            fontWeight: FontWeight.w500,
                            height: 1),
                      ),
                    ),
                    appSizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Text(
                        textAlign: TextAlign.start,
                        "---",
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            color: ColorRes.fontLightColor,
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
                      child: Text(
                        textAlign: TextAlign.start,
                        'ration_card_id'.tr,
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            color: ColorRes.black,
                            fontWeight: FontWeight.w500,
                            height: 1),
                      ),
                    ),
                    appSizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Text(
                        textAlign: TextAlign.start,
                        "---",
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            color: ColorRes.fontLightColor,
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
                      child: Text(
                        textAlign: TextAlign.start,
                        'name_'.tr,
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: ColorRes.black,
                            height: 1),
                      ),
                    ),
                    appSizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Text(
                        textAlign: TextAlign.start,
                        "---",
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            color: ColorRes.fontLightColor,
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
                      child: Text(
                        textAlign: TextAlign.start,
                        'head_name'.tr,
                        style: styleW400S14.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: ColorRes.black,
                            height: 1),
                      ),
                    ),
                    appSizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Text(
                        textAlign: TextAlign.start,
                        "---",
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            color: ColorRes.fontLightColor,
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
                      child: Text(
                        textAlign: TextAlign.start,
                        'ration_card_type'.tr,
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: ColorRes.black,
                            height: 1),
                      ),
                    ),
                    appSizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Text(
                        textAlign: TextAlign.start,
                        "---",
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            color: ColorRes.fontLightColor,
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
                      child: Text(
                        textAlign: TextAlign.start,
                        'address'.tr,
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: ColorRes.black,
                            height: 1),
                      ),
                    ),
                    appSizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Text(
                        textAlign: TextAlign.start,
                        "---",
                        style: styleW400S14.copyWith(
                            fontSize: 15,
                            color: ColorRes.fontLightColor,
                            height: 1),
                      ),
                    ),
                  ],
                ),
                appSizedBox(height: 10),

                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: (){

                        Get.to(() => ViewRashanCardScreen());
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: ColorRes.activatedButtonColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            textAlign: TextAlign.start,
                            'print_ration_card'.tr.toUpperCase(),
                            style: styleW400S14.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: ColorRes.white,
                                height: 1),
                          ),
                        ),
                      ),
                    )
                )

              ],
            )
        ),
      );
    }else{
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            'No Record Found !!'.tr,
            style: styleW400S14.copyWith(
                fontSize: 22,
                color: ColorRes.black,
                fontWeight: FontWeight.w600,
                height: 1),
          ),
        ),
      );
    }


  }

}
