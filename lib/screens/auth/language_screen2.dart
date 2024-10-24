import 'package:JanSahayak/jan_sahayak.dart';

import '../../utils/global_data.dart';

class LanguageScreen2 extends StatefulWidget {
  const LanguageScreen2({super.key});

  @override
  State<LanguageScreen2> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen2>{
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GetBuilder<AuthController>(
            id: 'language',
            builder: (controller) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        color: ColorRes.buttonTextColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                      ),
                      child:Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                AssetRes.whiteBackIcon,
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Choose Language'.tr,
                                  textAlign: TextAlign.center,
                                  style: styleW400S17.copyWith(
                                      fontSize: 22,
                                      color: ColorRes.white),
                                ),
                                Text(
                                  'भाषा चुनें'.tr,
                                  textAlign: TextAlign.center,
                                  style: styleW400S17.copyWith(
                                    fontSize: 22,
                                    color: ColorRes.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    appSizedBox(height: 200),
                    Container(
                      height: 150,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorRes.hindiColor,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          Locale locale= const Locale("hi", "IN");
                                          PrefService.set(PrefKeys.selectedLanguage,getLanLocaleToStr(locale));
                                          Get.updateLocale(locale);
                                          controller.update(['language']);
                                          print("GlobalData.selectedLanguage ${GlobalData.selectedLanguage}");
                                          PrefService.set(PrefKeys.selectedLanguage, "hi");

                                          Get.offAll(()=> const HomeScreen());
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'हिंदीं'.tr,
                                              textAlign: TextAlign.center,
                                              style: styleW400S13.copyWith(
                                                  fontSize: 16,
                                                  color: ColorRes.white),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'अ'.tr,
                                              textAlign: TextAlign.center,
                                              style: styleW400S13.copyWith(
                                                  fontSize: 40,
                                                  color: ColorRes.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            ),

                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorRes.englishColor,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          Locale locale= const Locale("en", "US");
                                          PrefService.set(PrefKeys.selectedLanguage,getLanLocaleToStr(locale));
                                          Get.updateLocale(locale);
                                          controller.update(['language']);
                                          print("GlobalData.selectedLanguage ${GlobalData.selectedLanguage}");
                                          PrefService.set(PrefKeys.selectedLanguage, "en");
                                          Get.offAll(()=> const HomeScreen());

                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'English'.tr,
                                              textAlign: TextAlign.center,
                                              style: styleW400S13.copyWith(
                                                  fontSize: 16,
                                                  color: ColorRes.white),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'A'.tr,
                                              textAlign: TextAlign.center,
                                              style: styleW400S13.copyWith(
                                                  fontSize: 40,
                                                  color: ColorRes.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

              );
            },
          ),
        ),
      ),
    );
  }

}