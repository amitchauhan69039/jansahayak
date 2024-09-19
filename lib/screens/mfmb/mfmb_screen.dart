import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/visitors.dart';

class MfmbScreen extends StatefulWidget {
  const MfmbScreen({super.key});

  @override
  State<MfmbScreen> createState() => _MfmbScreenState();
}

class _MfmbScreenState extends State<MfmbScreen> {
  final MfmbController controller = Get.put(MfmbController());

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: GetBuilder<MfmbController>(
              id: 'mfmb_screen',
              builder: (controller) {
                return Column(
                  children: <Widget>[
                    CommonAppbar(title: 'mfmb_title'.tr),
                    Expanded(
                      child: StackedLoader(
                        loading: controller.loader,
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 1.h),
                            child: controller.isVisible ?
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [

                                getFarmerProducedData(),
                              ],
                            ) :
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'No record found for this family member !!'.tr,
                                  style: styleW400S14.copyWith(
                                      fontSize: 20,
                                      color: ColorRes.black,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                              ),
                            ),

                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ));
  }



  Widget getFarmerProducedData() {

    if(controller.mfmbModel!=null && controller.mfmbModel!.Payload!=null) {
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: ColorRes.white,
                  ),

                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 35,
                          height: 200,
                          decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? ColorRes.tealTransColor
                                  : ColorRes.redTransColor
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.center,
                              "${index + 1}",
                              style: styleW400S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.black,
                                  height: 1),
                            ),
                          ),
                        ),
                        appSizedBox(width: 10),
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                children: [
                                  appSizedBox(height: 10),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          'Farmer ID'.tr,
                                          style: styleW400S14.copyWith(
                                              fontSize: 14,
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
                                          controller.mfmbModel!.Payload!.Table![index].FarmerID!,
                                          style: styleW400S14.copyWith(
                                              fontSize: 13,
                                              color: ColorRes.fontLightColor,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  appSizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          'DIStrict NAME'.tr,
                                          style: styleW400S14.copyWith(
                                              fontSize: 14,
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
                                          controller.mfmbModel!.Payload!.Table![index].DIS_NAME!,
                                          style: styleW400S14.copyWith(
                                              fontSize: 13,
                                              color: ColorRes.fontLightColor,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  ),

                                  appSizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          'TEHSil NAME'.tr,
                                          style: styleW400S14.copyWith(
                                              fontSize: 14,
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
                                          controller.mfmbModel!.Payload!.Table![index].TEH_NAME!,
                                          style: styleW400S14.copyWith(
                                              fontSize: 13,
                                              color: ColorRes.fontLightColor,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  ),

                                  appSizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          'VILlage NAME'.tr,
                                          style: styleW400S14.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: ColorRes.black,
                                              height: 1),
                                        ),
                                      ),
                                      appSizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          controller.mfmbModel!.Payload!.Table![index].VIL_NAME!,
                                          style: styleW400S14.copyWith(
                                              fontSize: 13,
                                              color: ColorRes.fontLightColor,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  ),

                                  appSizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          'Muraba'.tr,
                                          style: styleW400S14.copyWith(
                                              fontSize: 14,
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
                                          controller.mfmbModel!.Payload!.Table![index].Muraba!,
                                          style: styleW400S14.copyWith(
                                              fontSize: 13,
                                              color: ColorRes.fontLightColor,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  ),


                                  appSizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          'Khewat'.tr,
                                          style: styleW400S14.copyWith(
                                              fontSize: 14,
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
                                          controller.mfmbModel!.Payload!.Table![index].Khewat!,
                                          style: styleW400S14.copyWith(
                                              fontSize: 13,
                                              color: ColorRes.fontLightColor,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  ),


                                  appSizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          'Sown Crop'.tr,
                                          style: styleW400S14.copyWith(
                                              fontSize: 14,
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
                                          controller.mfmbModel!.Payload!.Table![index].SownCrop!,
                                          style: styleW400S14.copyWith(
                                              fontSize: 13,
                                              color: ColorRes.fontLightColor,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  ),


                                  appSizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          'Registered Area'.tr,
                                          style: styleW400S14.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: ColorRes.black,
                                              height: 1),
                                        ),
                                      ),
                                      appSizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          controller.mfmbModel!.Payload!.Table![index].RegisteredArea!,
                                          style: styleW400S14.copyWith(
                                              fontSize: 13,
                                              color: ColorRes.fontLightColor,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  ),

                                  appSizedBox(height: 10),
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    }else{
      return Container();
    }
  }


}
