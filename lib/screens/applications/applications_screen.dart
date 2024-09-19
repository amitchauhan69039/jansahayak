import 'package:JanSahayak/jan_sahayak.dart';

class ApplicationsScreen extends StatefulWidget {
  final String title;

  ApplicationsScreen({required this.title});

  @override
  _ApplicationsScreenState createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
  late ApplicationsController controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the title
    controller = Get.put(ApplicationsController("Pending"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ApplicationsController>(
        id: 'applications',
        builder: (controller) {
          return StackedLoader(
              loading: controller.loader,
              child: Column(
              children: <Widget>[
                CommonAppbar(title: widget.title),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 2.h),
                    itemCount: controller.applicationsList?.length,
                    itemBuilder: (context, index) {
                      final caseItem = controller.applicationsList?[index];
                      return Card(
                        elevation: 4.0,
                        margin: EdgeInsets.symmetric(
                            horizontal: AppPadding.horizontalPadding, vertical: 10),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sr. No.: ${index + 1}', style: styleW700S14),
                              appSizedBox(height: 1.h),
                              Text('State vs. ', style: styleW400S14),
                              Text('${"regn_number".tr}: ${caseItem?.regnNumber}',
                                  style: styleW400S14),
                              Text('${"applicant_name".tr}: ${caseItem
                                  ?.applicantName}', style: styleW400S14),
                              Text('${"mobile_no".tr}: ${caseItem?.mobileNo}',
                                  style: styleW400S14),
                              Text('${"fir_no_date".tr}: ', style: styleW400S14),
                              Text('${"district".tr}: ', style: styleW400S14),
                              Text('${"police_station".tr}: ', style: styleW400S14),
                              Text('${"submitted_on".tr}: ${caseItem?.submitDate}',
                                  style: styleW400S14),
                              /* SizedBox(height: 16.0),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigate to detail view or perform other actions
                                  },
                                  child: Text('View'),
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          );
        }
      )
    );
  }
}



