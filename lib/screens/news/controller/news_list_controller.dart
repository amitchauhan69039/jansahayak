
import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/map_service_model.dart';
import '../../../model/news_details_model.dart';
import '../../../model/news_list_model.dart';

class NewsListController extends GetxController {
  bool loader = false;
  NewsListModel? newsListModel;
  NewsDetailsModel? newsDetailsModel;
  MapServiceModel? mapServiceModel;

  @override
  void onInit() {
    super.onInit();

  }

  //Call News List Api
  Future<void>  getNewsList() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['news_list_screen']);
      

      try {
        NewsListModel? model = await NewsListApi.getNewsList("2023-10-01",PrefService.getString(PrefKeys.selectedLanguage));

        if (model != null) {
          if (model.message!.toLowerCase() == "success".toLowerCase()) {
            newsListModel=model;

          }
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

  //Call News Details Api
  Future<void>  getNewsDetails(String nid,String vid) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['news_detail_screen']);


      try {
        NewsDetailsModel? model = await NewsListApi.getNewsDetails(nid,vid);

        if (model != null) {
          if (model.message!.toLowerCase() == "success".toLowerCase()) {
            newsDetailsModel=model;

          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['news_detail_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }



}