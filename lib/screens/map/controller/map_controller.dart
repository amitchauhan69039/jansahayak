import 'dart:ffi';
import 'dart:io';

import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/model/map_model.dart';
import 'package:JanSahayak/model/road_model.dart';
import 'package:JanSahayak/screens/auth/language_screen.dart';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:intl/intl.dart';

import '../../../model/map_service_model.dart';
import '../../../utils/crypto_decrypt_utils.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class MapController extends GetxController {
  bool loader = false;
  MapServiceModel? mapServiceModel;
  MapModel? mapModel;
  RoadModel? roadModel;
  var mapStyle=BasemapStyle.arcGISStreets;
  double? latitiude;
  double? longitude;
  double? X;
  double? Y;
  double? selectedX;
  double? selectedY;
  double? distance;
  String distanceMetersAPI="100";
  String photoSource="";
  String selectedRoadId="";
  File? imageFile;
  bool isRoadNameShow=false;
  bool isButtonEnable=false;
  bool checkPhotoSource=false;
  bool cameraDistanceCheck=false;
  bool isAseestImage=true;
  TextEditingController roadProblemController = TextEditingController();
  TextEditingController roadNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    getMap();
  }


  //Call Map Service Api
  Future<void>  getMap() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['map_screen']);


      try {
        MapServiceModel? model = await MapApi.getmap();

        if (model != null) {
          var ss=jsonEncode(model);
          String decryptedData = CryptoDecryptUtils.cryptoJsAesDecrypt(ss);
          print("JsnData map : ${decryptedData}");

          if(!decryptedData.isEmpty){
            mapModel=mapModelFromJson(decryptedData);
            print("JsnData mapmodel : ${mapModel.toString()}");
          //  Map<String, dynamic> jsonData = jsonDecode(decryptedData);

            if(mapModel!.status=="1"){

              distanceMetersAPI=mapModel!.map![0].cameraDistance!;
            }else{

              toastMsg(mapModel!.Message!);
            }
          }else{
            toastMsg("Api Failure ,Please check entered values !");
          }


          mapServiceModel=model;

        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['map_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

  //Call Road name Api
  Future<void>  getRoadNameEncrypt(double pointsX,double pointsY) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['map_screen']);

      Map<String, dynamic> queryParam = {
        'lat': pointsY,
        'lon': pointsX,
      };

      var data=json.encode(queryParam);
      print("json : ${data}");
      var encr= CryptoDecryptUtils.cryptoJsAesEncryptRequestModel(data);


      try {
        MapServiceModel? model = await MapApi.getRoadName(encr);

        if (model != null) {
          var ss=jsonEncode(model);
          String decryptedData = CryptoDecryptUtils.cryptoJsAesDecrypt(ss);
          print("JsnData sent otp : ${decryptedData}");

          if(!decryptedData.isEmpty){
            roadModel=roadModellFromJson(decryptedData);
            print("JsnData roadModel : ${roadModel.toString()}");
            Map<String, dynamic> jsonData = jsonDecode(decryptedData);
            String road_count =jsonData['road_count'].toString();


            if(roadModel!.status=="1"){

              if(road_count=="0"){
                isRoadNameShow=false;
                update(['map_screen']);
                toastMsg("Road not found at the selected location !");


              }else{
                print("name ${roadModel!.roads![0].name!}");

                selectedRoadId=roadModel!.roads![0].id!;
                if(!roadModel!.roads![0].name!.toLowerCase().contains("no name")){

                  roadNameController.text=roadModel!.roads![0].name!;
                }else{
                  roadNameController.text=roadModel!.message!;
                }

                isRoadNameShow=true;
                update(['map_screen']);

              }


            }
            else{
              toastMsg(mapModel!.Message!);
            }
          }else{
            toastMsg("Api Failure ,Please check entered values !");
          }

        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['map_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }

  //Call Post Report Api
  Future<void>  postReportData(BuildContext mContext) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['map_screen']);
      final formatter = DateFormat('ddMMyyyyHHmmss');
      final currentDate = DateTime.now();
      final timestamp = formatter.format(currentDate);
      final bytes = imageFile!.readAsBytesSync();
      final base64Image=await convertImageUriToBase64(imageFile!.uri);

      Map<String, dynamic> queryParam = {
        'uuid': "123Android",
        'mobile': PrefService.getString(PrefKeys.HARPATH_MOBILE),
        'name': PrefService.getString(PrefKeys.HARPATH_NAME),
        'gps_time': getCurrentGPSTime(),
        'remarks':roadProblemController.text,
        'map_lat':selectedY,
        'map_lon':selectedX,
        'road_id':selectedRoadId,
        'gps_lat':Y,
        'gps_lon':X,
        'photo_source':photoSource,
        'citizen_id':PrefService.getString(PrefKeys.HARPATH_CITIZEN_ID),
        'photo_name':'IMG_$timestamp.png',
        'gps_accuracy':'0',
        'image64':'data:image/png;base64,${base64Image}',
      };

      var data=json.encode(queryParam);
      print("json : ${data}");
      var encr= CryptoDecryptUtils.cryptoJsAesEncryptRequestModel(data);

      try {
        MapServiceModel? model = await MapApi.postReportData(encr);

        if (model != null) {
          var ss=jsonEncode(model);
          String decryptedData = CryptoDecryptUtils.cryptoJsAesDecrypt(ss);
          print("JsnData postReoprt : ${decryptedData}");

          if(!decryptedData.isEmpty){

            Map<String, dynamic> jsonData = jsonDecode(decryptedData);
            String status =jsonData['status'].toString();
            String message =jsonData['Message'].toString();

            if(status=="1"){

              showSuccessPopup(mContext,message);
              mClearMapAfterComplaint();
            }else{

              toastMsg(message);
            }
          }else{
            toastMsg("Api Failure ,Please check entered values !");
          }

        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['map_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }


  void mClearMapAfterComplaint(){

    distance=null;
    distanceMetersAPI="100";
    photoSource="";
    selectedX=null;
    selectedY=null;
    selectedRoadId="";
    imageFile=null;
    isRoadNameShow=false;
    isButtonEnable=false;
    checkPhotoSource=false;
    cameraDistanceCheck=false;
    isAseestImage=true;
    update(['map_screen']);

  }

  String getCurrentGPSTime() {
    // Get the current date and time
    DateTime now = DateTime.now();
    DateFormat sdf = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
    String isoDateTime = sdf.format(now);
    return isoDateTime;
  }

  Future<void>  showSuccessPopup(BuildContext mContext,String responseMessage) async{
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
                        'Request Status'.tr,
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
                        responseMessage,
                        style: styleW600S14.copyWith(
                            fontSize: 16,
                            color: ColorRes.black),
                      ),




                      appSizedBox(height: 15),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child:  InkWell(
                              onTap: (){
                                Navigator.pop(mContext);
                                Get.to(() => HarpathReportsScreen());
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color:ColorRes.buttonRedColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    'View Complaint'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: styleW400S14.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: ColorRes.white,
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
                                Navigator.pop(mContext);
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color:ColorRes.activatedButtonColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    'Close'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: styleW400S14.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
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


  Future<String?> convertImageUriToBase64(Uri imageUri) async {
    File imageFile = File(imageUri.toFilePath());

    try {
      // Read the image file as bytes
      Uint8List imageBytes = await imageFile.readAsBytes();

      // Decode the image bytes into an image
      img.Image? image = img.decodeImage(imageBytes);
      if (image != null) {
        // Encode the image to PNG format
        List<int> pngBytes = img.encodePng(image);

        // Encode the byte array to Base64
        final base64Image=base64Encode(pngBytes);
        print("Image: ${base64Image}");
        return base64Image;
      }
    } catch (e) {
      print("IOException: ${e.toString()}");
    }

    return null;
  }
}
