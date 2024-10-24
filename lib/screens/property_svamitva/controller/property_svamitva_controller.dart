import 'dart:io';

import 'package:JanSahayak/jan_sahayak.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import '../../../model/property_svamitva_model.dart';
import 'package:http/http.dart' as http;

class PropertySvamitvaController extends GetxController {
  bool loader = false;
  PropertySvamitvaModel? propertySvamitvaModel;
  bool isVisible = false;
  bool isPdf = false;
  late File Pfile;
  String name="";
  bool isFileSaved=false;
  List<int>? pdfBytes=null;
  @override
  void onInit() {
    super.onInit();
    getPIDDetails();
  }


  //Call KMSYears Api
  Future<void> getPIDDetails() async {

    if (await isInternetAvailable(context)) {
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['property_svamitva_screen']);

      try {
        PropertySvamitvaModel? model = await PropertySvamitvaApi.getPIDDetails();

        if (model != null) {
          if (model.success!) {
            isVisible = true;
            loadNetwork(model.message!);
          } else {
            isVisible = false;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['property_svamitva_screen']);
    } else {
      toastMsg("No Internet Available.");
    }
  }

  Future<void> loadNetwork(String pdfUrl) async {
    loader = true;

    update(['property_svamitva_screen']);
    var url = pdfUrl;
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    pdfBytes=bytes;

    Pfile = file;
    isPdf = true;
    loader = false;
    update(['property_svamitva_screen']);

  }

  Future<void> saveFile() async {
    await Permission.manageExternalStorage.request();
    String fileName="/storage/emulated/0/${PrefKeys.JAN_DOC_PATH}-${PrefService.getString(PrefKeys.FamilyID)}/"+PrefKeys.DOC_SMAVITVA+PrefService.getString(PrefKeys.FamilyID)+".pdf";

    try{
      var finalPath= await File(fileName).create(recursive: true); // the error because of this line

      print("path ${fileName}");

      if ((await finalPath.exists())) {

      } else {
        finalPath.create();
        print("creaTE ${finalPath}");
      }

      print("File ${finalPath}");
      name=finalPath.path;

      await finalPath.writeAsBytes(pdfBytes!.toList());
      isFileSaved=true;
      toastMsg("File Downloaded Successfully.");
    }
    catch(e){
      print("Exception $e");
    }
  }



  Future<void> sharePdf() async {

    await Share.shareXFiles([XFile(name)]);
  }

}