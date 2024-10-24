import 'dart:io';

import 'package:JanSahayak/jan_sahayak.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import '../../../model/cast_certificate_model.dart';
import 'package:http/http.dart' as http;

class DomicleDocumentController extends GetxController {
  bool loader = false;
  CastCertificateModel? castCertificateModel;
  bool isVisible = false;
  bool isPdf = false;
  late File Pfile;
  String name="";
  bool isFileSaved=false;
  List<int>? pdfBytes=null;
  @override
  void onInit() {
    super.onInit();
    getDomicleDocumentData();
  }


  //Call Domicle Ciertificate Api
  Future<void> getDomicleDocumentData() async {

    if (await isInternetAvailable(context)) {
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['domicle_certificate_screen']);

      try {
        CastCertificateModel? model = await DomicleDocumentApi.getDomicleDocumentData();

        if (model != null) {
          if (model.status !="Failed") {
            isVisible = true;
            loadNetwork(model.result!.data!);
          } else {
            isVisible = false;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['domicle_certificate_screen']);
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
    String fileName="/storage/emulated/0/${PrefKeys.JAN_DOC_PATH}-${PrefService.getString(PrefKeys.FamilyID)}/"+PrefKeys.DOC_SARAL_DOMICLE+PrefService.getString(PrefKeys.FamilyID)+".pdf";

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