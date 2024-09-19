import 'package:JanSahayak/jan_sahayak.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.put(SplashController());

  @override
  void initState() {
    controller.navigatePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              width: double.infinity,
              height: double.infinity,
              AssetRes.splash_background,
            ),
          ),
          // Centered logo
        ],
      ),
    );
  }
}
