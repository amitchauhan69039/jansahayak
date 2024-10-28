
import 'dart:async';

import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/download_model.dart';
import '../../../model/family_id_member_model.dart';
import '../../../model/static_member_model.dart';
import '../../../model/submit_rating_model.dart';

class ProfileController extends GetxController {
  List<DropdownEntity>? dropdownList= [];
  bool isDialog=false;

  bool loader = false;
  TextEditingController rating = TextEditingController();
  TextEditingController remarksValue = TextEditingController();
  TextEditingController familyId = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController memberCount = TextEditingController();
  FamilyIdMemberModel? familyIdMemberModel;
  List<dynamic>? staticMemberData;

  @override
  void onInit() {
    super.onInit();
    //getDownload();
    print("backkkkk");

    var ss=PrefService.getString(PrefKeys.FAMILY_MEMBERS);
    print("list111222: ${ss}");

    Map<String, dynamic> jsonData = jsonDecode(ss);
    staticMemberData =jsonData['data'];
    print("staticMemberData: ${staticMemberData.toString()}");
    familyId.text=staticMemberData![0]['pppid'];
    address.text=staticMemberData![0]['Address'];
    memberCount.text=staticMemberData!.length.toString();

   update(['profile_screen']);


  }


  //Call login with FamilyID Api
  Future<void>  getDataFromFamilyID(BuildContext mContext) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['profile_screen']);

      try {
        FamilyIdMemberModel? model = await ProfileApi.getDataFromFamilyID(staticMemberData![0]['pppid']);

        if (model != null) {
          if (model.status == "Successfull") {
            if (model.result!=null) {
              if(model.result!.dropdown!.length==staticMemberData!.length){

                toastMsg("All family members have already been added with Janshayak.");
              }else{

                dropdownList!.clear();
                for(int i=0;i<model.result!.dropdown!.length;i++){
                  dropdownList?.add( model.result!.dropdown![i]);
                }
                isDialog=true;
                showFamilyMemberDialog(mContext);
              }

            } else {
              toastMsg("No Data found !");
            }
          } else {
            toastMsg(model.message.toString());
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['profile_screen']);

    }else{
      toastMsg("No Internet Available.");
    }


  }


  Future<void>  showFamilyMemberDialog(BuildContext mContext) async{
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(mContext);
                          },
                          child: Image.asset(
                            AssetRes.whiteBackIcon,
                            height: 25,
                            width: 25,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Family members',
                              style: styleW700S14.copyWith(
                                  fontSize: 12,
                                  color: ColorRes.white),
                            ),
                          ),
                        )

                      ],
                    ),

                  ),
                ),
                Column(
                  children:dropdownList!.map((item) =>
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Card(
                            elevation: 4,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  appSizedBox(width: 10),
                                  Image.asset(
                                    AssetRes.profileIcon,
                                    height: 30,
                                    width: 30,
                                  ),
                                  appSizedBox(width: 10),
                                  Text(
                                    textAlign: TextAlign.center,
                                    item.text!,
                                    style: styleW700S43.copyWith(
                                        fontSize: 15,
                                        color: ColorRes.black),
                                  ),
                                  Expanded(
                                      child:Align(
                                        alignment: Alignment.centerRight,
                                        child: AppBorderButton(
                                          onButtonTap:(){
                                            if(checkMemberID(item.value!)){
                                            Navigator.pop(mContext);
                                              toastMsg("Selected family member already exist");
                                            }else{
                                              otpRequestForMEMID(item.value!,mContext);
                                            }

                                          },
                                          buttonName: "Select".tr.toUpperCase(),
                                          buttonHeight: 25,
                                          buttonWidth: 60,
                                          fontSize: 10,
                                          backgroundColor: ColorRes.buttonBgColor,
                                          textColor: ColorRes.buttonTextColor,
                                          borderWidth: 1,
                                          borderColor: ColorRes.buttonBorderColor,
                                        ),
                                      )
                                  ),
                                  appSizedBox(width: 20)
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ).toList(),
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


  bool checkMemberID(String memberID)
  {
    bool mCheck=false;
    for(int i=0;i<staticMemberData!.length;i++){
      print("pppid ${staticMemberData![i]['memberID']}  memberID : $memberID");
      if(staticMemberData![i]['memberID']==memberID){
        mCheck=true;
      }
    }
    return mCheck;
  }


  //Call api for otp request
  Future<void>  otpRequestForMEMID(String memberID,BuildContext mContext) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['profile_screen']);

      Map<String, dynamic>? queryParams={"PPPID": staticMemberData![0]['pppid']};

      try {
        OtpRequestMemidModel? model = await AuthApi.otpRequestForMEMID(memberID,queryParams);

        if (model != null) {
          if (model.status == "Successfull") {
            Navigator.push(
              mContext,
              MaterialPageRoute(
                builder: (context) => OptVerificationScreen(message: model.result!.message!.toString(),familyId:  staticMemberData![0]['pppid'],
                  txn:  model.result!.txn!.toString(),memberId:  memberID,user: "Add Member",mobileNumber: "",),
              ),
            ).then((value) {
              _refreshFirstPage();
            });
            // Get.to(() => OptVerificationScreen(message: model.result!.message!.toString(),familyId:  staticMemberData![0]['pppid'],
            //   txn:  model.result!.txn!.toString(),memberId:  memberID,user: "Add Member",mobileNumber: "",));
          }else if(model.status == "Failed"){
            toastMsg(model.message.toString());
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['profile_screen']);
    }else{
      toastMsg("No Internet Available.");
    }


  }

  void _refreshFirstPage(){
    print("profile_screen print profile_screen");
    update(['profile_screen']);
  }
}