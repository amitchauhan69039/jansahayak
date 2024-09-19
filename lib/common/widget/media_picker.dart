import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:JanSahayak/jan_sahayak.dart';

Future<String?> openImagePicker({VoidCallback? onPickerTap}) async {

  ImageSource? source;
  await Get.bottomSheet(
    BottomSheet(
      onClosing: () {},
      builder: (con) {
        return ImagePickerBox(
          onOptionTap: (value) {
            source = value;
            Get.back();
          },
        );
      },
    ),
  );

  try {
    if (source != null) {
      if (onPickerTap != null) {
        onPickerTap();
      }
      var status = await Permission.camera.status;
      print("status=>${status.isGranted}");
      if (status.isGranted) {
        print("is case");
        XFile? xFile = await ImagePicker().pickImage(source: source!);
        if(xFile != null){
          File? compFile = await compressImage(File(xFile.path));
          return compFile?.path;
        }
      } else {
        print("else case");
        bool isGranted = await _requestCameraPermission();
        print("status=>$isGranted");
        if (isGranted) {
          XFile? xFile = await ImagePicker().pickImage(source: source!);
          if(xFile != null){
            File? compFile = await compressImage(File(xFile.path));
            return compFile?.path;
          }
        }
      }

    }
  } catch (e) {
    print("Message : ${e.toString()}");
  }
  return null;
}

Future<bool> _requestCameraPermission() async {
  var status = await Permission.camera.request();
  print("status1=>${status.isGranted}");
  if (status.isGranted) {
    return true;
  } else {
    return false;
  }
}

openMultiImagePicker({VoidCallback? onPickerTap,Function(ImageSource)? onSelectImage}) async {
  ImageSource? source;
  await Get.bottomSheet(
    BottomSheet(
      onClosing: () {},
      builder: (con) {
        return ImagePickerBox(
          onOptionTap: (value) {
            source = value;
            if(onSelectImage != null){
              onSelectImage(value);
            }
            Get.back();
          },
        );
      },
    ),
  );

  // try {
  //   if (source != null) {
  //     if (onPickerTap != null) {
  //       onPickerTap();
  //     }
  //     else {
  //       if (source == ImageSource.camera) {
  //         XFile? xFile = await ImagePicker().pickImage(source: source!, imageQuality: 70);
  //         // File? comFile = await compressImage(File(xFile!.path));
  //         // return comFile == null ? [] : [comFile.path];
  //         return xFile == null ? [] : [xFile.path];
  //       } else {
  //         List<XFile> list = await ImagePicker().pickMultiImage(imageQuality: 70);
  //         List<String> pathList = [];
  //         for (var xFile in list) {
  //           // File? comFile = await compressImage(File(xFile.path));
  //           // if(comFile != null){
  //           //   pathList.add(comFile.path);
  //           // }
  //           pathList.add(xFile.path);
  //         }
  //         return pathList;
  //       }
  //     }
  //   }
  // } catch (e) {
  //   showErrorMsg(e.toString());
  // }
  return [];
}

Future<void> loadImage(ImageProvider provider) {
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



class ImagePickerBox extends StatelessWidget {
  final Function(ImageSource) onOptionTap;

  const ImagePickerBox({Key? key, required this.onOptionTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBox(
            AssetRes.cameraImage,
            "camera".tr,
                () => onOptionTap(ImageSource.camera),
          ),
          const SizedBox(),
          buildBox(
            AssetRes.galleryImage,
            "gallery".tr,
                () => onOptionTap(ImageSource.gallery),
          ),
        ],
      ),
    );
  }

  Widget buildBox(String image, String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height / 40,
        bottom: Get.height / 60,
      ),
      child: inkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(Get.width / 25),
              decoration: const BoxDecoration(
                color: ColorRes.black,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                image,
                height: Get.width / 12,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: styleW400S16,
            ),
          ],
        ),
      ),
    );
  }
}

class videoPickerBox extends StatelessWidget {
  final Function(ImageSource) onVideoTap;

  const videoPickerBox({Key? key, required this.onVideoTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBox(
            AssetRes.backIcon,
            "camera".tr,
                () => onVideoTap(ImageSource.camera),
          ),
          const SizedBox(),
          buildBox(
            AssetRes.backIcon,
            "video",
                () => onVideoTap(ImageSource.gallery),
          ),
        ],
      ),
    );
  }

  Widget buildBox(String image, String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height / 40,
        bottom: Get.height / 60,
      ),
      child: inkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(Get.width / 25),
              decoration: const BoxDecoration(
                color: ColorRes.black,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                image,
                height: Get.width / 12,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: styleW400S16
            ),
          ],
        ),
      ),
    );
  }
}

Future<File?> compressImage(File? file) async {
  if (file == null) {
    return null;
  }
  Directory directory = await getTemporaryDirectory();
  var byte = await FlutterImageCompress.compressWithList(
    file.absolute.readAsBytesSync(),
    quality: 70,
    rotate: 0,
  );
  File result = File("${directory.path}/${DateTime.now().microsecondsSinceEpoch}.jpg")
    ..writeAsBytesSync(byte);

  final size = result.lengthSync();

  if (size > (1024*1024)) {
    return await compressImage(result);
  } else {
    return result;
  }
}

Future<File> openFile(String url) async {
  final response = await HttpService.getApi(url: url);

  if(response == null){
    return File("");
  }
  Directory? appDir;
  if (Platform.isAndroid) {
    appDir = await getExternalStorageDirectory();
  } else {
    appDir = await getApplicationDocumentsDirectory();
  }

  final localPath = path.join(appDir!.path, url.split('/').last);

  final imageFile = File(localPath);
  return await imageFile.writeAsBytes(response.bodyBytes);
}
