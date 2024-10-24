import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';

class ListHospitalScreen extends StatefulWidget {
  final String district,shortCode;
  const ListHospitalScreen({super.key,required this.district,required this.shortCode});


  @override
  State<ListHospitalScreen> createState() => _ListHospitalScreenState();
}

class _ListHospitalScreenState extends State<ListHospitalScreen> {
  final ListHospitalController controller = Get.put(ListHospitalController());

  @override
  void initState() {
    super.initState();
    controller.getHospitalTypeMaster();
    controller.discrict=widget.district;
    controller.shortCode=widget.shortCode;
    controller.getALLHospitalBasedOnDistrictAndSpec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GetBuilder<ListHospitalController>(
              id: 'list_hospital_screen',
              builder: (controller) {
                return Column(
                  children: [
                    CommonAppbar(title: 'list_hospital'.tr),
                    Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: StackedLoader(
                          loading: controller.loader,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            width: double.infinity,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(
                                                width: 1,
                                                color: ColorRes.borderColor,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                appSizedBox(width: 10),
                                                Expanded(
                                                  child: TextField(
                                                    controller:
                                                    controller.searchController,
                                                    keyboardType: TextInputType.text,
                                                    textAlignVertical:
                                                    TextAlignVertical.center,
                                                    onChanged: (text) {
                                                      setState(() {
                                                        controller.searchValue=text;
                                                        if(text.length>=3){
                                                          controller.getALLHospitalBasedOnDistrictAndSpec();
                                                        }
                                                      });
                                                    },
                                                    style: styleW400S13.copyWith(
                                                        fontSize: 16,
                                                        color: ColorRes.black),
                                                    decoration:
                                                    new InputDecoration.collapsed(
                                                      hintText: 'search_hospital',
                                                      hintStyle:
                                                      styleW400S13.copyWith(
                                                          fontSize: 16,
                                                          color:
                                                          ColorRes.greyColor),
                                                    ),
                                                  ),
                                                ),
                                                Image.asset(
                                                  AssetRes.searchIcon,
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                appSizedBox(width: 10),
                                              ],
                                            )),
                                      ),
                                      appSizedBox(width: 5),
                                      InkWell(
                                        onTap: (){
                                          showFilterDialog(context);
                                        },
                                        child: Column(
                                          children: [
                                            appSizedBox(height: 10),
                                            Image.asset(
                                              AssetRes.chirayu_setting,
                                              height: 20,
                                              width: 20,
                                            ),
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              'filters'.tr,
                                              style: styleOpenW100S12.copyWith(
                                                  fontSize: 10, color: ColorRes.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  appSizedBox(height: 15),

                                  getALLHospitalBasedOnDistrictAndSpecData(),
                                ],
                              ),
                            ),
                          ),

                        ),
                      ),
                    )
                  ],
                );
              }),
        ));
  }

  Widget getALLHospitalBasedOnDistrictAndSpecData() {
    if(controller.listHospitalModel!=null && controller.listHospitalModel!.data!.length >0){
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.listHospitalModel!.data!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 5,
                child: InkWell(
                  onTap: (){
                    Get.to(() => HospitalDetalScreen(nearbyHospitalModel: controller.listHospitalModel!.data![index]));
                  },
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: ColorRes.hospitalCardbgColor,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                color:controller.listHospitalModel!.data![index].hTYPE=="1" ? ColorRes.publicColor :
                                controller.listHospitalModel!.data![index].hTYPE=="2" ? ColorRes.privateProfitColor :
                                controller.listHospitalModel!.data![index].hTYPE=="3" ? ColorRes.privateNonProfitColor : ColorRes.goiColor ,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 3, bottom: 3),
                                child: Text(
                                  textAlign: TextAlign.left,
                                  controller.listHospitalModel!.data![index].hTYPE=="1" ? 'Public' :
                                  controller.listHospitalModel!.data![index].hTYPE=="2" ? 'Private(For Profit)' :
                                  controller.listHospitalModel!.data![index].hTYPE=="3" ? 'Private(Not For Profit)' : 'Government Of India' ,
                                  style: styleW400S14.copyWith(
                                      fontSize: 13,
                                      color: ColorRes.white,
                                      height: 1),
                                ),
                              ),
                            ),
                          ),
                          appSizedBox(height: 10),



                          Row(
                            children: [
                              appSizedBox(width: 15),
                              Image.asset(
                                AssetRes.chirayu_hospital,
                                height: 20,
                                width: 20,
                              ),
                              appSizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  maxLines: 4,
                                  textAlign: TextAlign.left,
                                  controller.listHospitalModel!.data![index].hNAME!,
                                  style: styleW500S15.copyWith(
                                      fontSize: 14, color: ColorRes.black),
                                ),
                              ),
                              appSizedBox(width: 10),
                            ],
                          ),
                          appSizedBox(height: 10),

                          Divider(
                            height: 0.5,
                            color: ColorRes.dividerColor,
                          ),




                          appSizedBox(height: 10),
                          Row(
                            children: [
                              appSizedBox(width: 15),
                              Image.asset(
                                AssetRes.chirayu_phone,
                                height: 20,
                                width: 20,
                              ),
                              appSizedBox(width: 10),
                              InkWell(
                                onTap: (){
                                  makePhoneCall('tel:${controller.listHospitalModel!.data![index].hCONTACT!}');

                                },
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  controller.listHospitalModel!.data![index].hCONTACT!,
                                  style: styleW500S15.copyWith(
                                      fontSize: 14, color: ColorRes.black),
                                ),
                              ),
                            ],
                          ),





                          appSizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    }else{
      return Container(
        child: Text(
          textAlign: TextAlign.center,
          'No Data Found !!'.tr,
          style: styleW400S14.copyWith(
              fontSize: 18,
              color: ColorRes.black,
              fontWeight: FontWeight.w600,
              height: 1),
        ),
      );
    }

  }



  Future<void>  showFilterDialog(BuildContext mContext) async{
    final alert = AlertDialog(
        contentPadding: EdgeInsets.zero,

        content: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4))
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 45,
                  color: ColorRes.appPrimaryDarkColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        'sort_according_to_hospital_type'.tr,
                        style: styleW700S14.copyWith(
                            fontSize: 16,
                            color: ColorRes.white),
                      ),
                    ),

                  ),
                ),
                appSizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      'select_hospital_type'.tr,
                      style: styleW700S14.copyWith(
                          fontSize: 16,
                          color: ColorRes.textBlueColor),
                    ),
                  ),
                ),

                appSizedBox(height: 10),
                getRadioButtonList(),
                appSizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child:  InkWell(
                          onTap: (){
                            Navigator.pop(mContext);
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color:ColorRes.disabledButtonColor,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                textAlign: TextAlign.start,
                                'close'.tr,
                                overflow: TextOverflow.ellipsis,
                                style: styleW600S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                    height: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      appSizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child:  InkWell(
                          onTap: (){
                            controller.getALLHospitalBasedOnDistrictAndSpec();
                            Navigator.pop(mContext);
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color:ColorRes.activatedButtonColor,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                textAlign: TextAlign.start,
                                'submit'.tr,
                                overflow: TextOverflow.ellipsis,
                                style: styleW600S14.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.white,
                                    height: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
        )
    );

    showDialog(
      context:  mContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget getRadioButtonList() {
    if(controller.hospitalTypeMasterModel!=null && controller.hospitalTypeMasterModel!.data!.length >0){
      return StatefulBuilder(
        builder: (context, setState) => ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.hospitalTypeMasterModel!.data!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Radio(
                        value: controller.hospitalTypeMasterModel!.data![index].id!,
                        groupValue: controller.hospitalTypeValue,
                        onChanged: (value) {
                          setState(() {
                            print("value : $value");
                            controller.hospitalTypeValue=value!;
                            print("hospitalTypeValue : ${controller.hospitalTypeValue}");
                          });
                        },
                      ),
                    ),
                    Column(
                      children: [
                        appSizedBox(height: 18),
                        Text(
                          textAlign: TextAlign.left,
                          controller.hospitalTypeMasterModel!.data![index].type!,
                          style: styleW400S15.copyWith(
                              fontSize: 14,
                              color: ColorRes.textBlueColor),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      );
    }else{
      return Container();
    }

  }
}
