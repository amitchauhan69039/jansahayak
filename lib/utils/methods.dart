import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:JanSahayak/jan_sahayak.dart';
import 'package:url_launcher/url_launcher.dart';


Locale getLanStrToLocale(String lan) {
  if (lan.isEmpty) {
    return const Locale("en", "US");
  }
  String lanCode = lan
      .split('_')
      .first;
  String countryCode = lan
      .split('_')
      .last;
  return Locale(lanCode, countryCode);
}

String getLanLocaleToStr(Locale locale) {
  return "${locale.languageCode}_${locale.countryCode}";
}

Future<void> loadNetworkImage(String image) async {
  await loadAppImage(NetworkImage(image));
}

Future<void> loadAppImage(ImageProvider provider) {
  final config = ImageConfiguration(
    bundle: rootBundle,
    devicePixelRatio: 1,
    platform: defaultTargetPlatform,
  );
  final Completer<void> completer = Completer();
  final ImageStream stream = provider.resolve(config);

  late final ImageStreamListener listener;

  listener = ImageStreamListener((ImageInfo image, bool sync) {
    debugPrint("Image ${image.debugLabel} finished loading");
    completer.complete();
    stream.removeListener(listener);
  }, onError: (dynamic exception, StackTrace? stackTrace) {
    completer.complete();
    stream.removeListener(listener);
    FlutterError.reportError(FlutterErrorDetails(
      context: ErrorDescription('image failed to load'),
      library: 'image resource service',
      exception: exception,
      stack: stackTrace,
      silent: true,
    ));
  });

  stream.addListener(listener);
  return completer.future;
}

const platform = MethodChannel('device_id');

Future<String?> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    try {
      final String? deviceId = await platform.invokeMethod('getDeviceId');
      return deviceId;
    } catch (e) {
      print('Error getting device ID: $e');
      return null;
    }
  }
}

Future<String> getVersionCode() async {
  try {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  } catch (e) {
    print(e.toString());
  }
  return "";
}

Future<String?> getVersionString() async {
  try {
    final result = await PackageInfo.fromPlatform();
    return "${result.version} (${result.buildNumber})";
  } catch (e) {
    // catchToast(e.toString());
  }
  return null;
}

Future<String?> getOSVersionString() async {
  try {
    if (Platform.isAndroid) {
      final result = await DeviceInfoPlugin().androidInfo;
      return "Android (${result.model})";
    } else {
      final result = await DeviceInfoPlugin().iosInfo;
      return "iOS (${result.utsname.machine})";
    }
  } catch (e) {
    // catchToast(e.toString());
  }
  return null;
}

String getFileName(File file) {
  return basename(file.path);
}

Future<void> storeImgInCache(String? imageUrl) async {
  if (imageUrl == null) {
    return;
  }
  try {
    await DefaultCacheManager().downloadFile(
      imageUrl,
    );
  } catch (e) {
    print("errorImage=>${e.toString()}");
    // catchToast(e.toString());
  }
}

Future<bool> isInternetAvailable(Context context) async {
  final List<ConnectivityResult> connectivityResult = await (Connectivity()
      .checkConnectivity());
  print("network ${connectivityResult}");

  if (connectivityResult.contains(ConnectivityResult.mobile)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
    // Ethernet connection available.
    return true;
  } else{
    return false;
  }

}

showSnackbar(Context context,String message){
  var snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);
}

void toastMsg(String msg, {gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(msg: msg, gravity: gravity, timeInSecForIosWeb: 4);
}


bool validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return false;
  }
  else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

Future<void> makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


