import 'dart:io';

import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/home/controller/jansahayak.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

class ViewRashanCardScreen extends StatefulWidget {
  const ViewRashanCardScreen({super.key});


  @override
  State<ViewRashanCardScreen> createState() => _ViewRashanCardScreenState();
}

class _ViewRashanCardScreenState extends State<ViewRashanCardScreen> {
  final RashanCardController controller = Get.put(RashanCardController());

  @override
  void initState() {
    super.initState();
    controller.getRashanCardData('view_rasha_card_screen');

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: GetBuilder<RashanCardController>(
              id: 'view_rasha_card_screen',
              builder: (controller) {
                return Column(
                  children: <Widget>[
                    CommonAppbar(title: 'property_id_details'.tr),
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
