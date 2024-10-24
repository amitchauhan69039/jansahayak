import 'dart:io';
import 'dart:ui';
import 'package:JanSahayak/utils/app_localization.dart';
import 'package:JanSahayak/jan_sahayak.dart';
import 'package:arcgis_maps/arcgis_maps.dart';

Future<void> main() async {
  const apiKey = "AAPTxy8BH1VEsoebNVZXo8HurJWExKZFnEgvpK55Cbu2q45IC9daoyolSDC1eSsfcxHH9rAFoZD2_DJOQB81qudpMY52KrXIPFCvwE-z2toblHPcXKNntXHiy2KI1l_FmG8t32ZfiSpwL2QRwdK3OJOo1zv8g0JVndkYfALkxa1n2jVguDZgGHll0Q8a2nljBWjO7WqBtvWsaKJtrilvpCi_iutTefWlxTLIOHjGetYhqyU.AT1_Lh15k4nW";

  ArcGISEnvironment.apiKey =apiKey;
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  try {
    await PrefService.init();
    HttpOverrides.global = MyHttpOverrides();

  } catch (e) {}

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jan Sahayak',
      debugShowCheckedModeBanner: false,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: ColorRes.appPrimaryColor,
          secondary: ColorRes.appPrimaryColor,
        ),
        //  fontFamily: AssetRes.open_sans,
        useMaterial3: true,
      ),
      navigatorKey: navigationKey,
      locale: getLanStrToLocale(PrefService.getString(PrefKeys.selectedLanguage)),
      translations: AppLocalization(),
      fallbackLocale: const Locale('en', 'US'),
      home: const SplashScreen(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

