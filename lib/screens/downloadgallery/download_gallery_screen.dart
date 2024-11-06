import 'dart:io';
import 'package:JanSahayak/jan_sahayak.dart';
import 'package:open_file/open_file.dart';

class DownloadGalleryScreen extends StatefulWidget {
  const DownloadGalleryScreen({super.key});

  @override
  _DownloadGalleryScreenState createState() => _DownloadGalleryScreenState();
}

class _DownloadGalleryScreenState extends State<DownloadGalleryScreen> {
  @override
  void initState() {
    super.initState();
  }

  final DownloadGalleryController controller = Get.put(DownloadGalleryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppbar(title: 'Downloaded Documents'.tr),
          ),
          body: GetBuilder<DownloadGalleryController>(
              id: 'gallery',
              builder: (controller) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: StackedLoader(
                    loading: controller.loader,
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: getServiceData(),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  Widget getServiceData() {
    if(controller.listItems!=null){

      return Container(
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.listItems.length ,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {

              File file = new File(controller.listItems[index]);
              String bs = basename(file.path);


              return Padding(
                padding: const EdgeInsets.only(right: 10,left: 10,top: 2),
                child: Container(
                  child: Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: (){
                        OpenFile.open(controller.listItems[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: ColorRes.greyColor,
                        ),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              appSizedBox(height: 5),
                              Image.asset(
                                AssetRes.ic_pdf,
                                width: 80,
                                height: 80,),
                              appSizedBox(height: 10),
                              Text(
                                textAlign: TextAlign.center,
                                bs,
                                maxLines: 3,
                                style: styleW500S12.copyWith(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                    height: 1,),
                              ),
                              appSizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );

            }),
      );
    }else{
      return Container();
    }

  }


}