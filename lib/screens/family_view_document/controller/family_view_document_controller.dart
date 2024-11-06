import 'dart:io';

import 'package:JanSahayak/jan_sahayak.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import '../../../model/cast_certificate_model.dart';
import '../../../model/property_svamitva_model.dart';
import 'package:http/http.dart' as http;

import '../../../model/view_document_model.dart';

class FamilyViewDocumentController extends GetxController {
  bool loader = false;
  ViewDocumentModel? viewDocumentModel;
  bool isVisible = false;
  bool isPdf = false;
  late File Pfile;
  String name="";
  bool isFileSaved=false;
  List<int>? pdfBytes=null;
  @override
  void onInit() {
    super.onInit();
    getDocumnt();
  }


  //Call Income Ciertificate Api
  Future<void> getDocumnt() async {

    if (await isInternetAvailable(context)) {
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['family_view_document_screen']);

      try {
        ViewDocumentModel? model = await FamilyViewDocumentApi.getDocumnt();


        if (model != null) {
          print("status : ${model.status} aa ${model.message}");
          if (model.status !="Failed") {
            isVisible = true;
            print("Sccesss");
            loadNetwork(model.result!.document!);
          } else {
            print("fail");
            isVisible = false;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['family_view_document_screen']);
    } else {
      toastMsg("No Internet Available.");
    }
  }

  Future<void> loadNetwork(String pdfUrl) async {
    loader = true;

    update(['family_view_document_screen']);
    var url = pdfUrl;
  //  final response = await http.get(Uri.parse(url));
    Uint8List data = base64.decode(pdfUrl);
    print("bytes :$data");
    final bytes = data;
    final filename = '${PrefService.getString(PrefKeys.DOC_FAMILY_ID)}${PrefService.getString(PrefKeys.FamilyID)}.pdf';
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    print("file :${file.path}");
    await file.writeAsBytes(data, flush: true);
    pdfBytes=bytes;

    Pfile = file;
    isPdf = true;
    loader = false;
    update(['family_view_document_screen']);

  }

  Future<void> saveFile() async {
    await Permission.manageExternalStorage.request();
    String fileName="/storage/emulated/0/${PrefKeys.JAN_DOC_PATH}-${PrefService.getString(PrefKeys.FamilyID)}/"+PrefKeys.DOC_FAMILY_ID+PrefService.getString(PrefKeys.FamilyID)+".pdf";
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