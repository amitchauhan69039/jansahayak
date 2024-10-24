import 'dart:ffi';
import 'dart:io';

import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/model/map_model.dart';
import 'package:JanSahayak/model/road_model.dart';
import 'package:JanSahayak/screens/auth/language_screen.dart';
import 'package:arcgis_maps/arcgis_maps.dart';

import '../../../model/map_service_model.dart';
import '../../../utils/crypto_decrypt_utils.dart';

class MapController extends GetxController {
  bool loader = false;
  MapServiceModel? mapServiceModel;
  MapModel? mapModel;
  RoadModel? roadModel;
  var mapStyle=BasemapStyle.arcGISStreets;
  double? latitiude;
  double? longitude;
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


  //Call News List Api
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

  //Call News List Api
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


            if(roadModel!.status=="1"){

              if(roadModel!.road_count!=0){
                print("name ${roadModel!.roads![0].name!}");

                selectedRoadId=roadModel!.roads![0].id!;
                if(!roadModel!.roads![0].name!.toLowerCase().contains("no name")){

                  roadNameController.text=roadModel!.roads![0].name!;
                }else{
                  roadNameController.text=roadModel!.message!;
                }

                isRoadNameShow=true;

                update(['map_screen']);
              }else{
                toastMsg("Road not found at the selected location !");
              }

            }else{
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


}
