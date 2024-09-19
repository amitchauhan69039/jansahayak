import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<HomeController>(
            id: 'home_page',
            builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: StackedLoader(
                  loading: controller.loader,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 175,
                                decoration: BoxDecoration(
                                  image: new DecorationImage(
                                    image: AssetImage(AssetRes.bannerBgIcon),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    textAlign: TextAlign.left,
                                                    'Hi, '.tr,
                                                    style:
                                                        styleW400S20.copyWith(
                                                            fontSize: 15,
                                                            color: ColorRes
                                                                .darkGreyColor),
                                                  ),
                                                  Text(
                                                    textAlign: TextAlign.left,
                                                    PrefService.getString(PrefKeys
                                                                .USER_ROLE) ==
                                                            "P"
                                                        ? PrefService.getString(
                                                            PrefKeys
                                                                .FAMILY_MEMBERS_NAME)
                                                        : PrefService.getString(
                                                            PrefKeys
                                                                .GUEST_NAME),
                                                    style:
                                                        styleW400S20.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                ColorRes.white),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                textAlign: TextAlign.left,
                                                'Explore our offerings \nfind the right \nservice for you'
                                                    .tr,
                                                style: styleW400S20.copyWith(
                                                    fontSize: 16,
                                                    color: ColorRes.white),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Image.asset(
                                          AssetRes.bannerImageIcon,
                                          width: 140,
                                          height: 100,
                                        ))
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Card(
                                    elevation: 5.0,
                                    child: Container(
                                        height: 40,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.text,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                style: styleW400S13.copyWith(
                                                    fontSize: 12,
                                                    color: ColorRes.textColor),
                                                decoration:
                                                    InputDecoration.collapsed(
                                                  hintText: 'Search'.tr,
                                                  hintStyle:
                                                      styleW400S13.copyWith(
                                                          fontSize: 12,
                                                          color: ColorRes
                                                              .textColor),
                                                ),
                                              ),
                                            )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  AssetRes.searchIcon,
                                                  height: 24,
                                                  width: 24,
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            elevation: 5.0,
                            child: Container(
                              margin: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: ColorRes.cardBgColor),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 10, bottom: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              textAlign: TextAlign.left,
                                              'parivar_pehchan_patra'.tr,
                                              style: styleW400S20.copyWith(
                                                  fontSize: 14,
                                                  color: ColorRes
                                                      .appPrimaryDarkColor),
                                            ),
                                            Text(
                                              textAlign: TextAlign.left,
                                              'citizen_corner'.tr,
                                              style: styleW400S20.copyWith(
                                                  fontSize: 14,
                                                  color: ColorRes.redTextColor),
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(() => WebViewScreen(
                                                          serviceName:
                                                              'parivar_pehchan_patra'
                                                                  .tr,
                                                          serviceUrl: Constants
                                                              .chatLink,
                                                        ));
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 55,
                                                    decoration: BoxDecoration(
                                                        color: ColorRes
                                                            .homeButtonColor),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          'Chat'.tr,
                                                          style: styleW400S20
                                                              .copyWith(
                                                                  fontSize: 10,
                                                                  color: ColorRes
                                                                      .white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(10),
                                                  height: 35,
                                                  width: 75,
                                                  decoration: BoxDecoration(
                                                      color: ColorRes.white),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        'Register \n Grievance'
                                                            .tr,
                                                        style: styleW400S20
                                                            .copyWith(
                                                                fontSize: 10,
                                                                color: ColorRes
                                                                    .appPrimaryDarkColor),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 35,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      color: ColorRes
                                                          .homeOrangeColor),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        'View Details'.tr,
                                                        style: styleW400S20
                                                            .copyWith(
                                                                fontSize: 9,
                                                                color: ColorRes
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        AssetRes.ppp_logo_removebg,
                                        width: 60,
                                        height: 40,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            appSizedBox(width: 10),
                            Card(
                              elevation: 5,
                              child: Container(
                                width: 100,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: ColorRes.white),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetRes.beneficiaryIcon,
                                      width: 60,
                                      height: 60,
                                    ),
                                    appSizedBox(height: 5),
                                    Text(
                                      textAlign: TextAlign.center,
                                      'Beneficiary Services'.tr,
                                      style: styleW400S14.copyWith(
                                          fontSize: 14,
                                          color: ColorRes.appPrimaryColor,
                                          height: 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            getBeneficiaryServices()
                          ],
                        ),
                        appSizedBox(height: 8),
                        Row(
                          children: [
                            appSizedBox(width: 15),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.left,
                                controller.departmentName,
                                style: styleW600S14.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.appPrimaryDarkColor),
                              ),
                            ),
                            Image.asset(
                              AssetRes.arrowsIcon,
                              width: 30,
                              height: 30,
                            ),
                            appSizedBox(width: 15),
                          ],
                        ),
                        appSizedBox(height: 8),
                        getGovertmentServices(),
                        appSizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              textAlign: TextAlign.left,
                              controller.proActiveServiceName,
                              style: styleW600S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.appPrimaryDarkColor),
                            ),
                          ),
                        ),
                        appSizedBox(height: 4),
                        getProActiveServices(),
                        appSizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              textAlign: TextAlign.left,
                              controller.programName,
                              style: styleW600S14.copyWith(
                                  fontSize: 14,
                                  color: ColorRes.appPrimaryDarkColor),
                            ),
                          ),
                        ),
                        appSizedBox(height: 4),
                        Align(
                            alignment: Alignment.topLeft,
                            child: getProgramServices()),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            elevation: 5.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: ColorRes.cardHomeColor),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0,
                                            top: 10,
                                            bottom: 10,
                                            right: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              textAlign: TextAlign.left,
                                              'Harpath Haryana'.tr,
                                              style: styleW600S18.copyWith(
                                                  fontSize: 16,
                                                  color: ColorRes.white),
                                            ),
                                            Text(
                                              textAlign: TextAlign.left,
                                              'To make the roads of the state pothole free through a GIS-based application for lodging road related complaints by Citizens'
                                                  .tr,
                                              style: styleW400S20.copyWith(
                                                  fontSize: 12,
                                                  color: ColorRes.white,
                                                  height: 1.2),
                                            ),
                                            appSizedBox(height: 10),
                                            Container(
                                              height: 35,
                                              width: 125,
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorRes.cardButtonColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4))),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    'Register Complaint'.tr,
                                                    style:
                                                        styleW400S20.copyWith(
                                                            fontSize: 12,
                                                            color:
                                                                ColorRes.white,
                                                            height: 1,
                                                            wordSpacing: 0.1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        AssetRes.harpathLogo,
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10),
                          child: Card(
                            elevation: 5.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: ColorRes.cardAyushmanColor),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0,
                                            top: 10,
                                            bottom: 10,
                                            right: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              textAlign: TextAlign.left,
                                              'Ayushman Bharat Yojana'.tr,
                                              style: styleW600S18.copyWith(
                                                  fontSize: 16,
                                                  color: ColorRes.white),
                                            ),
                                            appSizedBox(height: 5),
                                            Text(
                                              textAlign: TextAlign.left,
                                              'Ayushman Bharat Pradhan Mantri Jan Arogya Yojana (PM-JAY)'
                                                  .tr,
                                              style: styleW400S20.copyWith(
                                                  fontSize: 12,
                                                  color: ColorRes.white,
                                                  height: 1.2),
                                            ),
                                            appSizedBox(height: 20),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: InkWell(
                                                    onTap: (){
                                                      Get.to(() => WebViewScreen(serviceName: 'Aayushman Card'.tr,
                                                        serviceUrl: "https://beneficiary.nha.gov.in/",
                                                      ));
                                                    },
                                                    child: Container(
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          color: ColorRes.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      4))),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          child: Text(
                                                            textAlign:
                                                                TextAlign.center,
                                                            'Aayushman Card'.tr,
                                                            style: styleW400S20
                                                                .copyWith(
                                                                    fontSize: 11,
                                                                    color: ColorRes
                                                                        .cardAyushmanTextColor,
                                                                    height: 1,
                                                                    wordSpacing:
                                                                        0.1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                appSizedBox(width: 10),
                                                Expanded(
                                                  child: Container(
                                                    height: 35,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                        color: ColorRes.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    4))),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          'Chirayu'.tr,
                                                          style: styleW400S20
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  color: ColorRes
                                                                      .cardAyushmanTextColor,
                                                                  height: 1,
                                                                  wordSpacing:
                                                                      0.1),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        AssetRes.ayushmanLogo,
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10),
                          child: Card(
                            elevation: 5.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: ColorRes.cardAyushmanColor,
                                gradient: LinearGradient(
                                    colors: [
                                      ColorRes.gradientCardStartColor,
                                      ColorRes.gradientCardCenterColor,
                                      ColorRes.gradientCardEndColor
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        AssetRes.documentsIcon,
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0,
                                            top: 10,
                                            bottom: 10,
                                            right: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            appSizedBox(height: 10),
                                            Text(
                                              textAlign: TextAlign.left,
                                              'downloaded_documents'.tr,
                                              style: styleW600S18.copyWith(
                                                  fontSize: 16,
                                                  color: ColorRes.white),
                                            ),
                                            appSizedBox(height: 5),
                                            Text(
                                              textAlign: TextAlign.left,
                                              'list_of_documents_downloaded_on_jansahayak'
                                                  .tr,
                                              style: styleW400S20.copyWith(
                                                  fontSize: 12,
                                                  color: ColorRes.white,
                                                  height: 1.2),
                                            ),
                                            appSizedBox(height: 20),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        appSizedBox(height: 10),
                        Text(
                          textAlign: TextAlign.left,
                          'follow_us_to_stay_connected'.tr,
                          style: styleW600S18.copyWith(
                              fontSize: 20,
                              height: 1,
                              color: ColorRes.appPrimaryDarkColor),
                        ),
                        appSizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 50, right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  AssetRes.facebookIcon,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  AssetRes.ytIcon,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  AssetRes.instagramIcon,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  AssetRes.twitterIcon,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        appSizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Widget getBeneficiaryServices() {
    if (controller.data != null &&
        !controller.data!.data!.isEmpty &&
        controller.data!.data! != null) {
      if (controller.data!.data![1].oCategory != null) {
        return Expanded(
          flex: 1,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(right: 5),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.data!.data![1].oCategory!.length + 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index != controller.data!.data![1].oCategory!.length
                      ? Container(
                          margin: EdgeInsets.only(right: 5),
                          height: 120,
                          width: 100,
                          child: Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => DepartmentScreen(
                                      mainId: controller
                                          .data!.data![1].oCategory![index].id!,
                                      serviceName: controller.data!.data![1]
                                          .oCategory![index].category!,
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: ColorRes.white,
                                  gradient: LinearGradient(
                                      colors: [
                                        ColorRes.gradientStartColor,
                                        ColorRes.gradientCentertColor,
                                        ColorRes.gradientEndtColor
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FadeInImage(
                                      image: NetworkImage(controller.data!
                                          .data![1].oCategory![index].imgUrl!),
                                      placeholder:
                                          AssetImage(AssetRes.launchIcon),
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          AssetRes.launchIcon,
                                          width: 60,
                                          height: 60,
                                        );
                                      },
                                      width: 60,
                                      height: 70,
                                    ),
                                    appSizedBox(height: 5),
                                    Text(
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      PrefService.getString(
                                                  PrefKeys.selectedLanguage) ==
                                              "en"
                                          ? controller.data!.data![1]
                                              .oCategory![index].category!
                                          : controller.data!.data![1]
                                              .oCategory![index].categoryHindi!,
                                      style: styleW400S14.copyWith(
                                          fontSize: 12,
                                          color: ColorRes.appPrimaryColor,
                                          height: 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(right: 5),
                          height: 120,
                          width: 100,
                          child: Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => ServiceAppbarScreen());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: ColorRes.white,
                                  gradient: LinearGradient(
                                      colors: [
                                        ColorRes.gradientFullStarttColor,
                                        ColorRes.appPrimaryColor,
                                        ColorRes.appPrimaryColor
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetRes.window_icon,
                                      width: 40,
                                      height: 40,
                                    ),
                                    appSizedBox(height: 15),
                                    Text(
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      "Full List",
                                      style: styleW600S14.copyWith(
                                          fontSize: 12,
                                          color: ColorRes.white,
                                          height: 1,
                                          wordSpacing: .01),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                }),
          ),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  Widget getGovertmentServices() {
    if (controller.data != null &&
        !controller.data!.data!.isEmpty &&
        controller.data!.data! != null) {
      if (controller.data!.data![2].odt != null) {
        controller.departmentName = controller.data!.data![2].menuName!;

        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 120,
            margin: EdgeInsets.only(right: 5),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.data!.data![2].odt!.length + 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index != controller.data!.data![2].odt!.length
                      ? Container(
                          margin: EdgeInsets.only(right: 5),
                          height: 120,
                          width: 100,
                          child: Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                String deptName = PrefService.getString(
                                            PrefKeys.selectedLanguage) ==
                                        "en"
                                    ? controller
                                        .data!.data![2].odt![index].department!
                                    : controller
                                        .data!.data![2].odt![index].hDepName!;
                                Get.to(() => SubServiceScreen(
                                      mainId: "1",
                                      departmentId: controller
                                          .data!.data![2].odt![index].id!
                                          .toString(),
                                      departmentName: deptName,
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: ColorRes.white,
                                  gradient: LinearGradient(
                                      colors: [
                                        ColorRes.gradientStartColor,
                                        ColorRes.gradientCentertColor,
                                        ColorRes.gradientEndtColor
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: ColorRes.appPrimaryDarkColor),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          PrefService.getString(PrefKeys
                                                      .selectedLanguage) ==
                                                  "en"
                                              ? controller.data!.data![2]
                                                  .odt![index].department![0]
                                                  .toUpperCase()
                                              : controller.data!.data![2]
                                                  .odt![index].hDepName![0]
                                                  .toUpperCase(),
                                          style: styleW600S15.copyWith(
                                              fontSize: 18,
                                              color: ColorRes.white,
                                              height: 1),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        PrefService.getString(PrefKeys
                                                    .selectedLanguage) ==
                                                "en"
                                            ? controller.data!.data![2]
                                                .odt![index].department!
                                            : controller.data!.data![2]
                                                .odt![index].hDepName!,
                                        style: styleW400S14.copyWith(
                                            fontSize: 12,
                                            color: ColorRes.appPrimaryColor,
                                            height: 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(right: 5),
                          height: 120,
                          width: 100,
                          child: Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => DepartmentScreen(
                                      mainId: "1",
                                      serviceName: "Departments",
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: ColorRes.white,
                                  gradient: LinearGradient(
                                      colors: [
                                        ColorRes.gradientFullStarttColor,
                                        ColorRes.appPrimaryColor,
                                        ColorRes.appPrimaryColor
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetRes.window_icon,
                                      width: 40,
                                      height: 40,
                                    ),
                                    appSizedBox(height: 15),
                                    Text(
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      "Full List",
                                      style: styleW600S14.copyWith(
                                          fontSize: 12,
                                          color: ColorRes.white,
                                          height: 1,
                                          wordSpacing: .01),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                }),
          ),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  Widget getProActiveServices() {
    if (controller.data != null &&
        !controller.data!.data!.isEmpty &&
        controller.data!.data! != null) {
      if (controller.data!.data![3].oSub != null) {
        controller.proActiveServiceName = controller.data!.data![3].menuName!;

        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 120,
            margin: EdgeInsets.only(right: 5),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.data!.data![3].oSub!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 5),
                    height: 120,
                    width: 100,
                    child: Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          if (PrefService.getString(PrefKeys.USER_ROLE) ==
                              "P") {
                            print(
                                "iD ${controller.data!.data![3].oSub![index].id}");
                            if (controller.data!.data![3].oSub![index].id ==
                                "5") {
                            } else if (controller
                                    .data!.data![3].oSub![index].id ==
                                "6") {
                              String finalURL =
                                  "https://dduapsy.hppa.in/get-family-id/?family_id=" +
                                      PrefService.getString(PrefKeys.FamilyID) +
                                      "&scheme=strayanimal";
                              Get.to(() => WebViewScreen(
                                    serviceName: 'DAYALU Yojana'.tr,
                                    serviceUrl: finalURL,
                                  ));
                            } else if (controller
                                    .data!.data![3].oSub![index].id ==
                                "7") {
                            } else if (controller
                                    .data!.data![3].oSub![index].id ==
                                "8") {
                            } else if (controller
                                    .data!.data![3].oSub![index].id ==
                                "9") {
                            } else if (controller
                                    .data!.data![3].oSub![index].id ==
                                "10") {
                            } else if (controller
                                    .data!.data![3].oSub![index].id ==
                                "11") {
                            } else if (controller
                                    .data!.data![3].oSub![index].subMenu ==
                                "Housing for All") {}
                          } else {
                            Get.to(() => CommonFamilyNotVerfiedScreen());
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: ColorRes.white,
                            gradient: LinearGradient(
                                colors: [
                                  ColorRes.gradientStartColor,
                                  ColorRes.gradientCentertColor,
                                  ColorRes.gradientEndtColor
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FadeInImage(
                                image: NetworkImage(controller
                                    .data!.data![3].oSub![index].imgUrl!),
                                placeholder: AssetImage(AssetRes.launchIcon),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                    AssetRes.launchIcon,
                                    width: 60,
                                    height: 60,
                                  );
                                },
                                width: 60,
                                height: 70,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  controller
                                      .data!.data![3].oSub![index].subMenu!,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  Widget getProgramServices() {
    if (controller.data != null &&
        !controller.data!.data!.isEmpty &&
        controller.data!.data! != null) {
      if (controller.data!.data![0].oSub != null) {
        controller.programName = controller.data!.data![0].menuName!;

        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 120,
            margin: EdgeInsets.only(right: 5),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.data!.data![0].oSub!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 5),
                    height: 120,
                    width: 100,
                    child: Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          if (PrefService.getString(PrefKeys.USER_ROLE) == "P") {

                            if(controller.data!.data![0].oSub![index].subMenu=="HKRNL")
                            {

                              String finalURL="${controller.data!.data![0].oSub![index].url!}/${PrefService.getString(PrefKeys.FamilyID)}?FM=${PrefService.getString(PrefKeys.FamilyID)}&MM=${PrefService.getString(PrefKeys.FamilyMemberID)}&MB=1234";

                              makePhoneCall(finalURL);

                            }
                          }else{
                            Get.to(() => CommonFamilyNotVerfiedScreen());
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: ColorRes.white,
                            gradient: LinearGradient(
                                colors: [
                                  ColorRes.gradientStartColor,
                                  ColorRes.gradientCentertColor,
                                  ColorRes.gradientEndtColor
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FadeInImage(
                                image: NetworkImage(controller
                                    .data!.data![0].oSub![index].imgUrl!),
                                placeholder: AssetImage(AssetRes.launchIcon),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                    AssetRes.launchIcon,
                                    width: 60,
                                    height: 60,
                                  );
                                },
                                width: 60,
                                height: 70,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  controller
                                      .data!.data![0].oSub![index].subMenu!,
                                  style: styleW400S14.copyWith(
                                      fontSize: 12,
                                      color: ColorRes.black,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }
}
