import 'package:JanSahayak/jan_sahayak.dart';

class SaralScreen extends StatefulWidget {
  final String id,status;
  const SaralScreen({super.key, required this.id,required this.status});

  @override
  _SaralScreenState createState() => _SaralScreenState();
}

class _SaralScreenState extends State<SaralScreen> {
  @override
  void initState() {
    super.initState();
  }

  final SaralController controller = Get.put(SaralController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppbar(title: 'saral_services'.tr),
          ),
          body: GetBuilder<SaralController>(
              id: 'saral',
              builder: (controller) {
                return RefreshIndicator(
                  onRefresh: () async {
                    controller.getSaralData("");
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: StackedLoader(
                      loading: controller.loader,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                image: new DecorationImage(
                                  image: AssetImage(AssetRes.backgroundImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
          
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white
                                    ),
                                    child: getServiceData(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  Widget getServiceData() {
    String getLanguage=PrefService.getString(PrefKeys.selectedLanguage);
    if ( controller.data != null && controller.data!.data !=null) {

      return Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.data!.data!.length ,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5,left: 5,top: 10),
                child: Container(
                  child: Card(
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: ColorRes.saralCardBgColor,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10),
                        child: Row(
                          children: [
                            appSizedBox(width: 10),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  color: index%2==0 ? ColorRes.accentColor : index%3==0 ? ColorRes.appPrimaryColor : index%4 ==0 ? ColorRes.digiColor : index%5 == 0 ? ColorRes.saralColor : ColorRes.appPrimaryColor
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  PrefService.getString(PrefKeys.selectedLanguage)=="en" ?
                                  controller.data!.data![index].serviceName![0].toUpperCase() : controller.data!.data![index].serviceNameHindi![0].toUpperCase(),
                                  style: styleW600S15.copyWith(
                                      fontSize: 18,
                                      color: ColorRes.white,
                                      height: 1),
                                ),
                              ),
                            ),
                            appSizedBox(width: 10),
                            Expanded(
                                child:Flexible(
                                  child: Column(

                                    children: [
                                      appSizedBox(height: 5),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          PrefService.getString(PrefKeys.selectedLanguage)=="en" ?
                                          controller.data!.data![index].serviceName! : controller.data!.data![index].serviceNameHindi!,
                                          style: styleW500S12.copyWith(
                                              fontSize: 13,
                                              color: ColorRes.black,
                                              height: 1.1),
                                        ),
                                      ),
                                      appSizedBox(height: 5),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          children: [
                                            Text(
                                              textAlign: TextAlign.left,
                                              'deptt'.tr,
                                              style: styleW700S43.copyWith(
                                                  fontSize: 11,
                                                  color: ColorRes.black,
                                                  height: 1),
                                            ),
                                            Text(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              PrefService.getString(PrefKeys.selectedLanguage)=="en" ?
                                              controller.data!.data![index].deptName! : controller.data!.data![index].deptNameHindi!,
                                              style: styleW700S43.copyWith(
                                                  fontSize: 11,
                                                  color: ColorRes.black,
                                                  height: 1.1),
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            appSizedBox(width: 5),
                            Card(
                              elevation: 2.0,
                              child: Container(
                                  height: 32,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: ColorRes.appPrimaryColor
                                  ),
                                  child:  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'apply'.tr,
                                      style: styleOpenW100S12.copyWith(
                                          fontSize: 11,
                                          color: ColorRes.white,
                                          height: 1),
                                    ),
                                  ),
                              ),
                            ),
                            appSizedBox(width: 2),
                          ],
                        ),
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