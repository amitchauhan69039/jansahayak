
import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/download_model.dart';
import '../../../model/submit_rating_model.dart';

class DownloadController extends GetxController {

  bool loader = false;
  TextEditingController rating = TextEditingController();
  TextEditingController remarksValue = TextEditingController();


  DownloadModel? downloadModel;

  @override
  void onInit() {
    super.onInit();
    getDownload();
  }


  //Call Download Api
  Future<void>  getDownload() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['settings']);

      try {
        DownloadModel? model = await DownloadApi.getDownload();

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {

            downloadModel=model;

          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['settings']);

    }else{
      toastMsg("No Internet Available.");
    }


  }
}