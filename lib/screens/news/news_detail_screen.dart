import 'package:JanSahayak/jan_sahayak.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class NewsDetailScreen extends StatefulWidget {
  final String nid, vid;
  const NewsDetailScreen({super.key,required this.nid,required this.vid});

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  void initState() {
    super.initState();
    controller.getNewsDetails(widget.nid,widget.vid);
  }

  final NewsListController controller = Get.put(NewsListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<NewsListController>(
              id: 'news_detail_screen',
              builder: (controller) {
                return Column(
                  children: [
                    CommonAppbar(title: 'app_name'.tr),
                    Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: StackedLoader(
                          loading: controller.loader,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: getNewsData()
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })),
    );
  }

  Widget getNewsData() {
    if (controller.newsDetailsModel != null &&
        controller.newsDetailsModel!.data != null) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            textAlign: TextAlign.left,
            controller.newsDetailsModel!.data!.title!,
            style: styleW600S15.copyWith(
                fontSize: 16,
                color: ColorRes.black,
                height: 1.1),
          ),
          appSizedBox(height: 10),
          HtmlWidget(controller.newsDetailsModel!.data!.bodyValue!)
        ],
      );
    } else {
      return Container();
    }
  }


}
