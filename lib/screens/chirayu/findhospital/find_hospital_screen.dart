import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/model/district_model.dart';
import 'package:JanSahayak/model/speciality_model.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';

class FindHospitalScreen extends StatefulWidget {
  const FindHospitalScreen({super.key});

  @override
  State<FindHospitalScreen> createState() => _FindHospitalScreenState();
}

class _FindHospitalScreenState extends State<FindHospitalScreen> {
  final FindHospitalController controller = Get.put(FindHospitalController());

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: GetBuilder<FindHospitalController>(
              id: 'find_hospital',
              builder: (controller) {
                return Container(
                  child: Stack(
                    children: [
                      Column(
                        children: <Widget>[
                          CommonAppbar(title: 'search_hospital'.tr),
                          Expanded(
                            child: SingleChildScrollView(
                                child: StackedLoader(
                                  loading: controller.loader,
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: AppPadding.horizontalPadding,
                                          right: AppPadding.horizontalPadding,
                                          bottom: 1.h),
                                      child: Column(
                                        children: [
                                          appSizedBox(height: 50),
                                          Text(
                                            'choose_empanelled_hospitals'.tr,
                                            textAlign: TextAlign.center,
                                            style: styleW400S15.copyWith(
                                                fontSize: 16, color: ColorRes.chooseTextColor),
                                          ),

                                          Text(
                                            'Note: If no dropdown is selected then complete list of all Hospitals will be displayed.'.tr,
                                            textAlign: TextAlign.center,
                                            style: styleW300S14.copyWith(
                                                fontSize: 12, color: ColorRes.privateProfitColor),
                                          ),


                                          appSizedBox(height: 15),
                                          Text(
                                            'select_district'.tr,
                                            textAlign: TextAlign.left,
                                            style: styleW300S14.copyWith(
                                                fontSize: 13, color: ColorRes.black),
                                          ),

                                          appSizedBox(height: 5),
                                          Container(
                                              child: getDropdown()
                                          ),
                                          appSizedBox(height: 10),

                                          Text(
                                            'sel_h_type'.tr,
                                            textAlign: TextAlign.left,
                                            style: styleW300S14.copyWith(
                                                fontSize: 13, color: ColorRes.black),
                                          ),

                                          appSizedBox(height: 5),
                                          Container(
                                              child: getDropdown2()
                                          ),

                                          appSizedBox(height: 20),

                                          AppButton(
                                            onButtonTap: (){
                                              String district="0";
                                              String shortCode="0";
                                              if(controller.districtController.text==100.toString() || controller.districtController.text==101.toString()){
                                                district="0";
                                              }else{
                                                district=controller.districtController.text.toString();
                                              }
                                              if(controller.specialityController.text==100.toString() || controller.specialityController.text==101.toString()){

                                                shortCode="0";
                                              }else{
                                                shortCode=controller.specialityController.text.toString();
                                              }

                                              Get.to(() => ListHospitalScreen(district: district, shortCode:shortCode));

                                            },
                                            buttonName: 'find_hospital'.tr,
                                            textColor:ColorRes.white,
                                            backgroundColor:ColorRes.activatedButtonColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          child:   Image.asset(
                              AssetRes.chirayu_bg_hospital,
                              width: 300,
                              height:250)

                        ),
                      )
                    ],
                  )
                );
              }),
        ));
  }

  Widget getDropdown() {
    if ( controller.districtModel != null) {

      if (controller.districtModel!.data != null) {

        List<DistrictData>? list=List.empty(growable: true);
        int id=100;
        list.add(DistrictData(id: 100,district: 'select_district'.tr));
        list.add(DistrictData(id: 101,district: 'select_all_district'.tr));
        list.addAll(controller.districtModel!.data!);

        if(controller.districtController.text.isEmpty){
          controller.districtController.text=id.toString();
        }

        return  Container(
          height: 45,
          width: Get.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorRes.greyColor),
            color: ColorRes.white,
          ),
          child: StatefulBuilder(
            builder: (context, setState) => DropdownButton(
              value: controller.districtController.text.toString(),
              underline: const SizedBox(),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: ColorRes.appBlackColor,
              ),
              items: list.map((items) {
                return DropdownMenuItem(
                  value: items.id.toString(),
                  child: Text(
                    items.district!,
                    style: styleW400S15.copyWith(
                        fontSize: 14, color: ColorRes.black),
                  ),
                );
              }).toList(),
              dropdownColor: ColorRes.white,
              borderRadius: BorderRadius.circular(10),
              isExpanded: true,
              isDense: true,
              onChanged: (Object? value) {
                setState(() {
                  controller.districtController.text=value.toString();
                });
              },
            ),
          ),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  Widget getDropdown2() {
    if ( controller.specialityModel != null) {

      if (controller.specialityModel!.data != null) {

        List<SpecialityModelData>? list=List.empty(growable: true);
        list.add(SpecialityModelData(shortCode: 100.toString(),sName: 'sel_h_type'.tr));
        list.add(SpecialityModelData(shortCode: 101.toString(),sName: 'all_sel_h_type'.tr));
        list.addAll(controller.specialityModel!.data!);

        if(controller.specialityController.text.isEmpty){
          controller.specialityController.text=list[0].shortCode!;
        }

        return  Container(
          height: 45,
          width: Get.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorRes.greyColor),
            color: ColorRes.white,
          ),
          child: StatefulBuilder(
            builder: (context, setState) => DropdownButton(
              value: controller.specialityController.text.toString(),
              underline: const SizedBox(),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: ColorRes.appBlackColor,
              ),
              items: list.map((items) {
                return DropdownMenuItem(
                  value: items.shortCode,
                  child: Text(
                    items.sName!,
                    style: styleW400S15.copyWith(
                        fontSize: 14, color: ColorRes.black),
                  ),
                );
              }).toList(),
              dropdownColor: ColorRes.white,
              borderRadius: BorderRadius.circular(10),
              isExpanded: true,
              isDense: true,
              onChanged: (Object? value) {
                setState(() {
                  print("vakue: $value");
                  controller.specialityController.text=value.toString();
                  print("vakue: ${controller.specialityController.text}");
                });
              },
            ),
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
