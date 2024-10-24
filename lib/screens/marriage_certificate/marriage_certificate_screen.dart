import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';
import 'package:flutter/scheduler.dart';

class MarriageCertificateScreen extends StatefulWidget {
  const MarriageCertificateScreen({super.key});

  @override
  State<MarriageCertificateScreen> createState() => _MarriageCertificateScreenState();
}

class _MarriageCertificateScreenState extends State<MarriageCertificateScreen> {
  final MarriageCertificateController controller = Get.put(MarriageCertificateController());

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: GetBuilder<MarriageCertificateController>(
              id: 'marriage_certificate',
              builder: (controller) {
                return StackedLoader(
                    loading: controller.loader,
                    child: Column(
                      children: <Widget>[
                        CommonAppbar(title: 'marriage_certificate'.tr),
                        Expanded(
                          child: StackedLoader(
                            loading: controller.loader,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: AppPadding.horizontalPadding,
                                    right: AppPadding.horizontalPadding,
                                    bottom: 1.h),
                                child: Container(
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
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ));
              }),
        ));
  }

}
