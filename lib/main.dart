import 'dart:io';
import 'package:JanSahayak/utils/app_localization.dart';
import 'package:JanSahayak/jan_sahayak.dart';

Future<void> main() async {
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
      title: 'Visitors',
      debugShowCheckedModeBanner: false,
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

