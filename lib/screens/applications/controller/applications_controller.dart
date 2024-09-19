import 'package:JanSahayak/jan_sahayak.dart';

class ApplicationsController extends GetxController {
  bool loader = false;
  String? caseStatus;
  List<ApplicationData>? applicationsList = [];

  ApplicationsController(this.caseStatus);

  @override
  void onInit() {
    super.onInit();

  }


}
