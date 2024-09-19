import 'package:JanSahayak/screens/home/api/home_api.dart';
import 'package:intl/intl.dart';
import 'package:JanSahayak/jan_sahayak.dart';

import '../../../model/home_data_model.dart';

class HomeController extends GetxController {
  bool loader = false;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  HomeDataModel? data;
  String departmentName="";
  String proActiveServiceName="";
  String programName="";

  @override
  void onInit() {
    super.onInit();
    fromDateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    toDateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    getHomeData();
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
}
