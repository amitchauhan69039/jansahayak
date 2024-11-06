import 'dart:io';

import 'package:JanSahayak/jan_sahayak.dart';
import '../../../model/saral_service_model.dart';
import 'package:http/http.dart' as http;

class DownloadGalleryController extends GetxController {
  bool loader = false;
  SaralServiceModel? data;
  Future<List<String>>? list;
  List listItems = [];

  @override
  void onInit() {
    super.onInit();
    getList1();
    //list=getList();

  }



  Future<List<String>> getList() async{
    update(['gallery']);
    List<String> list=[];
    final path ="/storage/emulated/0/${PrefKeys.JAN_DOC_PATH}-${PrefService.getString(PrefKeys.FamilyID)}";
    Directory dir =await Directory(path);
    print("path : ${dir}");
    List contents = dir.listSync();
    print("List contents : ${contents.length}");
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        list.add(fileOrDir.path);
        print(fileOrDir.path);
      } else if (fileOrDir is Directory) {
        print(fileOrDir.path);
      }
    }
    update(['gallery']);

    return list;
  }


  getList1() async {
    update(['gallery']);
    print("start");
    listItems = await getList();
    update(['gallery']);
  }
}