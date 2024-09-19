import 'package:JanSahayak/jan_sahayak.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    super.initState();
  }

  final ServiceController controller = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<ServiceController>(
            id: 'service',
            builder: (controller) {
              return RefreshIndicator(
                onRefresh: () async {
                  controller.getServiceData();
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: StackedLoader(
                    loading: controller.loader,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: getServiceData(),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  Widget getServiceData() {
    String getLanguage=PrefService.getString(PrefKeys.selectedLanguage);
    if ( controller.data != null) {

      if (controller.data!.oCategory != null) {

        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 120.0,
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 7.0,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.data!.oCategory!.length ,
            itemBuilder: (context, index) {
              return Container(
                child: InkWell(
                  onTap: (){
                    if(controller.data!.oCategory![index].id=="" || controller.data!.oCategory![index].category!.contains("Antyodaya SARAL")){

                      Get.to(() => SaralScreen(id: controller.data!.oCategory![index].id!,status: "All",));
                    }else{
                      if(controller.data!.oCategory![index].redirect=="0"){
                        Get.to(() => DepartmentScreen(mainId: controller.data!.oCategory![index].id!,serviceName: controller.data!.oCategory![index].category!,));
                      }else{
                        makePhoneCall('tel:${controller.data!.oCategory![index].category!.split(" ")[1]}');
                      }
                    }
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
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
                            end: Alignment.topCenter
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInImage(
                            image: NetworkImage(controller.data!.oCategory![index].imgUrl!),
                            placeholder: AssetImage(AssetRes.launchIcon),
                            imageErrorBuilder:
                                (context, error, stackTrace) {
                              return Image.asset(
                                AssetRes.launchIcon,
                                width: 60,
                                height: 60,);
                            },
                            width: 60,
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              getLanguage=="en" ?
                              controller.data!.oCategory![index].category! : controller.data!.oCategory![index].categoryHindi!,
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

            });
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }
}