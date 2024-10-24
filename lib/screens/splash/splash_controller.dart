import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/auth/language_screen.dart';

import '../../model/map_service_model.dart';
import '../../utils/crypto_decrypt_utils.dart';

class SplashController extends GetxController {
  bool loader = false;
  MapServiceModel? mapServiceModel;


  Future<void> navigatePage() async {
      Future.delayed(const Duration(seconds: 3), () async {
        if (PrefService.getString(PrefKeys.USER_ROLE).isNotEmpty) {
          Get.offAll(()=> HomeScreen());
        }else{
          Get.offAll(()=> const LanguageScreen());
        }
      });
  }


  //Call News List Api
  Future<void>  getMap() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['splash']);


      try {
        MapServiceModel? model = await NewsListApi.getmap();

        if (model != null) {
         mapServiceModel=model;


         var ss=jsonEncode(model);
         String decryptedData = CryptoDecryptUtils.cryptoJsAesDecrypt(ss);
         print("JsnData : ${decryptedData}");
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['news_list_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }
}
