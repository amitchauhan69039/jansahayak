
import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/submit_rating_model.dart';

class SettingsController extends GetxController {

  bool loader = false;
  TextEditingController rating = TextEditingController();
  TextEditingController remarksValue = TextEditingController();


  SubmitRatingModel? submitRatingModel;

  @override
  void onInit() {
    super.onInit();
  }


  //Call Submit rating Api
  Future<void>  submitRating(BuildContext mContext) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['settings']);

      try {
        SubmitRatingModel? model = await SettingsApi.getServiceData(rating.text, remarksValue.text);

        if (model != null) {
          if (model.output!.toLowerCase() == "success".toLowerCase()) {

            submitRatingModel=model;
            toastMsg("Submitted Successfully !");

          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      Navigator.pop(mContext);
      update(['settings']);

    }else{
      toastMsg("No Internet Available.");
    }


  }
}