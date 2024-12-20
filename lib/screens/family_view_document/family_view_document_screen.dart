import 'dart:io';

import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

class FamilyViewDocumentScreen extends StatefulWidget {
  const FamilyViewDocumentScreen({super.key});


  @override
  State<FamilyViewDocumentScreen> createState() => _FamilyViewDocumentScreenState();
}

class _FamilyViewDocumentScreenState extends State<FamilyViewDocumentScreen> {
  final FamilyViewDocumentController controller = Get.put(FamilyViewDocumentController());
  late File Pfile;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: GetBuilder<FamilyViewDocumentController>(
              id: 'family_view_document_screen',
              builder: (controller) {
                return Column(
                  children: <Widget>[
                    CommonAppbar(title: 'parivar_pehchan_patra'.tr),
                    Expanded(
                      child: StackedLoader(
                        loading: controller.loader,
                        child: loadPfd(),
                      ),
                    ),
                  ],
                );
              }),
        ));
  }




  Widget loadPfd(){
    if(controller.isVisible && controller.isPdf){
      print("PDFView ${controller.Pfile.path}");
      return Container(
        child: Stack(
            children: [
              PDFView(
                filePath:controller.Pfile.path,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child:  InkWell(
                              onTap: (){
                                controller.saveFile();
                              },
                              child: Container(
                                height: 45,
                                width: 150,
                                decoration: BoxDecoration(
                                  color:ColorRes.headerBgColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    'Download File'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: styleW400S14.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: ColorRes.white,
                                        height: 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          appSizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child:  InkWell(
                              onTap: (){
                                if(controller.isFileSaved){

                                  controller.sharePdf();
                                }else{
                                  toastMsg("Please download file first to share");
                                }
                              },
                              child: Container(
                                height: 45,
                                width: 150,
                                decoration: BoxDecoration(
                                  color:ColorRes.downloadBgColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    'Share File'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: styleW400S14.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: ColorRes.white,
                                        height: 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ]),
      );

    }else{
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            'No Record Found !!'.tr,
            style: styleW400S14.copyWith(
                fontSize: 20,
                color: ColorRes.black,
                fontWeight: FontWeight.w600,
                height: 1),
          ),
        ),
      );
    }
  }


}
