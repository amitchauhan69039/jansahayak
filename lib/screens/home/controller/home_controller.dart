import 'dart:io';

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


}
