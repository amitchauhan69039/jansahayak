import 'dart:io';

import 'package:JanSahayak/screens/home/api/home_api.dart';
import 'package:intl/intl.dart';
import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/all_record_model.dart';
import '../../../model/family_id_serach_model.dart';
import '../../../model/home_data_model.dart';

class HomeController extends GetxController {
  bool loader = false;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  HomeDataModel? data;
  FamilyIdSerachModel? familyIdSerachModel;
  AllRecordModel? allRecordModel;
  String departmentName="";
  String proActiveServiceName="";
  String programName="";

  bool isFolderExist=false;

  @override
  void onInit() {
    super.onInit();
    fromDateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    toDateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    getHomeData();
    isFolderExists();
  }

  selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    controller.text = DateFormat('dd/MM/yyyy').format(picked!);
  }

  //Call api with family member
  Future<void>  getHomeData() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['home_page']);



      try {
        HomeDataModel? model = await HomeApi.getHomeData();

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {
            data=model;

            departmentName=data!.data![2].menuName!;
            proActiveServiceName=data!.data![3].menuName!;
            programName=data!.data![0].menuName!;

            print("kljlkdj ${model.data!.length}");
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['home_page']);
    }else{
      toastMsg("No Internet Available.");
    }


  }

  Future<void> isFolderExists() async{
    final path ="/storage/emulated/0/${PrefKeys.JAN_DOC_PATH}-${PrefService.getString(PrefKeys.FamilyID)}";
    final checkPathExistence = await Directory(path).exists();
    print("available or not : $checkPathExistence");
    Directory dir =await Directory(path);
    List contents = dir.listSync();
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        print(fileOrDir.path);
      } else if (fileOrDir is Directory) {
        print(fileOrDir.path);
      }
    }

    isFolderExist=checkPathExistence;
  }

  Future<List<String>> getList() async{
    List<String> list=[];
    final path ="/storage/emulated/0/${PrefKeys.JAN_DOC_PATH}-${PrefService.getString(PrefKeys.FamilyID)}";
    print("List size 12: ${path}");
    Directory dir =await Directory(path);
    List contents = dir.listSync();
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        list.add(fileOrDir.path);
        print(fileOrDir.path);
      } else if (fileOrDir is Directory) {
        print(fileOrDir.path);
      }
    }
    return list;
  }

  Future<void>  familyIdSearchForTXN(BuildContext mContext) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['home_page']);

      try {
        FamilyIdSerachModel? model = await HomeApi.familyIdSearchForTXN();

        if (model != null) {
          if (model.status!.toLowerCase() == "Successfull".toLowerCase()) {
            familyIdSerachModel=model;

            if(model.result!=null){
              popupToVerify(mContext,model.message!,model.result!.txn!);

            }else{
              toastMsg("No Data found !");
            }
          }else{
            toastMsg(model.message!);
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['home_page']);
    }else{
      toastMsg("No Internet Available.");
    }


  }


  Future<void>  popupToVerify(BuildContext mContext,String message,String txn) async{
    final alert = AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: SingleChildScrollView(
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
                        'Verify Family ID'.tr,
                        style: styleW700S14.copyWith(
                            fontSize: 16,
                            color: ColorRes.white),
                      ),
                    ),

                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [

                      Text(
                        textAlign: TextAlign.center,
                        message,
                        style: styleW400S18.copyWith(
                            fontSize: 14,
                            color: ColorRes.black),
                      ),

                      appSizedBox(height: 10),

                      Container(
                          width: double.infinity,
                          height: 45,
                          child: TextField(
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            style: styleW400S13.copyWith(
                                fontSize: 18, color: ColorRes.black),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: InputDecoration(
                              hintText: 'Enter OTP',
                              hintStyle: styleW400S13.copyWith(
                                  fontSize: 15,
                                  color: ColorRes.greyColor),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: ColorRes.borderColor,
                                      width: 2)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: ColorRes.borderColor,
                                    width: 2),
                              ),
                            ),
                          )
                      ),
                      appSizedBox(height: 15),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child:  InkWell(
                              onTap: (){
                                Navigator.pop(mContext);
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color:ColorRes.disabledButtonColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    'Close'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: styleW400S14.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: ColorRes.black,
                                        height: 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          appSizedBox(width: 15),
                          Expanded(
                            flex: 1,
                            child:  InkWell(
                              onTap: (){

                                if(otpController.text.trim().isEmpty){
                                  toastMsg("Please enter otp to verify");
                                }else{

                                  getFamilyIdDetails(txn);
                                }
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color:ColorRes.appPrimaryDarkColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    'Verify'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: styleW400S14.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: ColorRes.white,
                                        height: 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          appSizedBox(height: 15),
                        ],
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
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  Future<void>  getFamilyIdDetails(String txn) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['home_page']);

      try {
        AllRecordModel? model = await HomeApi.getFamilyIdDetails(otpController.text, txn);

        if (model != null) {
          if (model.status!.toLowerCase() == "Successfull".toLowerCase()) {
            allRecordModel=model;

            if(model.result!=null){
              Get.to(() => FamilyDetailsScreen(result: model.result!));
            }else{
              toastMsg("No Data found !");
            }
          }else{
            toastMsg(model.message!);
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['home_page']);
    }else{
      toastMsg("No Internet Available.");
    }


  }


}
