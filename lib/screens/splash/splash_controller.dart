import 'package:JanSahayak/jan_sahayak.dart';
import 'package:JanSahayak/screens/auth/language_screen.dart';

class SplashController extends GetxController {

  Future<void> navigatePage() async {
      Future.delayed(const Duration(seconds: 3), () async {
        if (PrefService.getString(PrefKeys.USER_ROLE).isNotEmpty) {
          Get.offAll(()=> HomeScreen());
        }else{
          Get.offAll(()=> const LanguageScreen());
        }
      });
  }
}
