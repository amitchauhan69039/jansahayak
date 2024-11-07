import 'package:JanSahayak/jan_sahayak.dart';

class SubServiceScreen extends StatefulWidget {
  final String mainId,departmentId,departmentName;
  const SubServiceScreen({super.key,required this.mainId,required this.departmentId,required this.departmentName});

  @override
  _SubServiceScreenState createState() => _SubServiceScreenState();
}

class _SubServiceScreenState extends State<SubServiceScreen> {
  @override
  void initState() {
    super.initState();
    controller.getSubDepartmentData(widget.mainId,widget.departmentId, "");
  }

  final SubServiceController controller = Get.put(SubServiceController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppbar(title: widget.departmentName),
          ),
          body: GetBuilder<SubServiceController>(
              id: 'subService',
              builder: (controller) {
                return RefreshIndicator(
                  onRefresh: () async {
                    controller.getSubDepartmentData(widget.mainId,widget.departmentId, "");
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: StackedLoader(
                      loading: controller.loader,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
                                child: getSubServiceData(),
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

  Widget getSubServiceData() {
    if ( controller.data != null && controller.data!.data !=null) {

      return Container(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.data!.data!.length ,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5,left: 5,top: 10),
                child: Container(
                  child: Card(
                    elevation: 5,
                    child: InkWell(
                        onTap: (){
                          if(controller.data!.data![index].isSaralService=="N"){
                            if(controller.data!.data![index].eSerName!.contains("eKharid")){
                              if(PrefService.getString(PrefKeys.USER_ROLE)=="P") {

                                Get.to(() => FamilyFamerScreen());
                              }else {
                                Get.to(() => CommonFamilyNotVerfiedScreen());
                              }

                            }
                            else   if(controller.data!.data![index].eSerName!.contains("Meri Fasal")){
                              if(PrefService.getString(PrefKeys.USER_ROLE)=="P") {
                                Get.to(() => MfmbScreen());

                              }else {
                                Get.to(() => CommonFamilyNotVerfiedScreen());
                              }

                            }else {
                              String title=PrefService.getString(PrefKeys.selectedLanguage) =="en" ?
                              controller.data!.data![index].eSerName! :
                              controller.data!.data![index].hSerName! ;

                              var isNumber=isNumeric(controller.data!.data![index].webURL!);

                              if(isNumber){

                                makePhoneCall('tel:${controller.data!.data![index].webURL!}');
                              //  toastMsg(controller.data!.data![index].webURL!);
                              }else{
                                Get.to(() => WebViewScreen(serviceName: title, serviceUrl: controller.data!.data![index].webURL!));
                              }


                            }
                          }else {
                            if(PrefService.getString(PrefKeys.USER_ROLE)=="P") {

                              controller.getSaralAuthData(controller.data!.data![index].headerparameter1!,
                                  controller.data!.data![index].headerparameter2!, controller.data!.data![index].saralServiceID!);
                            }else {
                              Get.to(() => CommonFamilyNotVerfiedScreen());
                            }
                          }
                        },
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
                              getFadeImage(index),
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
                                            controller.data!.data![index].eSerName! : controller.data!.data![index].hSerName!,
                                            style: styleW500S12.copyWith(
                                                fontSize: 13,
                                                color: ColorRes.black,
                                                height: 1.1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                              appSizedBox(width: 5),
                              Visibility(
                                visible: controller.data!.data![index].isSaralService=="N" ? false: true,
                                child: Card(
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
                              ),
                              appSizedBox(width: 2),
                            ],
                          ),
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

  Widget getFadeImage(int index){
    if (controller.data!.data![index].serviceLogo !=null ) {

      if(controller.data!.data![index].serviceLogo!.contains(".png") || controller.data!.data![index].serviceLogo!.contains(".jpeg") ||
          controller.data!.data![index].serviceLogo!.contains(".jpg")){
        return Container(
          child: FadeInImage(
            image: NetworkImage(controller.data!.data![index].serviceLogo!),
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
        );

      }else{
        return Container(
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
              controller.data!.data![index].eSerName![0].toUpperCase() : controller.data!.data![index].hSerName![0].toUpperCase(),
              style: styleW600S15.copyWith(
                  fontSize: 18,
                  color: ColorRes.white,
                  height: 1),
            ),
          ),
        );
      }
    } else {
      return Container(
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
            controller.data!.data![index].eSerName![0].toUpperCase() : controller.data!.data![index].hSerName![0].toUpperCase(),
            style: styleW600S15.copyWith(
                fontSize: 18,
                color: ColorRes.white,
                height: 1),
          ),
        ),
      );
    }

  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

}