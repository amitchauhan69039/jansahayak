import 'package:JanSahayak/jan_sahayak.dart';


class CommonFamilyNotVerfiedScreen extends StatefulWidget {
  const CommonFamilyNotVerfiedScreen({super.key});

  @override
  _CommonFamilyNotVerfiedScreenState createState() => _CommonFamilyNotVerfiedScreenState();
}

class _CommonFamilyNotVerfiedScreenState extends State<CommonFamilyNotVerfiedScreen> {
  @override
  void initState() {
    super.initState();
  }

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<HomeController>(
              id: 'home_page',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: AssetImage(AssetRes.bgMainsImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'verify_family_id'.tr,
                            style: styleW600S18.copyWith(
                                fontSize: 22,
                                height: 1.3,
                                color: ColorRes.white),
                          ),
                          appSizedBox(height: 10),
                          Text(
                            textAlign: TextAlign.center,
                            'family_intro'.tr,
                            style: styleW400S20.copyWith(
                                fontSize: 14,
                                color: ColorRes.white,
                                height: 1.3),
                          ),
                          appSizedBox(height: 10),
                          Text(
                            textAlign: TextAlign.center,
                            'family_know_more'.tr,
                            style: styleW400S20.copyWith(
                                fontSize: 13,
                                color: ColorRes.activatedButtonColor,
                                height: 1.2),
                          ),
                          appSizedBox(height: 10),
                          Image.asset(
                            AssetRes.verificationImage,
                            height: 250,
                            width: 230,
                          ),
                          appSizedBox(height: 15),
                          AppButton(
                            onButtonTap: ()=>{
                              Get.to(() => GuestFamilyidVerificationScreen())
                            },
                            buttonName: 'next'.tr,
                            textColor: ColorRes.white,
                            backgroundColor: ColorRes.buttonRedColor,
                          ),
                          appSizedBox(height: 10),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text(
                              textAlign: TextAlign.center,
                              'skip'.tr,
                              style: styleW600S18.copyWith(
                                  fontSize: 18,
                                  color: ColorRes.white),
                            ),
                          ),
                          appSizedBox(height: 20),

                        ],
                      ),
                    ),
                  )
                );
              })),
    );
  }
  
}