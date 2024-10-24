import 'package:JanSahayak/jan_sahayak.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

class ChirayuDashboardScreen extends StatefulWidget {
  const ChirayuDashboardScreen({super.key});

  @override
  _ChirayuDashboardScreenState createState() => _ChirayuDashboardScreenState();
}

class _ChirayuDashboardScreenState extends State<ChirayuDashboardScreen> {
  var current = 0;
  var images = [AssetRes.chirayu_banner_without_one, AssetRes.chirayu_banner_without_two, AssetRes.chirayu_banner_new_three];

  var gridImages = [AssetRes.chirayu_d_hospital, AssetRes.chirayu_d_analytics, AssetRes.chirayu_d_ambulance,
    AssetRes.chirayu_d_grievance, AssetRes.chirayu_d_information_icon, AssetRes.chirayu_d_eduaction,
    AssetRes.chirayu_d_twitter, AssetRes.chirayu_d_face, AssetRes.chirayu_d_gallery];

  var gridText=['find_empanelled_hospitals'.tr,'analytics'.tr,'emergency_dial_112'.tr,
    'grievance'.tr,'about_pmjay'.tr,'arogya_shiksha'.tr,
    'twitter'.tr,'facebook'.tr,'audio_video'.tr];
  @override
  void initState() {
    super.initState();
  }

  final NearbyHospitalController controller = Get.put(NearbyHospitalController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: ChirayuAppbar(),
          ),
          body: GetBuilder<NearbyHospitalController>(
              id: 'chirayu_dashboard',
              builder: (controller) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: StackedLoader(
                    loading: controller.loader,
                    child: Container(
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: AssetImage(AssetRes.chirayu_green_bg),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                getBannerData(),
                                InkWell(
                                  onTap: () async{
                                    var status = await Permission.location.status;
                                    print("ssss123 : $status");
                                    if(status.isGranted){

                                      Get.to(() => NearbyHospitalScreen());

                                    }else{
                                      var status = await Permission.location.request();
                                      print("ssss123 : $status");
                                      if(status.isGranted){
                                        print("ssss : $status");
                                      }else{

                                        var status = await Permission.location.request();
                                        print("ssss333 : $status");

                                        await openAppSettings();
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 85,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 2,
                                        color: ColorRes.borderColor,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Image.asset(
                                        AssetRes.chirayu_image_location,
                                        width: 200,
                                      ),
                                    ),
                                  ),
                                ),
                                appSizedBox(height: 15),
                                getDashboardData()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }


  Widget getBannerData() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              initialPage: 0,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              }),
          items: images
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Image.asset(
                        width: double.infinity,
                        item,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        DotsIndicator(
            dotsCount: images.length,
            position: current,
            decorator: DotsDecorator(
              color: ColorRes.greyColor,
              activeColor: ColorRes.appPrimaryColor
            ))
      ],
    );
  }

  Widget getDashboardData() {

      return Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 150.0,
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 7.0,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: gridImages.length ,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: InkWell(
                  onTap: (){
                    switch(index){
                      case 0 :
                        Get.to(() => FindHospitalScreen());
                        break;

                      case 1 :
                        Get.to(() => WebViewScreen(serviceName: 'Ayushman Bharat Pradhan Mantri - Jan Arogya Yojana'.tr,
                            serviceUrl: "https://dashboard.pmjay.gov.in/publicdashboard/"
                        ));
                        break;

                      case 2 :
                        makePhoneCall('tel:112');
                        break;

                      case 3 :
                        Get.to(() => WebViewScreen(serviceName: 'grievance'.tr,
                            serviceUrl: "https://cgrms.pmjay.gov.in/GRMS/loginnew.htm"
                        ));
                        break;

                      case 4 :
                        Get.to(() => WebViewScreen(serviceName: 'about_pmjay'.tr,
                            serviceUrl: "https://pmjay.gov.in/about/pmjay"
                        ));
                        break;


                      case 5 :
                        Get.to(() => WebViewScreen(serviceName: 'arogya_shiksha'.tr,
                            serviceUrl: "https://learn.pmjay.gov.in/home.php"
                        ));
                        break;

                      case 6 :
                        makePhoneCall("https://twitter.com/abhhpa");

                        break;

                      case 7 :
                        makePhoneCall("https://www.facebook.com/AyushmanHaryana/");
                        break;


                      case 8 :
                        Get.to(() => WebViewScreen(serviceName: 'audio_video'.tr,
                            serviceUrl: "https://pmjay.gov.in/media/photo-video"
                        ));
                        break;

                    }
                    },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        gridImages[index],
                        width: 70,
                        height: 70,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        gridText[index],
                        style: styleW400S19.copyWith(
                            fontSize: 11,
                            color: ColorRes.black,),
                      ),

                    ],
                  ),
                ),
              );

            }),
      );


  }
}
