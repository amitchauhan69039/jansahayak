import 'package:JanSahayak/jan_sahayak.dart';

class DepartmentScreen extends StatefulWidget {
  final String mainId,serviceName;
  const DepartmentScreen({super.key, required this.mainId,required this.serviceName});

  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
  void initState() {
    super.initState();
    controller.getDepartmentData(widget.mainId, "");
  }

  final DepartmentController controller = Get.put(DepartmentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CommonAppbar(title: widget.serviceName),
        ),


          body: GetBuilder<DepartmentController>(
              id: 'department',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: Container(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        controller.getDepartmentData(widget.mainId, "");
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
                                child: getDepartmentData(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  Widget getDepartmentData() {
    String getLanguage=PrefService.getString(PrefKeys.selectedLanguage);
    if ( controller.data != null && controller.data!.data !=null) {

        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 130.0,
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 7.0,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.data!.data!.length ,
            itemBuilder: (context, index) {
              return Container(
                child: InkWell(
                  onTap: (){
                    String deptName=PrefService.getString(PrefKeys.selectedLanguage) =="en" ? controller.data!.data![index].department! : controller.data!.data![index].hDepName!;

                    Get.to(() => SubServiceScreen(mainId: widget.mainId,departmentId: controller.data!.data![index].id!.toString(),departmentName: deptName,));
                  },
                  child: Card(
                    elevation: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: ColorRes.white,
                        border:  Border.all(
                          width: 1,
                          color: ColorRes.greyColor,
                          style: BorderStyle.solid,
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: ColorRes.accentColor
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                textAlign: TextAlign.center,
                                PrefService.getString(PrefKeys.selectedLanguage) =="en" ?
                                controller.data!.data![index].department![0].toUpperCase() :
                                controller.data!.data![index].hDepName![0].toUpperCase(),
                                style: styleW600S15.copyWith(
                                    fontSize: 18,
                                    color: ColorRes.white,
                                    height: 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              PrefService.getString(PrefKeys.selectedLanguage) =="en" ?
                              controller.data!.data![index].department! :
                              controller.data!.data![index].hDepName!,
                              style: styleW400S14.copyWith(
                                  fontSize: 12,
                                  color: ColorRes.appPrimaryColor,
                                  height: 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );

            });

    } else {
      return Container();
    }
  }

}