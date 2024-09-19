import 'package:JanSahayak/jan_sahayak.dart';
import 'dart:io';

class CropImageScreen extends StatefulWidget {
  final File file;

  const CropImageScreen({Key? key, required this.file}) : super(key: key);

  @override
  State<CropImageScreen> createState() => _CropImageState();
}

class _CropImageState extends State<CropImageScreen> {
  final cropKey = GlobalKey<CropState>();
 // final ChatController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Crop(
                  key: cropKey,
                  image: FileImage(widget.file),
                  aspectRatio: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FloatingActionButton(
                  onPressed: () async {
                    final crop = cropKey.currentState;
                    if (crop?.area == null) {
                      return;
                    }
                    final file = await ImageCrop.cropImage(
                      file: widget.file,
                      area: crop!.area!,
                    );
                   // controller.onMsgSend(isImage: true,resultFile:file);
                  },
                  backgroundColor: ColorRes.white,
                  child: Image.asset(
                    AssetRes.splashLogo,
                    height: 3.h,
                    width: 3.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
